unit AdminUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, StdCtrls, DBCtrlsEh, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ImgList, ActnList, Mask, Buttons, ExtCtrls, ConstUnit;

type
  TfmAdmin = class(TfmSimpleClient)
    zqrAdmin: TZQuery;
    dsAdmin: TDataSource;
    edtZaklad: TDBEditEh;
    lbl1: TLabel;
    btnSave: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAdmin: TfmAdmin;

implementation

{$R *.dfm}

procedure TfmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
     inherited;
   finally
     fmAdmin := nil;
  end;

end;



procedure TfmAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrAdmin.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.zaklad WHERE id = 1';
  FMaster.GetData(zqrAdmin);
end;

procedure TfmAdmin.btnSaveClick(Sender: TObject);
begin
  zqrAdmin.CommitUpdates;
  Close;
end;

end.
