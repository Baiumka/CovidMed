unit SelectUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ImgList, ActnList, DBNewNav, Grids, DBGridEh,
  Mask, DBCtrlsEh, ExtCtrls;

type
  TfmSelect = class(TfmSimpleTable)
    btnOk: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbgTableDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    selectedId: integer;
  end;

var
  fmSelect: TfmSelect;

implementation

{$R *.dfm}

procedure TfmSelect.FormCreate(Sender: TObject);
var
 wSumm : integer;
 i : integer;
begin
  inherited;
  AutoRefresh := True;
  //zqrTable.SQL.Text := '';

  dbgTable.Columns[0].Color := clInfoBk;
  dbgTable.Columns[0].ReadOnly := True;
  dbgTable.Columns[0].Width := 70;
  dbgTable.Columns[0].FieldName := 'id';
  dbgTable.Columns[0].Title.Caption := '¹';
   wSumm := 0;
  for i := 0 to dbgTable.Columns.Count-1 do
  begin
      wSumm := wSumm + dbgTable.Columns[i].Width;
      dbgTable.Columns[i].Title.TitleButton := True;
  end;

  Self.Width := wSumm+50;

end;

procedure TfmSelect.btnOkClick(Sender: TObject);
begin
  selectedId := zqrTable.FieldByName('id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfmSelect.dbgTableDblClick(Sender: TObject);
begin
  btnOkClick(Sender);
end;

procedure TfmSelect.FormDestroy(Sender: TObject);
begin
  try
     inherited;
   finally
     fmSelect := nil;
   end;

end;

end.
