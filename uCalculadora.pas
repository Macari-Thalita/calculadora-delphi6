unit uCalculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmCalculadora = class(TForm)
    pnResultado: TPanel;
    btAdicao: TButton;
    btSubtracao: TButton;
    btDivisao: TButton;
    btMultiplicacao: TButton;
    btIgual: TButton;
    btNum0: TButton;
    btNum1: TButton;
    btNum2: TButton;
    btNum3: TButton;
    btNum4: TButton;
    btNum5: TButton;
    btNum6: TButton;
    btNum7: TButton;
    btNum8: TButton;
    btNum9: TButton;
    btCorrigir: TButton;
    btApagar: TButton;
    lbNum1: TLabel;
    edConta: TEdit;
    lbNum2: TLabel;
    lbOperacao: TLabel;
    lbIgual: TLabel;
    lbResultado: TLabel;
    procedure btApagarClick(Sender: TObject);
    procedure btCorrigirClick(Sender: TObject);
    procedure btNum1Click(Sender: TObject);
    procedure btNum2Click(Sender: TObject);
    procedure btNum3Click(Sender: TObject);
    procedure btNum4Click(Sender: TObject);
    procedure btNum5Click(Sender: TObject);
    procedure btNum6Click(Sender: TObject);
    procedure btNum7Click(Sender: TObject);
    procedure btNum8Click(Sender: TObject);
    procedure btNum9Click(Sender: TObject);
    procedure btNum0Click(Sender: TObject);
    procedure btAdicaoClick(Sender: TObject);
    procedure btSubtracaoClick(Sender: TObject);
    procedure btDivisaoClick(Sender: TObject);
    procedure btMultiplicacaoClick(Sender: TObject);
    procedure btIgualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtribuiNum2;
    procedure AtribuiNum1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;
  GNum1, GNum2    : real;
  GResultadoFinal : double; 
  GTipoOperacao   : string;

implementation

{$R *.dfm}

procedure TfrmCalculadora.btNum0Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '0';
end;

procedure TfrmCalculadora.btNum1Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '1';
end;

procedure TfrmCalculadora.btNum2Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '2';
end;

procedure TfrmCalculadora.btNum3Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '3';
end;

procedure TfrmCalculadora.btNum4Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '4';
end;

procedure TfrmCalculadora.btNum5Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '5';
end;

procedure TfrmCalculadora.btNum6Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '6';
end;

procedure TfrmCalculadora.btNum7Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '7';
end;

procedure TfrmCalculadora.btNum8Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '8';
end;

procedure TfrmCalculadora.btNum9Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '9';
end;

procedure TfrmCalculadora.btApagarClick(Sender: TObject);
begin
   edConta.Text        := EmptyStr;
   lbNum1.Caption      := EmptyStr;
   lbNum2.Caption      := EmptyStr;
   lbOperacao.Caption  := EmptyStr;
   lbResultado.Caption := EmptyStr;
end;

procedure TfrmCalculadora.btCorrigirClick(Sender: TObject);
begin
   edConta.Text := Copy(edConta.Text, 1, Length(edConta.Text) - 1);
   edConta.SetFocus;
end;

procedure TfrmCalculadora.btAdicaoClick(Sender: TObject);
begin
   AtribuiNum1;
   GTipoOperacao       := 'ad';
   lbOperacao.Caption  := '+';
end;

procedure TfrmCalculadora.btSubtracaoClick(Sender: TObject);
begin
   AtribuiNum1;
   GTipoOperacao      := 'sub';
   lbOperacao.Caption := '-';
end;

procedure TfrmCalculadora.btDivisaoClick(Sender: TObject);
begin
   AtribuiNum1;
   GTipoOperacao      := 'div';
   lbOperacao.Caption := '/';
end;

procedure TfrmCalculadora.btMultiplicacaoClick(Sender: TObject);
begin
   AtribuiNum1;
   GTipoOperacao      := 'mult';
   lbOperacao.Caption := 'X';
end;

procedure TfrmCalculadora.AtribuiNum1;
begin
   GNum1               := StrToFloat(edConta.Text);
   lbNum1.Caption      := FloatToStr(GNum1);
   edConta.Text        := EmptyStr;
   lbNum1.Visible      := True;   
end;

procedure TfrmCalculadora.AtribuiNum2;
begin
   GNum2               := StrToFloat(edConta.Text);
   lbNum2.Caption      := FloatToStr(GNum2);
   edConta.Text        := EmptyStr;
   lbNum2.Visible      := True;
   lbResultado.Visible := True;   
end;

procedure TfrmCalculadora.btIgualClick(Sender: TObject);
begin
   if(GTipoOperacao = 'ad') then
   begin
      AtribuiNum2;
      GResultadoFinal     := GNum1 + GNum2;
      lbResultado.Caption := FloatToStr(GResultadoFinal);
   end
   else if(GTipoOperacao = 'sub') then
   begin
      AtribuiNum2;
      GResultadoFinal     := GNum1 - GNum2;
      lbResultado.Caption := FloatToStr(GResultadoFinal);      
   end
   else if(GTipoOperacao = 'mult') then
   begin
      AtribuiNum2;
      GResultadoFinal     := GNum1 * GNum2;
      lbResultado.Caption := FloatToStr(GResultadoFinal);
   end
   else if(GTipoOperacao = 'div') then
   begin
      AtribuiNum2;
      GResultadoFinal     := GNum1 / GNum2;
      lbResultado.Caption := FloatToStr(GResultadoFinal);      
   end;
end;

procedure TfrmCalculadora.FormShow(Sender: TObject);
begin
   lbNum1.Visible      := False;
   lbNum2.Visible      := False;
   lbResultado.Visible := False;
end;

end.
