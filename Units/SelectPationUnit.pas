unit SelectPationUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SelectUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, StdCtrls, Buttons, DBNewNav, Grids, DBGridEh, Mask,
  DBCtrlsEh, ExtCtrls, ConstUnit;

type
  TfmSelectPation = class(TfmSelect)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSelectPation: TfmSelectPation;

implementation

{$R *.dfm}

procedure TfmSelectPation.FormCreate(Sender: TObject);
begin
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.pation';
  inherited;

end;

end.
