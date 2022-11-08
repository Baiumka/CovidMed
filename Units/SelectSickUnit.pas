unit SelectSickUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SelectUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, StdCtrls, Buttons, DBNewNav, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, ConstUnit;

type
  TfmSelectSick = class(TfmSelect)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectSick: TfmSelectSick;

implementation

{$R *.dfm}

procedure TfmSelectSick.FormCreate(Sender: TObject);
begin
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.sicks';
  inherited;
end;

end.
