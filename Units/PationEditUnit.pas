unit PationEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, ImgList, ActnList, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, Grids, DBGridEh, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ConstUnit, ComCtrls, SelectSickUnit,
  ZSqlUpdate, SelectMedicalUnit, SelectRiskUnit, ShortPriyomUnit;

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
    zuqSick: TZUpdateSQL;
    zuqRisk: TZUpdateSQL;
    zuqAllergy: TZUpdateSQL;
    zuqTablets: TZUpdateSQL;
    btnPrintHistory: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBirthdayChange(Sender: TObject);
    procedure nvSickClick(Sender: TObject; Button: TNavigateBtn);
    procedure nvRiskClick(Sender: TObject; Button: TNavigateBtn);
    procedure nvAllergyClick(Sender: TObject; Button: TNavigateBtn);
    procedure nvTabletsClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnSaveClick(Sender: TObject);
    procedure chkWorkClick(Sender: TObject);
    procedure tvPriyomDblClick(Sender: TObject);
    procedure btnPrintHistoryClick(Sender: TObject);
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
    zuqSick.DeleteSQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_sick s WHERE s.id = :id;';

    zqrRisk.SQL.Text := 'SELECT p.id, s.name FROM ' + SCHEME_NAME +'.pation_risk p, ' + SCHEME_NAME +'.risk s WHERE p.id_pation = :id AND p.id_risk = s.id';
    zqrRisk.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrRisk);
    zuqRisk.DeleteSQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_risk s WHERE s.id = :id;';


    zqrAllergy.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_allergy p, ' + SCHEME_NAME +'.medical s WHERE p.id_pation = :id AND p.id_medical = s.id';
    zqrAllergy.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrAllergy);
    zuqAllergy.DeleteSQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_allergy s WHERE s.id = :id;';


    zqrTablets.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_medical p, ' + SCHEME_NAME +'.medical s WHERE p.id_pation = :id AND p.id_medical = s.id';
    zqrTablets.ParamByName('id').AsInteger := editID;
    FMaster.GetData(zqrTablets);
    zuqTablets.DeleteSQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_medical s WHERE s.id = :id;';

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

procedure TfmPationEdit.nvSickClick(Sender: TObject; Button: TNavigateBtn);
var
    dwSelectSick: TfmSelectSick;
begin
  if Button = nbInsert then
  begin
     dwSelectSick := TfmSelectSick.Create(Self);
     dwSelectSick.ShowModal;
     if dwSelectSick.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.pation_sick (id_pation, id_sick) VALUES (:id_pation, :id_sick);';
          dmGlobalData.zqrAny.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_sick').AsInteger := dwSelectSick.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrSick.Refresh;
     end;
     Abort();
  end;
end;

procedure TfmPationEdit.nvRiskClick(Sender: TObject; Button: TNavigateBtn);
var
    dwSelectRisk: TfmSelectRisk;
begin
  if Button = nbInsert then
  begin
     dwSelectRisk := TfmSelectRisk.Create(Self);
     dwSelectRisk.ShowModal;
     if dwSelectRisk.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.pation_risk (id_pation, id_risk) VALUES (:id_pation, :id_risk);';
          dmGlobalData.zqrAny.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_risk').AsInteger := dwSelectRisk.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrRisk.Refresh;
     end;
     Abort();
  end;
end;

procedure TfmPationEdit.nvAllergyClick(Sender: TObject;
  Button: TNavigateBtn);
var
    dwSelectMedical: TfmSelectMedical;
begin
  if Button = nbInsert then
  begin
     dwSelectMedical := TfmSelectMedical.Create(Self);
     dwSelectMedical.ShowModal;
     if dwSelectMedical.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.pation_allergy (id_pation, id_medical) VALUES (:id_pation, :id_medical);';
          dmGlobalData.zqrAny.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_medical').AsInteger := dwSelectMedical.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrAllergy.Refresh;
     end;
     Abort();
  end;
end;

procedure TfmPationEdit.nvTabletsClick(Sender: TObject;
  Button: TNavigateBtn);
var
    dwSelectMedical: TfmSelectMedical;
begin
  if Button = nbInsert then
  begin
     dwSelectMedical := TfmSelectMedical.Create(Self);
     dwSelectMedical.ShowModal;
     if dwSelectMedical.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.pation_medical (id_pation, id_medical) VALUES (:id_pation, :id_medical);';
          dmGlobalData.zqrAny.ParamByName('id_pation').AsInteger := zqrPation.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_medical').AsInteger := dwSelectMedical.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrTablets.Refresh;
     end;
     Abort();
  end;
end;

procedure TfmPationEdit.btnSaveClick(Sender: TObject);
begin
  if rbMale.Checked then zqrPation.FieldByName('sex').AsInteger := 1;
  if rbFemale.Checked then zqrPation.FieldByName('sex').AsInteger := 2;
  zqrPation.FieldByName('is_work').AsBoolean := chkWork.Checked;
  if chkWork.Checked then zqrPation.FieldByName('work').AsString := '';
  zqrPation.CommitUpdates;


end;

procedure TfmPationEdit.chkWorkClick(Sender: TObject);
begin
  edtWork.Enabled := not chkWork.Checked;

end;

procedure TfmPationEdit.tvPriyomDblClick(Sender: TObject);
var
  kek: string;
  outList: TStrings;
  dwPriyom: TfmShortPriyom;
begin
  if Assigned(tvPriyom.Selected) then
    if AnsiPos('Прийом', tvPriyom.Selected.Text) <> 0 then
    begin
      outList := TStringList.Create;
      Split('№', tvPriyom.Selected.Text, outList);
      Split(' ', outList[1], outList);
      kek := outList[0];
      dwPriyom := TfmShortPriyom.Create(Self, StrToInt(kek));
      dwPriyom.ShowModal;
    end;
end;

procedure TfmPationEdit.btnPrintHistoryClick(Sender: TObject);
begin
  FMaster.Report.ShowReport('history', [zqrHistory]);
end;

end.
