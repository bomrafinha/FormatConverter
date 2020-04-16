program FormatConverterTester;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_FormatConverterTester.View in '..\src\FormatConverterTester\U_FormatConverterTester.View.pas' {FormatConverter};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormatConverter, FormatConverter);
  Application.Run;
end.
