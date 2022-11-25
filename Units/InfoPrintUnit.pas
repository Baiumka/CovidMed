unit InfoPrintUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, ImgList, ActnList, StdCtrls, Mask, DBCtrlsEh,
  Buttons, ExtCtrls;

type
  TfmInfoPrintUnit = class(TfmSimpleClient)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInfoPrintUnit: TfmInfoPrintUnit;

implementation

{$R *.dfm}

procedure TfmInfoPrintUnit.FormCreate(Sender: TObject);
begin
  inherited;
  FMaster.Report.ShowReport('info', []);
  self.Close();
end;

procedure TfmInfoPrintUnit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    inherited;
  finally
    fmInfoPrintUnit := nil;
  end;

end;

end.
