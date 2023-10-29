program calculadora;

uses
  Forms,
  uCalculadora in 'uCalculadora.pas' {frmCalculadora};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.
