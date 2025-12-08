object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto B'#225'sico Feito Por Vin'#237'cius de Gaspari Mennuccelli'
  ClientHeight = 600
  ClientWidth = 1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 592
    Top = 65528
    object Detalhes1: TMenuItem
      Caption = 'Produto'
      object ConsultarProdutos2: TMenuItem
        Caption = 'Produtos Cadastrados'
        OnClick = ConsultarProdutos2Click
      end
    end
  end
end
