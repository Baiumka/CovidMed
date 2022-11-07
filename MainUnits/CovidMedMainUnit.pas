unit CovidMedMainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainUnit, ImgList, Menus, ActnList, StdCtrls, Mask, DBCtrlsEh,
  ComCtrls, Grids, DBGridEh, ExtCtrls, ConstUnit, frxClass, ClientUnit,
  Buttons, UsersUnit;

type
  TfmCovidMedMain = class(TfmMain)
    actUsers: TAction;
    actPations: TAction;
    actPriyom: TAction;
    actArchive: TAction;
    actMedical: TAction;
    actSicks: TAction;
    actRisk: TAction;
    procedure actUsersExecute(Sender: TObject);
    procedure actPationsExecute(Sender: TObject);
    procedure actPriyomExecute(Sender: TObject);
    procedure actArchiveExecute(Sender: TObject);
    procedure actMedicalExecute(Sender: TObject);
    procedure actSicksExecute(Sender: TObject);
    procedure actRiskExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCovidMedMain: TfmCovidMedMain;



implementation

uses  Math, PationUnit, PriyomUnit, ArchiveUnit, MedicalUnit, SicksUnit,
  RiskUnit;


{$R *.dfm}



procedure TfmCovidMedMain.actUsersExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmUserRole), TfmUserRole, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actPationsExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmPationUnit), TfmPationUnit, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actPriyomExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmPriyom), TfmPriyom, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actArchiveExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmArchive), TfmArchive, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actMedicalExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmMedical), TfmMedical, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actSicksExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmSicks), TfmSicks, TAction(Sender).Caption);
end;

procedure TfmCovidMedMain.actRiskExecute(Sender: TObject);
begin
  CreateAndShowChildForm(TForm(fmRisk), TfmRisk, TAction(Sender).Caption);
end;

end.
