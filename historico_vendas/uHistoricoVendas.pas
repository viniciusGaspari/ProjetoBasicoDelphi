unit uHistoricoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, heranca, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, datamodule,
  Vcl.ComCtrls;

type
  TfHistoricoVendas = class(TfHeranca)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridTitleClick(Column: TColumn);
  private
    { Private declarations }
    indiceAtual: String;
    procedure mskeBuscarChange(Sender: TObject);
  public
    { Public declarations }
  end;

var
  fHistoricoVendas: TfHistoricoVendas;

implementation

{$R *.dfm}
procedure TfHistoricoVendas.dbGridTitleClick(Column: TColumn);
begin
  var i: integer;
  inherited;
    for i := 0 to uDataModule.qryVenda.Fields.Count - 1 do
    begin
      if (uDataModule.qryVenda.Fields[i].FieldName = Column.FieldName) then
        begin
          orderedByParam.Caption := uDataModule.qryVenda.Fields[i].DisplayLabel;
          indiceAtual := uDataModule.qryVenda.Fields[i].FieldName;
        end;
    end;
end;
procedure TfHistoricoVendas.mskeBuscarChange(Sender: TObject);
begin
  inherited;
  uDataModule.qryVenda.Locate(indiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

procedure TfHistoricoVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
  begin
    inherited;
    FreeAndNil(uDataModule);
  end;

procedure TfHistoricoVendas.FormCreate(Sender: TObject);
  begin
    inherited;
    uDataModule := TuDataModule.Create(Self);
    dbGrid.DataSource := uDataModule.dsVenda;
  end;

end.
