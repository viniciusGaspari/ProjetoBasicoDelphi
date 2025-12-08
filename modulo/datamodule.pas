unit datamodule;

interface

uses
  System.SysUtils, System.Classes;

type
  TuDataModule = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uDataModule: TuDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
