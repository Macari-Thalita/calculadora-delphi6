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
    btNumero0: TButton;
    btNumero1: TButton;
    btNumero2: TButton;
    btNumero3: TButton;
    btNumero4: TButton;
    btNumero5: TButton;
    btNumero6: TButton;
    btNumero7: TButton;
    btNumero8: TButton;
    btNumero9: TButton;
    btCorrigir: TButton;
    btApagar: TButton;
    lbNumero1: TLabel;
    edConta: TEdit;
    lbNumero2: TLabel;
    lbOperacao: TLabel;
    lbIgual: TLabel;
    lbResultado: TLabel;
    procedure btApagarClick(Sender: TObject);
    procedure btCorrigirClick(Sender: TObject);
    procedure btNumero1Click(Sender: TObject);
    procedure btNumero2Click(Sender: TObject);
    procedure btNumero3Click(Sender: TObject);
    procedure btNumero4Click(Sender: TObject);
    procedure btNumero5Click(Sender: TObject);
    procedure btNumero6Click(Sender: TObject);
    procedure btNumero7Click(Sender: TObject);
    procedure btNumero8Click(Sender: TObject);
    procedure btNumero9Click(Sender: TObject);
    procedure btNumero0Click(Sender: TObject);
    procedure btAdicaoClick(Sender: TObject);
    procedure btSubtracaoClick(Sender: TObject);
    procedure btDivisaoClick(Sender: TObject);
    procedure btMultiplicacaoClick(Sender: TObject);
    procedure btIgualClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtribuirSegundoValor;
    procedure AtribuirPrimeiroValor;
    procedure CalcularOperacaoAdicao;
    procedure CalcularOperacaoSubtracao;
    procedure CalcularOperacaoMultiplicacao;
    procedure CalcularOperacaoDivisao;
    
  private
     FPrimeiroNumero, FSegundoNumero : real;
     FResultadoFinal                 : double;
     FTipoDaOperacao                 : string;
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.btNumero0Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '0';
end;

procedure TfrmCalculadora.btNumero1Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '1';
end;

procedure TfrmCalculadora.btNumero2Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '2';
end;

procedure TfrmCalculadora.btNumero3Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '3';
end;

procedure TfrmCalculadora.btNumero4Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '4';
end;

procedure TfrmCalculadora.btNumero5Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '5';
end;

procedure TfrmCalculadora.btNumero6Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '6';
end;

procedure TfrmCalculadora.btNumero7Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '7';
end;

procedure TfrmCalculadora.btNumero8Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '8';
end;

procedure TfrmCalculadora.btNumero9Click(Sender: TObject);
begin
   edConta.Text := edConta.Text + '9';
end;

procedure TfrmCalculadora.btApagarClick(Sender: TObject);
begin
   edConta.Text           := EmptyStr;
   lbNumero1.Caption      := EmptyStr;
   lbNumero2.Caption      := EmptyStr;
   lbOperacao.Caption     := EmptyStr;
   lbResultado.Caption    := EmptyStr;
end;

procedure TfrmCalculadora.btCorrigirClick(Sender: TObject);
begin
   edConta.Text := Copy(edConta.Text, 1, Length(edConta.Text) - 1);
   edConta.SetFocus;
end;

procedure TfrmCalculadora.btAdicaoClick(Sender: TObject);
begin
   AtribuirPrimeiroValor;
   FTipoDaOperacao       := 'OPERACAO_ADICAO';
   lbOperacao.Caption    := '+';
end;

procedure TfrmCalculadora.btSubtracaoClick(Sender: TObject);
begin
   AtribuirPrimeiroValor;
   FTipoDaOperacao      := 'OPERACAO_SUBTRACAO';
   lbOperacao.Caption   := '-';
end;

procedure TfrmCalculadora.btDivisaoClick(Sender: TObject);
begin
   AtribuirPrimeiroValor;
   FTipoDaOperacao      := 'OPERACAO_DIVISAO';
   lbOperacao.Caption   := '/';
end;

procedure TfrmCalculadora.btMultiplicacaoClick(Sender: TObject);
begin
   AtribuirPrimeiroValor;
   FTipoDaOperacao      := 'OPERACAO_MULTIPLICACAO';
   lbOperacao.Caption   := 'X';
end;

procedure TfrmCalculadora.AtribuirPrimeiroValor;
begin
   FPrimeiroNumero        := StrToFloat(edConta.Text);
   lbNumero1.Caption      := FloatToStr(FPrimeiroNumero);
   edConta.Text           := EmptyStr;
   lbNumero1.Visible      := True;
end;

procedure TfrmCalculadora.AtribuirSegundoValor;
begin
   FSegundoNumero      := StrToFloat(edConta.Text);
   lbNumero2.Caption   := FloatToStr(FSegundoNumero);
   edConta.Text        := EmptyStr;
   lbNumero2.Visible   := True;
   lbResultado.Visible := True;   
end;

procedure TfrmCalculadora.CalcularOperacaoAdicao;
begin
   FResultadoFinal := FPrimeiroNumero + FSegundoNumero;
end;

procedure TfrmCalculadora.CalcularOperacaoSubtracao;
begin
   FResultadoFinal := FPrimeiroNumero - FSegundoNumero;
end;

procedure TfrmCalculadora.CalcularOperacaoMultiplicacao;
begin
   FResultadoFinal := FPrimeiroNumero * FSegundoNumero;
end;

procedure TfrmCalculadora.CalcularOperacaoDivisao;
begin
   FResultadoFinal := FPrimeiroNumero / FSegundoNumero;
end;

procedure TfrmCalculadora.btIgualClick(Sender: TObject);
begin
   if (FTipoDaOperacao = 'OPERACAO_ADICAO') then
   begin
      AtribuirSegundoValor;
      CalcularOperacaoAdicao;
      lbResultado.Caption := FloatToStr(FResultadoFinal);
   end
   else if (FTipoDaOperacao = 'OPERACAO_SUBTRACAO') then
   begin
      AtribuirSegundoValor;
      CalcularOperacaoSubtracao;
      lbResultado.Caption := FloatToStr(FResultadoFinal);
   end
   else if (FTipoDaOperacao = 'OPERACAO_MULTIPLICACAO') then
   begin
      AtribuirSegundoValor;
      CalcularOperacaoMultiplicacao;
      lbResultado.Caption := FloatToStr(FResultadoFinal);
   end
   else if (FTipoDaOperacao = 'OPERACAO_DIVISAO') then
   begin
      AtribuirSegundoValor;
      CalcularOperacaoDivisao;
      lbResultado.Caption := FloatToStr(FResultadoFinal);
   end;
end;

procedure TfrmCalculadora.FormShow(Sender: TObject);
begin
   lbNumero1.Visible      := False;
   lbNumero2.Visible      := False;
   lbResultado.Visible    := False;
end;

end.
