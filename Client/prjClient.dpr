program prjClient;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {Form1},
  uCC in 'uCC.pas',
  uCM in 'uCM.pas' {ClientModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
