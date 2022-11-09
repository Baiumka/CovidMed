unit PriyomUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, ImgList, ActnList, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, SelectPationUnit, ConstUnit,
  ComCtrls, SimpleDialog, Grids, DBGridEh, DateUtils, DBCtrls, SelectOznakiUnit, SelectRiskUnit, SelectSickUnit,
  SelectMedicalUnit;

type
  TfmPriyom = class(TfmSimpleClient)
    edtFio: TDBEditEh;
    zqrPation: TZQuery;
    dsPation: TDataSource;
    grpPationInfo: TGroupBox;
    tvPriyom: TTreeView;
    btnSave: TBitBtn;
    zqrPriyom: TZQuery;
    dsPriyom: TDataSource;
    pgcPriyom: TPageControl;
    tsPation: TTabSheet;
    btnStart: TButton;
    zqrHistory: TZQuery;
    dsHistory: TDataSource;
    edtDate: TDBDateTimeEditEh;
    edtBirthDate: TDBDateTimeEditEh;
    edtCovidDate: TDBDateTimeEditEh;
    edtDiagnostic: TDBEditEh;
    edtTrouble: TDBEditEh;
    grpRepeat: TGroupBox;
    rbRepeatYes: TRadioButton;
    rbRepeatNo: TRadioButton;
    grpBad: TGroupBox;
    rbBadYes: TRadioButton;
    rbBadNo: TRadioButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lblAge: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    tsAnames: TTabSheet;
    edtCSS: TDBEditEh;
    edtSpO: TDBEditEh;
    edtBreath: TDBEditEh;
    edtTemp: TDBEditEh;
    grpArtTisk: TGroupBox;
    rbNormal: TRadioButton;
    rbGypo: TRadioButton;
    rbGyper: TRadioButton;
    cbPnev: TDBComboBoxEh;
    dbgOznaki: TDBGridEh;
    dbgSick: TDBGridEh;
    dbgRisk: TDBGridEh;
    tsResult: TTabSheet;
    cbHardLevel: TDBComboBoxEh;
    cbHospital: TDBComboBoxEh;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edtResult: TDBEditEh;
    edtDopResult: TDBEditEh;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    tsHeal: TTabSheet;
    dbgHeal: TDBGridEh;
    edtDopHeal: TDBEditEh;
    grpNext: TGroupBox;
    rbNextYes: TRadioButton;
    rbNextNo: TRadioButton;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    edtNextDate: TDBDateTimeEditEh;
    lbl18: TLabel;
    lblDoc: TLabel;
    dsOznaki: TDataSource;
    zqrOznaki: TZQuery;
    zqrSick: TZQuery;
    zqrRisk: TZQuery;
    dsSick: TDataSource;
    dsRisk: TDataSource;
    btnAddOznaki: TButton;
    btnDelOznaki: TButton;
    btnAddSick: TButton;
    btnAddRisk: TButton;
    btnSickDel: TButton;
    btnRiskDel: TButton;
    zqrResult: TZQuery;
    zqrDopResult: TZQuery;
    dsDopResult: TDataSource;
    dsResult: TDataSource;
    btnAddMedical: TButton;
    btnMedicalDel: TButton;
    dsMedical: TDataSource;
    zqrMedical: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure edtFioEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBirthDateChange(Sender: TObject);
    procedure rbRepeatYesClick(Sender: TObject);
    procedure rbRepeatNoClick(Sender: TObject);
    procedure btnAddOznakiClick(Sender: TObject);
    procedure btnDelOznakiClick(Sender: TObject);
    procedure btnAddSickClick(Sender: TObject);
    procedure btnAddRiskClick(Sender: TObject);
    procedure btnSickDelClick(Sender: TObject);
    procedure btnRiskDelClick(Sender: TObject);
    procedure edtResultEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtDopResultEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure btnAddMedicalClick(Sender: TObject);
    procedure btnMedicalDelClick(Sender: TObject);
  private
    { Private declarations }
    procedure SavePriyom();
    procedure LoadPriyom(pID: Integer; pationID: Integer);
    procedure RefreshReference(const ARef: integer);
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

  edtDate.Value := Date;
  RefreshReference(RFR_ALL);
  pgcPriyom.ActivePage := tsPation;
end;

procedure TfmPriyom.RefreshReference(const ARef: integer);
begin
  if ARef in [RFR_ALL, RFR_PNEV] then
  begin
    dmGlobalData.LoadFromCashKeyItem(KW_PNEV, QR_PNEV_NAME, cbPnev, False);
  end;
  if ARef in [RFR_ALL, RFR_LEVEL] then
  begin
    dmGlobalData.LoadFromCashKeyItem(KW_LEVEL, QR_LEVEL_NAME, cbHardLevel, False);
  end;
  if ARef in [RFR_ALL, RFR_HOSPITAL] then
  begin
    dmGlobalData.LoadFromCashKeyItem(KW_HOSPITAL, QR_HOSPITAL_NAME, cbHospital, False);
  end;


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
//   dmGlobalData.zqrAny.ParamByName('is_health').AsBoolean := chkHealth.Checked;
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
     edtFio.Enabled := False;
     rbRepeatYes.Checked := zqrPriyom.FieldByName('is_again').AsBoolean;
     rbRepeatNo.Checked := not zqrPriyom.FieldByName('is_again').AsBoolean;
     grpBad.Visible := rbRepeatYes.Checked;
     rbBadYes.Checked := zqrPriyom.FieldByName('is_bad').AsBoolean;
     rbBadNo.Checked := not zqrPriyom.FieldByName('is_bad').AsBoolean;
     case zqrPriyom.FieldByName('art_tisk').AsInteger of
      1 :
      begin
        rbNormal.Checked := true;
      end;
      2 :
      begin
        rbGypo.Checked := true;
      end;
      3 :
      begin
        rbGyper.Checked := true;
      end;
     end;
    rbNextYes.Checked := zqrPriyom.FieldByName('is_next').AsBoolean;
    rbNextNo.Checked := not zqrPriyom.FieldByName('is_next').AsBoolean;

    zqrOznaki.SQL.Text := 'SELECT p.id, s.name FROM ' + SCHEME_NAME +'.priyom_oznaki p, ' + SCHEME_NAME +'.oznaki s WHERE p.id_priyom = :id AND p.id_oznaki = s.id';
    zqrOznaki.ParamByName('id').AsInteger := zqrPriyom.FieldByName('id').AsInteger;
    FMaster.GetData(zqrOznaki);

    zqrSick.SQL.Text := 'SELECT p.id, s.code, s.name FROM ' + SCHEME_NAME +'.pation_sick p, ' + SCHEME_NAME +'.sicks s WHERE p.id_pation = :id AND p.id_sick = s.id';
    zqrSick.ParamByName('id').AsInteger := zqrPation.FieldByName('id').AsInteger;
    FMaster.GetData(zqrSick);

    zqrRisk.SQL.Text := 'SELECT p.id, s.name FROM ' + SCHEME_NAME +'.pation_risk p, ' + SCHEME_NAME +'.risk s WHERE p.id_pation = :id AND p.id_risk = s.id';
    zqrRisk.ParamByName('id').AsInteger := zqrPation.FieldByName('id').AsInteger;;
    FMaster.GetData(zqrRisk);

    dmGlobalData.zqrAny.SQL.Text := 'SELECT fio FROM ' + SCHEME_NAME +'.users WHERE id = :id';
    dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrPriyom.FieldByName('id_user').AsInteger;
    FMaster.GetData(dmGlobalData.zqrAny);
    lblDoc.Caption := dmGlobalData.zqrAny.FieldByName('fio').AsString;
  end;

end;

procedure TfmPriyom.edtBirthDateChange(Sender: TObject);
begin
  lblAge.Caption := IntToStr(YearsBetween(Date, edtBirthDate.Value));
  lblAge.Visible := true;
end;

procedure TfmPriyom.rbRepeatYesClick(Sender: TObject);
begin
   grpBad.Visible := rbRepeatYes.Checked;
end;

procedure TfmPriyom.rbRepeatNoClick(Sender: TObject);
begin
  grpBad.Visible := rbRepeatYes.Checked;
end;

procedure TfmPriyom.btnAddOznakiClick(Sender: TObject);
var
    dwSelectOznaki: TfmSelectOznaki;
begin
     dwSelectOznaki := TfmSelectOznaki.Create(Self);
     dwSelectOznaki.ShowModal;
     if dwSelectOznaki.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.priyom_oznaki (id_priyom, id_oznaki) VALUES (:id_priyom, :id_oznaki);';
          dmGlobalData.zqrAny.ParamByName('id_priyom').AsInteger := zqrPriyom.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_oznaki').AsInteger := dwSelectOznaki.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrOznaki.Refresh;
     end;
end;

procedure TfmPriyom.btnDelOznakiClick(Sender: TObject);
begin
   dmGlobalData.zqrAny.SQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.priyom_oznaki WHERE id = :id;';
   dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrOznaki.FieldByName('id').AsInteger;
   FMaster.GetData(dmGlobalData.zqrAny, false);
   zqrOznaki.Refresh;
end;

procedure TfmPriyom.btnAddSickClick(Sender: TObject);
var
    dwSelectSick: TfmSelectSick;
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
end;

procedure TfmPriyom.btnAddRiskClick(Sender: TObject);
var
    dwSelectRisk: TfmSelectRisk;
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
end;

procedure TfmPriyom.btnSickDelClick(Sender: TObject);
begin
  dmGlobalData.zqrAny.SQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_sick s WHERE s.id = :id;';
  dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrSick.FieldByName('id').AsInteger;
  FMaster.GetData(dmGlobalData.zqrAny, false);
  zqrSick.Refresh;
end;

procedure TfmPriyom.btnRiskDelClick(Sender: TObject);
begin
  dmGlobalData.zqrAny.SQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.pation_risk s WHERE s.id = :id;';
  dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrRisk.FieldByName('id').AsInteger;
  FMaster.GetData(dmGlobalData.zqrAny, false);
  zqrRisk.Refresh;
end;

procedure TfmPriyom.edtResultEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
    dwSelectSick: TfmSelectSick;
begin
     dwSelectSick := TfmSelectSick.Create(Self);
     dwSelectSick.ShowModal;
     if dwSelectSick.ModalResult = mrOk then
     begin
          zqrResult.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.sicks WHERE id = :id';
          zqrResult.ParamByName('id').AsInteger := dwSelectSick.selectedID;
          FMaster.GetData(zqrResult);
          //zqrPriyom.FieldByName('id_result').AsInteger := dwSelectSick.selectedID;
     end;
end;

procedure TfmPriyom.edtDopResultEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
     dwSelectSick: TfmSelectSick;
begin
     dwSelectSick := TfmSelectSick.Create(Self);
     dwSelectSick.ShowModal;
     if dwSelectSick.ModalResult = mrOk then
     begin
          zqrDopResult.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.sicks WHERE id = :id';
          zqrDopResult.ParamByName('id').AsInteger := dwSelectSick.selectedID;
          FMaster.GetData(zqrDopResult);
          //zqrPriyom.FieldByName('id_dop_result').AsInteger := dwSelectSick.selectedID;
     end;
end;

procedure TfmPriyom.btnAddMedicalClick(Sender: TObject);
var
    dwSelectMedical: TfmSelectMedical;
begin
     dwSelectMedical := TfmSelectMedical.Create(Self);
     dwSelectMedical.ShowModal;
     if dwSelectMedical.ModalResult = mrOk then
     begin
          dmGlobalData.zqrAny.SQL.Text := 'INSERT INTO ' + SCHEME_NAME +'.priyom_medical (id_priyom, id_medical) VALUES (:id_priyom, :id_medical);';
          dmGlobalData.zqrAny.ParamByName('id_priyom').AsInteger := zqrPation.FieldByName('id').AsInteger;
          dmGlobalData.zqrAny.ParamByName('id_medical').AsInteger := dwSelectMedical.selectedID;
          FMaster.GetData(dmGlobalData.zqrAny, false);
          zqrMedical.Refresh;
     end;
end;

procedure TfmPriyom.btnMedicalDelClick(Sender: TObject);
begin
  dmGlobalData.zqrAny.SQL.Text := 'DELETE FROM ' + SCHEME_NAME +'.priyom_medical s WHERE s.id = :id;';
  dmGlobalData.zqrAny.ParamByName('id').AsInteger := zqrMedical.FieldByName('id').AsInteger;
  FMaster.GetData(dmGlobalData.zqrAny, false);
  zqrMedical.Refresh;
end;

end.
