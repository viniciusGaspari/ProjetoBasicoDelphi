unit uHistoricoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtDlgs, Vcl.Buttons, datamodule;

type
  TfHistoricoVenda = class(TForm)
    bottomPanel: TPanel;
    bbtnFechar: TBitBtn;
    openPictureDialog: TOpenPictureDialog;
    pgControl: TPageControl;
    Consulta: TTabSheet;
    topPanel: TPanel;
    orderedByLabel: TLabel;
    orderedByParam: TLabel;
    mskeBuscar: TMaskEdit;
    bbtnClear: TBitBtn;
    dbGrid: TDBGrid;
    Cadastrar: TTabSheet;
    lblCodigo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    img: TImage;
    bbtnSalvarAlteracao: TBitBtn;
    bbtnCadastrar: TBitBtn;
    edtCodigo: TMaskEdit;
    lbleNomeProduto: TMaskEdit;
    cePreco: TMaskEdit;
    procedure bbtnClearClick(Sender: TObject);
    procedure bbtnSalvarAlteracaoClick(Sender: TObject);
    procedure bbtnGravarEditarClick(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgClick(Sender: TObject);
    procedure mskeBuscarChange(Sender: TObject);
  private
  colunaSelecionada: string;
    procedure changeStatusButtons(flag: Boolean);
    procedure clearFields;
    procedure loadBlankImage;
  public
    { Public declarations }
  end;

var
  fHistoricoVenda: TfHistoricoVenda;

implementation

{$R *.dfm}

procedure TfHistoricoVenda.changeStatusButtons(flag: Boolean);
begin
  bbtnCadastrar.Visible := not flag;
  bbtnCadastrar.Enabled := not flag;
  bbtnSalvarAlteracao.Visible := flag;
  bbtnSalvarAlteracao.Enabled := flag;
  pgControl.Pages[0].TabVisible := not flag;
  pgControl.Pages[1].TabVisible := flag;
end;

procedure TfHistoricoVenda.clearFields;
begin
  edtCodigo.Clear;
  cePreco.Clear;
  lbleNomeProduto.Clear;
  loadBlankImage;
end;

procedure TfHistoricoVenda.loadBlankImage;
begin
  img.Picture := nil; // ou carregar uma imagem padrão
end;


procedure TfHistoricoVenda.mskeBuscarChange(Sender: TObject);
var
  valorInt: Integer;
  valorFloat: Double;
begin
  inherited;
  with uDataModule.qryProduto do
  begin
    if mskeBuscar.Text <> '' then
    begin
      if colunaSelecionada = 'nome_produto' then
      begin
        Filter := colunaSelecionada + ' LIKE ' + QuotedStr(mskeBuscar.Text + '%');
        Filtered := True;
      end
      else if (colunaSelecionada = 'codigo') or
              (colunaSelecionada = 'id') or
              (colunaSelecionada = 'quantidade') then
      begin
        if TryStrToInt(mskeBuscar.Text, valorInt) then
        begin
          Filter := colunaSelecionada + ' = ' + IntToStr(valorInt);
          Filtered := True;
        end
        else
        begin
          Filter := '';
          Filtered := False;
        end;
      end
      else if colunaSelecionada = 'preco' then
      begin
        if TryStrToFloat(mskeBuscar.Text, valorFloat) then
        begin
          Filter := colunaSelecionada + ' = ' + FloatToStr(valorFloat);
          Filtered := True;
        end
        else
        begin
          Filter := '';
          Filtered := False;
        end;
      end
      else
      begin
        Filter := '';
        Filtered := False;
      end;
    end
    else
    begin
      Filter := '';
      Filtered := False;
    end;
  end;
end;


procedure TfHistoricoVenda.bbtnClearClick(Sender: TObject);
begin
  mskeBuscar.Text := '';
end;


procedure TfHistoricoVenda.bbtnSalvarAlteracaoClick(Sender: TObject);
begin
  ShowMessage('Venda alterada com sucesso!');
  clearFields;
  changeStatusButtons(False);
end;

procedure TfHistoricoVenda.bbtnGravarEditarClick(Sender: TObject);
begin
  changeStatusButtons(True);
  pgControl.Pages[1].Caption := 'Editando venda';
end;

procedure TfHistoricoVenda.bbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfHistoricoVenda.dbGridDblClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente deletar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    ShowMessage('Venda deletada com sucesso!');
end;

procedure TfHistoricoVenda.dbGridTitleClick(Column: TColumn);
begin
  orderedByParam.Caption := Column.Title.Caption;
end;

procedure TfHistoricoVenda.FormShow(Sender: TObject);
begin
  loadBlankImage;
  pgControl.ActivePage := Consulta;
  uDataModule.dsVendaEfetuada.DataSet := uDataModule.qryVendaEfetuadaSelectAll;
  dbGrid.DataSource := uDataModule.dsVendaEfetuada;
  uDataModule.dsVendaEfetuada.Enabled := true;
  uDataModule.qryVendaEfetuadaSelectAll.Active := true;
  uDataModule.qryVendaEfetuadaSelectAll.Close;
  uDataModule.qryVendaEfetuadaSelectAll.Open;
end;

procedure TfHistoricoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  clearFields;
  changeStatusButtons(False);
end;

procedure TfHistoricoVenda.imgClick(Sender: TObject);
begin
  if openPictureDialog.Execute then
    img.Picture.LoadFromFile(openPictureDialog.FileName);
end;

end.

