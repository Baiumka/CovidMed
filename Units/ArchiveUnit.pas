unit ArchiveUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ConstUnit;

type
  TfmArchive = class(TfmSimpleTable)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTableDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmArchive: TfmArchive;

implementation

{$R *.dfm}

procedure TfmArchive.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := true;
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_all_priyom();';
end;

procedure TfmArchive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
     inherited;
  finally
     fmArchive := nil;
  end;

end;

procedure TfmArchive.dbgTableDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if zqrTable.FieldByName('status').AsString = 'Завершенно' then dbgTable.Canvas.Brush.Color :=  clMoneyGreen
    else dbgTable.Canvas.Brush.Color := clLtGray;

    dbgTable.Canvas.Font.Color := clBlack;
    dbgTable.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



end.
