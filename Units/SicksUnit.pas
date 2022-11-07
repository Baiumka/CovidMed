unit SicksUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ConstUnit;

type
  TfmSicks = class(TfmSimpleTable)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetSQByDataSet(DataSet: TDataSet): String; override;
  public
    { Public declarations }
  end;

var
  fmSicks: TfmSicks;

implementation

{$R *.dfm}

procedure TfmSicks.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.sicks';
end;

procedure TfmSicks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
     inherited;
   finally
     fmSicks := nil;
   end;

end;

function TfmSicks.GetSQByDataSet(DataSet: TDataSet): String;
begin
  if (DataSet = zqrTable) then
    Result := '' + SCHEME_NAME +'.sicks_id_seq'
  else
    Result := '';
end;



end.
