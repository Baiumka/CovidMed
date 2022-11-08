unit SelectMedicalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SelectUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, StdCtrls, Buttons, DBNewNav, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, ConstUnit;

type
  TfmSelectMedical = class(TfmSelect)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectMedical: TfmSelectMedical;

implementation

{$R *.dfm}

procedure TfmSelectMedical.FormCreate(Sender: TObject);
begin
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.medical';
  inherited;
end;

end.
