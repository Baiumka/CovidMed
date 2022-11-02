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
  public
    { Public declarations }
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
  AutoRefresh := False;
  zqrPation.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.pation WHERE id = :id';
  zqrPriyom.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_new_priyom_by_pation(:id_pation, :id_user);';
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
var
  a_id: integer;
  headNode: TTreeNode;
  askNode: TTreeNode;
  priNode: TTreeNode;
  nodeText: string;

begin
  zqrPriyom.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
  zqrPriyom.ParamByName('id_user').AsInteger := dmGlobalData.UserInfo().id;
  if FMaster.GetData(zqrPriyom) then
  begin
     grpPationInfo.Visible := True;
     grpPationInfo.Enabled := True;
     pgcPriyom.Visible := True;
     pgcPriyom.Enabled := True;
     btnSave.Visible := True;
     btnSave.Enabled := True;
     zqrHistory.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
     FMaster.GetData(zqrHistory);
     a_id := 0;
     zqrHistory.First;
     while not zqrHistory.Eof do
     begin
       if a_id <> zqrHistory.FieldByName('ask_id').AsInteger then
       begin
         headNode := TTreeNode.Create(tvPriyom.Items);
         nodeText := 'Звернення №' + IntToStr(a_id) + ' Дата: ' + DateToStr(zqrHistory.FieldByName('ask_date').AsDateTime);
         askNode := tvPriyom.Items.Add(headNode, nodeText);
         a_id := zqrHistory.FieldByName('ask_id').AsInteger;
       end;

       nodeText := 'Прийом №' + IntToStr(zqrHistory.FieldByName('pri_id').AsInteger) + ' Дата: ' + DateToStr(zqrHistory.FieldByName('pri_date').AsDateTime);
       priNode := tvPriyom.Items.AddChild(askNode, nodeText);

       nodeText := 'Лікар: ' + zqrHistory.FieldByName('doc_fio').AsString;
       tvPriyom.Items.AddChild(priNode, nodeText);
       nodeText := 'Скарги: ' + zqrHistory.FieldByName('pri_trouble').AsString;
       tvPriyom.Items.AddChild(priNode, nodeText);
       nodeText := 'Лікування: ' + zqrHistory.FieldByName('pri_heal').AsString;
       tvPriyom.Items.AddChild(priNode, nodeText);
       nodeText := 'Результат: ' + zqrHistory.FieldByName('pri_result').AsString;
       tvPriyom.Items.AddChild(priNode, nodeText);

       zqrHistory.Next;
     end;
     btnStart.Enabled := false;
     is_started := true;
  end;

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
                                   ':is_end' + #13#10 +
                                   ')';
   dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrPriyom.FieldByName('id').AsInteger;
   dmGlobalData.zqrAny.ParamByName('trouble').Value := zqrPriyom.FieldByName('trouble').Value;
   dmGlobalData.zqrAny.ParamByName('result').Value := zqrPriyom.FieldByName('result').Value;
   dmGlobalData.zqrAny.ParamByName('heal').Value := zqrPriyom.FieldByName('heal').Value;
   dmGlobalData.zqrAny.ParamByName('is_end').AsBoolean := chkHealth.Checked;
   FMaster.GetData(dmGlobalData.zqrAny, false);
end;



end.
