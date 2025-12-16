unit datamodule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TuDataModule = class(TDataModule)
    adoConnection: TADOConnection;
    qryProduto: TADOQuery;
    dsProduto: TDataSource;
    qryProdutoid: TAutoIncField;
    qryProdutocódigo: TIntegerField;
    qryProdutonome_produto: TStringField;
    qryProdutopreco: TBCDField;
    qryProdutoquantidade: TIntegerField;
    qryProdutoDeleteById: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    BCDField1: TBCDField;
    IntegerField2: TIntegerField;
    qryProdutoGetEntityByCodigo: TADOQuery;
    AutoIncField5: TAutoIncField;
    IntegerField8: TIntegerField;
    StringField5: TStringField;
    BCDField5: TBCDField;
    IntegerField9: TIntegerField;
    qryProdutofoto_produto: TStringField;
    qryProdutoGetEntityByCodigofoto_produto: TStringField;
    qryProdutoInsert: TADOQuery;
    AutoIncField2: TAutoIncField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    BCDField2: TBCDField;
    IntegerField4: TIntegerField;
    StringField6: TStringField;
    qryProdutoGetEntity: TADOQuery;
    qryProdutoGetEntityid: TAutoIncField;
    qryProdutoGetEntitycodigo: TIntegerField;
    qryProdutoGetEntitynome_produto: TStringField;
    qryProdutoGetEntitypreco: TBCDField;
    qryProdutoGetEntityquantidade: TIntegerField;
    qryProdutoGetEntityfoto_produto: TStringField;
    qryProdutoEdit: TADOQuery;
    AutoIncField3: TAutoIncField;
    IntegerField5: TIntegerField;
    StringField3: TStringField;
    BCDField3: TBCDField;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    qryCarrinhoInsert: TADOQuery;
    AutoIncField4: TAutoIncField;
    IntegerField7: TIntegerField;
    StringField4: TStringField;
    IntegerField10: TIntegerField;
    BCDField4: TBCDField;
    DateTimeField1: TDateTimeField;
    FMTBCDField1: TFMTBCDField;
    clearCarrinhoVendaTable: TADOQuery;
    StringField8: TStringField;
    IntegerField11: TIntegerField;
    BCDField6: TBCDField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    DateTimeField2: TDateTimeField;
    FMTBCDField2: TFMTBCDField;
    dsCarrinhoVenda: TDataSource;
    qryCarrinhoSelectAll: TADOQuery;
    qryCarrinhoSelectAllnome_produto: TStringField;
    qryCarrinhoSelectAllquantidade: TIntegerField;
    qryCarrinhoSelectAllpreco: TBCDField;
    qryCarrinhoSelectAllid_produto: TIntegerField;
    qryCarrinhoSelectAllid: TAutoIncField;
    qryCarrinhoSelectAlldata_inclusao: TDateTimeField;
    qryCarrinhoSelectAllpreco_total: TFMTBCDField;
    qryCarrinhoVenda: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetConnectionString: String;

    { Private declarations }
  public
  procedure AtualizarCarrinho;
    { Public declarations }

  end;

var
  uDataModule: TuDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TuDataModule }

procedure TuDataModule.DataModuleCreate(Sender: TObject);
begin
  dsCarrinhoVenda.DataSet := qryCarrinhoSelectAll;
  dsCarrinhoVenda.Enabled := true;
  qryCarrinhoSelectAll.Active := true;
  qryCarrinhoSelectAll.Open;
end;

function TuDataModule.GetConnectionString:String;
  begin
    Result :=
    'Provider=SQLOLEDB;Data Source=192.168.15.11;Initial Catalog=vendas;User ID=sa;Password=123;';
  end;
  procedure TuDataModule.AtualizarCarrinho;
begin
  qryCarrinhoSelectAll.Close;
  qryCarrinhoSelectAll.Open;
end;
end.
