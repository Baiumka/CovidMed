unit RiskUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ConstUnit;

type
  TfmRisk = class(TfmSimpleTable)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetSQByDataSet(DataSet: TDataSet): String; override;
  end;

var
  fmRisk: TfmRisk;

implementation

{$R *.dfm}

procedure TfmRisk.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.risk';
end;

procedure TfmRisk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
     inherited;
  finally
     fmRisk := nil;
  end;
end;

function TfmRisk.GetSQByDataSet(DataSet: TDataSet): String;
begin
  if (DataSet = zqrTable) then
    Result := '' + SCHEME_NAME +'.risk_id_seq'
  else
    Result := '';
end;

end.
