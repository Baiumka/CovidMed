unit PriyomUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, ImgList, ActnList, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, SelectPationUnit, ConstUnit,
  ComCtrls, SimpleDialog;

type
  TfmPriyom = class(TfmSimpleClient)
    edtFio: TDBEditEh;
    zqrPation: TZQuery;
    dsPation: TDataSource;
    grpPationInfo: TGroupBox;
    tvPriyom: TTreeView;
    btnSave: TBitBtn;
    edtTrouble: TDBEditEh;
    edtResult: TDBEditEh;
    lbl1: TLabel;
    lbl2: TLabel;
    zqrPriyom: TZQuery;
    dsPriyom: TDataSource;
    lbl3: TLabel;
    pgcPriyom: TPageControl;
    tsMain: TTabSheet;
    btnStart: TButton;
    chkHealth: TCheckBox;
    edtHeal: TDBEditEh;
    zqrHistory: TZQuery;
    dsHistory: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure edtFioEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SavePriyom();
    procedure LoadPriyom(pID: Integer; pationID: Integer);
  public
    { Public declarations }
    function SendParams(const AKey: string; const ARecord: Pointer; const pationID: Integer): Boolean;
  end;

var
  fmPriyom: TfmPriyom;
  is_started: Boolean;

implementation

uses GlobalDataUnit;

{$R *.dfm}

procedure TfmPriyom.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrPation.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.pation WHERE id = :id';
  zqrPriyom.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_new_priyom_by_pation(:id, :id_pation, :id_user);';
  zqrHistory.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_pation_history(:id_pation);';
end;

procedure TfmPriyom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if is_started then
  begin
    if ConfirmDlg('Ви ще не завершили прийом, ви дійсно бажаете вийти?') then
    begin
       try
         inherited;
       finally
         fmPriyom := nil;
       end;
    end
    else
    begin
      abort;
      exit;
    end;
  end
  else
  begin
    try
      inherited;
    finally
      fmPriyom := nil;
    end;
  end;

end;

procedure TfmPriyom.FormDestroy(Sender: TObject);
begin
  try
    inherited;
  finally
    fmPriyom := nil;
  end;
end;

procedure TfmPriyom.edtFioEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
     dwSelectPation: TfmSelectPation;
begin
     dwSelectPation := TfmSelectPation.Create(Self);
     dwSelectPation.ShowModal;
     if dwSelectPation.ModalResult = mrOk then
     begin
         zqrPation.ParamByName('id').AsInteger := dwSelectPation.selectedId;
         if FMaster.GetData(zqrPation) then
         begin
           btnStart.Enabled := true;
         end;
     end;
end;



procedure TfmPriyom.btnStartClick(Sender: TObject);
begin
  LoadPriyom(0, zqrPation.ParamByName('id').AsInteger);
end;

procedure TfmPriyom.btnSaveClick(Sender: TObject);
begin
    if ConfirmDlg('Ви впевнены шо прийом завершено?') then
    begin
       SavePriyom;
       is_started := false;
       self.Close;
    end;

end;

procedure TfmPriyom.SavePriyom();
begin
   dmGlobalData.zqrAny.SQL.Text := 'SELECT ' + SCHEME_NAME +'.p_update_priyom (:id,' + #13#10 +
                                   ':trouble,' + #13#10 +
                                   ':heal,' + #13#10 +
                                   ':result,' + #13#10 +
                                   ':is_health' + #13#10 +
                                   ')';
   dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrPriyom.FieldByName('id').AsInteger;
   dmGlobalData.zqrAny.ParamByName('trouble').Value := zqrPriyom.FieldByName('trouble').Value;
   dmGlobalData.zqrAny.ParamByName('result').Value := zqrPriyom.FieldByName('result').Value;
   dmGlobalData.zqrAny.ParamByName('heal').Value := zqrPriyom.FieldByName('heal').Value;
   dmGlobalData.zqrAny.ParamByName('is_health').AsBoolean := chkHealth.Checked;
   FMaster.GetData(dmGlobalData.zqrAny, false);
end;

function TfmPriyom.SendParams(const AKey: string; const ARecord: Pointer; const pationID: Integer): Boolean;
var PRec : ^TEditRec;
    vDataSet: TDataSet;
    i: integer;
begin
  inherited SendParams(AKey,ARecord);
  if AKey = 'OPEN' then
  begin
    PRec := ARecord;
    LoadPriyom(PRec.id, pationID);
  end;
end;

procedure TfmPriyom.LoadPriyom(pID: Integer; pationID: Integer);
begin
  zqrPriyom.ParamByName('id').AsInteger := pID;
  zqrPriyom.ParamByName('id_pation').AsInteger := pationID;
  zqrPriyom.ParamByName('id_user').AsInteger := dmGlobalData.UserInfo().id;
  if FMaster.GetData(zqrPriyom) then
  begin
     grpPationInfo.Visible := True;
     grpPationInfo.Enabled := True;
     pgcPriyom.Visible := True;
     pgcPriyom.Enabled := True;
     btnSave.Visible := True;
     btnSave.Enabled := True;
     zqrHistory.ParamByName('id_pation').AsInteger := pationID;
     FMaster.GetData(zqrHistory);
     dmGlobalData.FillTree(zqrHistory, tvPriyom);
     btnStart.Enabled := false;
     is_started := true;
  end;

end;

end.
