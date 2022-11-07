unit PationUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ZSqlUpdate, SimpleDialog, ConstUnit, DBCtrls, PationEditUnit;

type
  TfmPationUnit = class(TfmSimpleTable)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function GetSQByDataSet(DataSet: TDataSet): String; override;
    procedure nwTableBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure dbgTableDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPationUnit: TfmPationUnit;

implementation

{$R *.dfm}

procedure TfmPationUnit.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;

  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.pation';
  zqrTable.SortedFields := API_ID;
end;

procedure TfmPationUnit.FormDestroy(Sender: TObject);
begin
  try
     inherited;
   finally
     fmPationUnit := nil;
  end;
end;

function TfmPationUnit.GetSQByDataSet(DataSet: TDataSet): String;
begin
  if (DataSet = zqrTable) then
    Result := 'goods_k.patients_id_seq'
  else
    Result := '';
end;

procedure TfmPationUnit.nwTableBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  dwEdit : TfmPationEdit;
begin
  if Button = nbDelete then
  begin
    if not ConfirmDlg('¬ы действительно хотите удалить пациента?') then
    begin
      Abort;
    end;
  end;
  if Button = nbInsert then
  begin
     dwEdit := TfmPationEdit.Create(Self, 0);
     dwEdit.ShowModal;
     Abort;
  end;

  if Button = nbEdit then
  begin
     dwEdit := TfmPationEdit.Create(Self, zqrTable.FieldByName('id').AsInteger);
     dwEdit.ShowModal;
     Abort;
  end;

end;

procedure TfmPationUnit.dbgTableDblClick(Sender: TObject);
var
  dwEdit : TfmPationEdit;
begin
     dwEdit := TfmPationEdit.Create(Self, zqrTable.FieldByName('id').AsInteger);
     dwEdit.ShowModal;
     Abort;

end;

end.
