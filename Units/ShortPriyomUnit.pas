unit ShortPriyomUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClientUnit, StdCtrls, Buttons, Grids, DBGridEh, DBCtrlsEh, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ImgList, ActnList, Mask,
  ExtCtrls, ConstUnit
  ;

type
  TfmShortPriyom = class(TfmSimpleClient)
    dsPriyom: TDataSource;
    zqrPriyom: TZQuery;
    edtPation: TDBEditEh;
    edtDoc: TDBEditEh;
    edtDate: TDBDateTimeEditEh;
    edtAge: TDBNumberEditEh;
    edtCovidDate: TDBDateTimeEditEh;
    edtTrouble: TDBEditEh;
    edtOznaki: TDBEditEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtResult: TDBEditEh;
    dbgMedical: TDBGridEh;
    lbl7: TLabel;
    lbl8: TLabel;
    btnClose: TBitBtn;
    lbl: TLabel;
    dsMedical: TDataSource;
    zqrMedical: TZQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgMedicalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
    showID: Integer;
  public
    { Public declarations }
    Constructor Create(owner: TForm; id: Integer);
  end;

var
  fmShortPriyom: TfmShortPriyom;

implementation

{$R *.dfm}

constructor TfmShortPriyom.Create(owner: TForm; id: Integer);
begin
  inherited Create(owner);
  showID := id;
end;


procedure TfmShortPriyom.FormCreate(Sender: TObject);
begin
  inherited;
  AutoRefresh := True;
  zqrPriyom.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_short_priyom(:id);';
  zqrPriyom.ParamByName('id').AsInteger := showID;
  FMaster.GetData(zqrPriyom);

  zqrMedical.SQL.Text := 'SELECT * FROM ' + SCHEME_NAME +'.p_get_medical_priyom(:id);';
  zqrMedical.ParamByName('id').AsInteger := showID;
  FMaster.GetData(zqrMedical);

end;

procedure TfmShortPriyom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
     inherited;
   finally
     fmShortPriyom := nil;
   end;

end;

procedure TfmShortPriyom.dbgMedicalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if zqrMedical.FieldByName('is_allergy').AsBoolean then dbgMedical.Canvas.Brush.Color := clRed
  else dbgMedical.Canvas.Brush.Color := clLtGray;

  dbgMedical.Canvas.Font.Color := clBlack;
  dbgMedical.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
