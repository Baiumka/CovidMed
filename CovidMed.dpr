program CovidMed;

{%File 'bin\CovidMed.ini'}

uses
  Forms,
  DBNewNav in '..\..\Comps\DBNewNav.pas',
  MainUnit in '..\ZeosProject\MainUnit.pas' {fmMain},
  DataUnit in '..\ZeosProject\DataUnit.pas' {dmSimpleClient: TDataModule},
  InterfaceUnit in '..\ZeosProject\InterfaceUnit.pas',
  ReportUnit in '..\ZeosProject\ReportUnit.pas' {dmReport: TDataModule},
  ClientUnit in '..\ZeosProject\ClientUnit.pas' {fmSimpleClient},
  TableUnit in '..\ZeosProject\TableUnit.pas' {fmSimpleTable},
  AboutUnit in '..\Utils\AboutUnit.pas' {fmAbout},
  DebugUnit in '..\Utils\DebugUnit.pas' {fmDebug},
  Md5Unit in '..\Utils\Md5Unit.pas',
  UtilsUnit in '..\Utils\UtilsUnit.pas',
  SimpleDialog in '..\Utils\SimpleDialog.pas',
  LoginUnit in '..\Utils\LoginUnit.pas' {fmLogin},
  UsersUnit in '..\Utils\UsersUnit.pas' {fmUserRole},
  KadrUnit in '..\Utils\KadrUnit.pas' {fmKadr},
  ConstUnit in 'MainUnits\ConstUnit.pas',
  GlobalDataUnit in 'MainUnits\GlobalDataUnit.pas' {dmGlobalData: TDataModule},
  CovidMedMainUnit in 'MainUnits\CovidMedMainUnit.pas' {fmCovidMedMain},
  PationUnit in 'Units\PationUnit.pas' {fmPationUnit},
  PriyomUnit in 'Units\PriyomUnit.pas' {fmPriyom},
  SelectUnit in 'Units\SelectUnit.pas' {fmSelect},
  SelectPationUnit in 'Units\SelectPationUnit.pas' {fmSelectPation},
  ArchiveUnit in 'Units\ArchiveUnit.pas' {fmArchive},
  MedicalUnit in 'Units\MedicalUnit.pas' {fmMedical},
  PationEditUnit in 'Units\PationEditUnit.pas' {fmPationEdit},
  SicksUnit in 'Units\SicksUnit.pas' {fmSicks},
  RiskUnit in 'Units\RiskUnit.pas' {fmRisk};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CovidMed v1.0.0';
  Application.CreateForm(TfmCovidMedMain, fmCovidMedMain);
  Application.CreateForm(TdmSimpleClient, dmSimpleClient);
  if not dmSimpleClient.ConnectToServer then Exit;

  if ShowLoginForm then
  begin
    fmCovidMedMain.BringToFront;
    Application.CreateForm(TdmReport, dmReport);
    Application.CreateForm(TdmGlobalData, dmGlobalData);
    fmCovidMedMain.LoadAccess;
    Application.Run;
  end
  else
    CloseAllConnection;
end.
