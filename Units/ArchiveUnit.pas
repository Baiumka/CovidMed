unit ArchiveUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ConstUnit, PriyomUnit, ClientUnit;

type
  TfmArchive = class(TfmSimpleTable)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTableDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgTableDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function InserEditRow(aMode : TEditMode): Boolean;
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



procedure TfmArchive.dbgTableDblClick(Sender: TObject);
begin
   InserEditRow(emModify);
end;

function TfmArchive.InserEditRow(aMode : TEditMode): Boolean;
var act : TAction;
    fmTemp : TfmPriyom;
    index: integer;
begin
  act := TAction(FMaster.GetModuleAction('fmPriyom'));
  if Assigned(act) and act.Execute then
  begin
    fmTemp := fmPriyom;
    if Assigned(fmTemp) then
    begin
      FEditMode        := aMode;
      FEditRec.mode    := Integer(FEditMode);
      if aMode = emInsert then
        FEditRec.id := 0
      else
        FEditRec.id := zqrTable.FieldByName(API_ID).AsInteger;
        fmTemp.SendParams('OPEN', @FEditRec, zqrTable.FieldByName('pt_id').AsInteger);
    end;
  end;
  Result := True;
end;

procedure TfmArchive.FormActivate(Sender: TObject);
begin
   actRefresh.Execute;
end;

end.
