unit SelectOznakiUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SelectUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, StdCtrls, Buttons, DBNewNav, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, ConstUnit;

type
  TfmSelectOznaki = class(TfmSelect)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectOznaki: TfmSelectOznaki;

implementation

{$R *.dfm}

procedure TfmSelectOznaki.FormCreate(Sender: TObject);
begin
  inherited;
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.oznaki';
end;

end.
