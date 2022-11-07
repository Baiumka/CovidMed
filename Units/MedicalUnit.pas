unit MedicalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TableUnit, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ImgList, ActnList, DBNewNav, Grids, DBGridEh, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls, ConstUnit, DBCtrls, SimpleDialog;

type
  TfmMedical = class(TfmSimpleTable)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure nwTableBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    function GetSQByDataSet(DataSet: TDataSet): String; override;
  public
    { Public declarations }
  end;

var
  fmMedical: TfmMedical;

implementation

{$R *.dfm}

procedure TfmMedical.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrTable.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.medical';
end;



procedure TfmMedical.FormDestroy(Sender: TObject);
begin
  try
     inherited;
   finally
     fmMedical := nil;
   end;
end;

function TfmMedical.GetSQByDataSet(DataSet: TDataSet): String;
begin
  if (DataSet = zqrTable) then
    Result := '' + SCHEME_NAME +'.medical_id_seq'
  else
    Result := '';
end;

procedure TfmMedical.nwTableBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    if not ConfirmDlg('¬и д≥йсно бажаете видилити л≥карський зас≥б?') then
    begin
      Abort;
    end;
  end;

end;

end.
