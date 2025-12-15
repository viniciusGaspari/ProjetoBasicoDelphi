program ProjetoBasico;

uses
  Vcl.Forms,
  principal in 'principal.pas' {fPrincipal},
  heranca in 'heranca\heranca.pas' {fHeranca},
  Enter in 'terceiro\Enter.pas',
  uHistoricoProduto in 'historico_produto\uHistoricoProduto.pas' {fHistoricoProduto},
  datamodule in 'datamodule\datamodule.pas' {uDataModule: TDataModule},
  cProduto in 'classes\cProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TuDataModule, uDataModule);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TuDataModule, uDataModule);
  Application.CreateForm(TfHeranca, fHeranca);
  Application.CreateForm(TfHistoricoProduto, fHistoricoProduto);
  Application.CreateForm(TuDataModule, uDataModule);
  Application.Run;
end.
