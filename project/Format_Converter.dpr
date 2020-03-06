program Format_Converter;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_FormatConverter.View in '..\modules\U_FormatConverter.View.pas' {FormatConverter};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormatConverter, FormatConverter);
  Application.Run;
end.
