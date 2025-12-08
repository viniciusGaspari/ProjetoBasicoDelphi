object fCadastrarProduto: TfCadastrarProduto
  Left = 0
  Top = 0
  Caption = 'Cadastrar Produto'
  ClientHeight = 639
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object lblPreco: TLabel
    Left = 56
    Top = 235
    Width = 30
    Height = 15
    Caption = 'Pre'#231'o'
  end
  object lblQuantidade: TLabel
    Left = 56
    Top = 315
    Width = 62
    Height = 15
    Caption = 'Quantidade'
  end
  object img: TImage
    Left = 472
    Top = 104
    Width = 481
    Height = 433
    Cursor = crHandPoint
    Hint = 'Clique para escolher uma imagem'
    ParentShowHint = False
    ShowHint = True
    Stretch = True
    OnClick = imgClick
  end
  object lblFoto: TLabel
    Left = 472
    Top = 83
    Width = 187
    Height = 15
    Caption = 'Selecione Uma Foto Para o Produto'
  end
  object lblCodigo: TLabel
    Left = 56
    Top = 83
    Width = 39
    Height = 15
    Caption = 'Codigo'
  end
  object lbleNomeProduto: TLabeledEdit
    Left = 56
    Top = 184
    Width = 313
    Height = 23
    EditLabel.Width = 96
    EditLabel.Height = 15
    EditLabel.Caption = 'Nome do Produto'
    TabOrder = 0
    Text = ''
  end
  object edtQuantidade: TEdit
    Left = 56
    Top = 336
    Width = 313
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object cePreco: TCurrencyEdit
    Left = 56
    Top = 256
    Width = 313
    Height = 23
    Alignment = taLeftJustify
    DisplayFormat = 'R$ ,0.00;R$ -,0.00'
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 56
    Top = 400
    Width = 145
    Height = 23
    TabOrder = 3
    TextHint = 'CATEGORIAS'
    Items.Strings = (
      'MERCEARIA'
      'PADARIA'
      'ACOUGUE'
      'FRIOS'
      'HORTIFRUTI'
      'BEBIDAS'
      'UTILIDADES'
      'PET SHOP'
      'MATERIAL ESCOLAR')
  end
  object bbtnCadastrar: TBitBtn
    Left = 56
    Top = 456
    Width = 313
    Height = 49
    Caption = 'CADASTRAR'
    TabOrder = 4
    OnClick = bbtnCadastrarClick
  end
  object edtCodigo: TEdit
    Left = 56
    Top = 104
    Width = 313
    Height = 23
    NumbersOnly = True
    TabOrder = 5
  end
  object openPictureDialog: TOpenPictureDialog
    Left = 688
    Top = 56
  end
end
