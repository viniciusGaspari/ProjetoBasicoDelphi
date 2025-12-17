unit cVendaEfetuada;

interface

uses
  System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs, System.SysUtils,
  datamodule, Data.DB, cCliente;

type
  TcVendaEfetuada = class
  private
    FId: Integer;
    FIdProduto: Integer;
    FQuantidade: Integer;
    FValorTotalCompra: Double;
    FCpfCliente: string;

  public
    property Id: Integer read FId write FId;
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property PrecoTotalCompra: Double read FValorTotalCompra write FValorTotalCompra;
    property cpfCliente: string read FCpfCliente write FCpfCliente;

    procedure Insert(idProduto: integer; quantidade: integer; valorTotalCompra: double; cpfCliente: string);

  end;

implementation

procedure TcVendaEfetuada.Insert
  (idProduto: integer; quantidade: integer; valorTotalCompra: double; cpfCliente: string);
var
  cCliente: TcCliente;
begin
  cCliente := TcCliente.Create;
  try
    with uDataModule.qryVendaEfetuadaInsert do
      begin
        Close;
          cCliente.CheckExistenceByCPF(cpfCliente);
            Parameters.ParamByName('idProduto').Value := idProduto;
            Parameters.ParamByName('quantidade').Value := quantidade;
            Parameters.ParamByName('valorTotalCompra').Value := valorTotalCompra;
            Parameters.ParamByName('cpfCliente').Value := cpfCliente;
        ExecSQL;
        ShowMessage('Venda registrada com sucesso!');
      end;
  finally
    cCliente.Free;
  end;
end;


end.

