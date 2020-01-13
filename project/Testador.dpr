program Testador;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Testador.View in '..\modules\U_Testador.View.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
