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
    procedure actUsersExecute(Sender: TObject);
    procedure actPationsExecute(Sender: TObject);
    procedure actPriyomExecute(Sender: TObject);
    procedure actArchiveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCovidMedMain: TfmCovidMedMain;



implementation

uses  Math, PationUnit, PriyomUnit, ArchiveUnit;


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
  CreateAndShowChildForm(TForm(fmArchive), TfmArchive, TAction(Sender).Caption);;
end;

end.
