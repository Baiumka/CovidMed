unit SelectRiskUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SelectUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, StdCtrls, Buttons, DBNewNav, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, ConstUnit;

type
  TfmSelectRisk = class(TfmSelect)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectRisk: TfmSelectRisk;

implementation

{$R *.dfm}

procedure TfmSelectRisk.FormCreate(Sender: TObject);
begin
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.risk';
  inherited;
end;

end.
