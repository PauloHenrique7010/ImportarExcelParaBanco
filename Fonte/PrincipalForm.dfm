object PrincipalFrm: TPrincipalFrm
  Left = 0
  Top = 0
  Caption = 'IMPORTAR ARQUIVO EXCEL PARA BANCO DE DADOS'
  ClientHeight = 184
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    502
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object btnFechar: TBitBtn
    Left = 394
    Top = 151
    Width = 100
    Height = 25
    Action = actFechar
    Anchors = [akRight, akBottom]
    Caption = 'FECHAR(ESC)'
    TabOrder = 0
  end
  object btnConfiguracao: TBitBtn
    Left = 394
    Top = 120
    Width = 100
    Height = 25
    Action = actConfiguracoes
    Anchors = [akRight, akBottom]
    Caption = 'Configura'#231#245'es'
    TabOrder = 1
  end
  object edtCaminhoExcel: TEdit
    Left = 24
    Top = 32
    Width = 329
    Height = 21
    TabOrder = 2
    TextHint = 'Informe o arquivo excel'
  end
  object btnPegarExcel: TBitBtn
    Left = 359
    Top = 30
    Width = 50
    Height = 25
    Action = actPegarExcel
    Caption = 'BUSCAR'
    TabOrder = 3
  end
  object grbOpcoes: TGroupBox
    Left = 24
    Top = 59
    Width = 241
    Height = 38
    Caption = 'grbOpcoes'
    TabOrder = 4
    object rdbZerar: TRadioButton
      Left = 14
      Top = 15
      Width = 99
      Height = 17
      Caption = 'Zerar Registros'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rdbZerarClick
    end
    object rdbAdicionar: TRadioButton
      Left = 119
      Top = 15
      Width = 114
      Height = 17
      Caption = 'Adicionar Registros'
      TabOrder = 1
      OnClick = rdbAdicionarClick
    end
  end
  object btnLimparCaminho: TBitBtn
    Left = 415
    Top = 30
    Width = 50
    Height = 25
    Action = actLimparCaminho
    Caption = 'LIMPAR'
    TabOrder = 5
  end
  object btnImportar: TBitBtn
    Left = 160
    Top = 120
    Width = 150
    Height = 41
    Action = actImportar
    Anchors = []
    Caption = 'IMPORTAR'
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Left = 40
  end
  object ActionList1: TActionList
    object actFechar: TAction
      Caption = 'FECHAR(ESC)'
      ShortCut = 27
      OnExecute = actFecharExecute
    end
    object actPegarExcel: TAction
      Caption = 'BUSCAR'
      OnExecute = actPegarExcelExecute
    end
    object actConfiguracoes: TAction
      Caption = 'Configura'#231#245'es'
      OnExecute = actConfiguracoesExecute
    end
    object actLimparCaminho: TAction
      Caption = 'LIMPAR'
      OnExecute = actLimparCaminhoExecute
    end
    object actImportar: TAction
      Caption = 'IMPORTAR'
      OnExecute = actImportarExecute
    end
  end
end