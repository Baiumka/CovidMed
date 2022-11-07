unit PationEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, ImgList, ActnList, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, Grids, DBGridEh, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ConstUnit, ComCtrls;

type
  TfmPationEdit = class(TfmSimpleClient)
    edtFio: TDBEditEh;
    btnSave: TBitBtn;
    edtBirthday: TDBDateTimeEditEh;
    grpSex: TGroupBox;
    rbMale: TRadioButton;
    rbFemale: TRadioButton;
    lbl1: TLabel;
    lblAge: TLabel;
    edtPhone: TDBEditEh;
    edtMail: TDBEditEh;
    edtCity: TDBEditEh;
    edtStreet: TDBEditEh;
    grpAdress: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtHouse: TDBEditEh;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    chkWork: TCheckBox;
    edtWork: TDBEditEh;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dbgSick: TDBGridEh;
    dbgRisk: TDBGridEh;
    dbgAllergy: TDBGridEh;
    dbgTablets: TDBGridEh;
    nvTablets: TDBNavigator;
    nvSick: TDBNavigator;
    nvRisk: TDBNavigator;
    nvAllergy: TDBNavigator;
    dsPation: TDataSource;
    zqrPation: TZQuery;
    edtKv: TDBEditEh;
    cbOblast: TDBComboBoxEh;
    dsSick: TDataSource;
    dsRisk: TDataSource;
    dsAllergy: TDataSource;
    dsTablets: TDataSource;
    zqrSick: TZQuery;
    zqrRisk: TZQuery;
    zqrAllergy: TZQuery;
    zqrTablets: TZQuery;
    tvPriyom: TTreeView;
    lbl16: TLabel;
    zqrHistory: TZQuery;
    dsHistory: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBirthdayChange(Sender: TObject);
  private
    { Private declarations }
    editID: Integer;
    procedure LoadPation();
    procedure RefreshReference(const ARef: integer);
  public
    { Public declarations }
    Constructor Create(owner: TForm; id: Integer);
  end;

var
  fmPationEdit: TfmPationEdit;

implementation

uses DateUtils, GlobalDataUnit;

{$R *.dfm}

constructor TfmPationEdit.Create(owner: TForm; id: Integer);
begin
  inherited Create(owner);
  editID := id;
end;

procedure TfmPationEdit.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  RefreshReference(RFR_ALL);
  LoadPation();
  if editID = 0 then
  begin
    zqrPation.Insert;
    zqrPation.Post;
    editID := zqrPation.FieldByName('id').AsInteger;
  end;
end;

procedure TfmPationEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
     inherited;
  finally
     fmPationEdit := nil;
  end;

end;

procedure TfmPationEdit.LoadPation();
begin
    zqrPation.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.pation p WHERE p.id = :id';
    zqrPation.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrPation);
    case zqrPation.FieldByName('sex').AsInteger of
      1 :
      begin
        rbMale.Checked := true;
      end;
      2 :
      begin
        rbFemale.Checked := true;
      end;
    end;
    lblAge.Caption := IntToStr(YearsBetween(Date, zqrPation.FieldByName('birth_date').AsDateTime));
    chkWork.Checked := zqrPation.FieldByName('is_work').AsBoolean;

    zqrSick.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_sick p, ' + SCHEME_NAME +'.sicks s WHERE p.id_pation = :id AND p.id_sick = s.id';
    zqrSick.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrSick);

    zqrRisk.SQL.Text := 'SELECT p.id, s.name FROM ' + SCHEME_NAME +'.pation_risk p, ' + SCHEME_NAME +'.risk s WHERE p.id_pation = :id AND p.id_risk = s.id';
    zqrRisk.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrRisk);

    zqrAllergy.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_allergy p, ' + SCHEME_NAME +'.medical s WHERE p.id_pation = :id AND p.id_medical = s.id';
    zqrAllergy.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrAllergy);

    zqrTablets.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_medical p, ' + SCHEME_NAME +'.medical s WHERE p.id_pation = :id AND p.id_medical = s.id';
    zqrTablets.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrTablets);

    zqrHistory.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_pation_history(:id_pation);';
    zqrHistory.ParamByName('id_pation').AsInteger := editID;
    FMaster.GetData(zqrHistory);
    dmGlobalData.FillTree(zqrHistory, tvPriyom);
end;


procedure TfmPationEdit.edtBirthdayChange(Sender: TObject);
begin
  lblAge.Caption := IntToStr(YearsBetween(Date, edtBirthday.Value));
  lblAge.Visible := true;
end;

procedure TfmPationEdit.RefreshReference(const ARef: integer);
begin
  //dmGlobalData.ClearCash(ARef);
  if ARef in [RFR_ALL, RFR_OBLAST] then
  begin
    dmGlobalData.LoadFromCashKeyItem(KW_OBLAST, QR_OBLAST_NAME, cbOblast, False);
  end;


end;

end.
