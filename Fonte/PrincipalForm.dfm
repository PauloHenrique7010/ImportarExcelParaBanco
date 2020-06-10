object PrincipalFrm: TPrincipalFrm
  Left = 0
  Top = 0
  Caption = 'IMPORTAR ARQUIVO EXCEL PARA BANCO DE DADOS'
  ClientHeight = 200
  ClientWidth = 473
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
    473
    200)
  PixelsPerInch = 96
  TextHeight = 13
  object lblProgresso: TLabel
    Left = 319
    Top = 141
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = '000/000'
    Visible = False
    ExplicitLeft = 348
    ExplicitTop = 140
  end
  object Label1: TLabel
    Left = 24
    Top = 14
    Width = 156
    Height = 13
    Caption = 'Informe o caminho arquivo excel'
  end
  object btnFechar: TBitBtn
    Left = 365
    Top = 167
    Width = 100
    Height = 25
    Action = actFechar
    Anchors = [akRight, akBottom]
    Caption = 'FECHAR(ESC)'
    TabOrder = 6
    ExplicitTop = 151
  end
  object btnConfiguracao: TBitBtn
    Left = 365
    Top = 136
    Width = 100
    Height = 25
    Action = actConfiguracoes
    Anchors = [akRight, akBottom]
    Caption = 'CONFIGURA'#199#213'ES'
    TabOrder = 5
    ExplicitTop = 120
  end
  object edtCaminhoExcel: TEdit
    Left = 24
    Top = 32
    Width = 329
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
    TextHint = 'Informe o arquivo excel'
  end
  object btnPegarExcel: TBitBtn
    Left = 359
    Top = 30
    Width = 50
    Height = 25
    Action = actPegarExcel
    Caption = 'BUSCAR'
    TabOrder = 1
  end
  object grbOpcoes: TGroupBox
    Left = 24
    Top = 59
    Width = 300
    Height = 38
    Caption = 'Ao importar informa'#231#245'es:'
    TabOrder = 3
    object rdbZerar: TRadioButton
      Left = 14
      Top = 15
      Width = 155
      Height = 17
      Caption = 'Apagar registros anteriores'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rdbZerarClick
    end
    object rdbAdicionar: TRadioButton
      Left = 178
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
    TabOrder = 2
  end
  object btnImportar: TBitBtn
    Left = 8
    Top = 103
    Width = 150
    Height = 41
    Action = actImportar
    Caption = 'IMPORTAR'
    TabOrder = 4
  end
  object btnBackup: TBitBtn
    Left = 8
    Top = 148
    Width = 150
    Height = 41
    Action = actBackup
    Caption = 'BACKUP'
    TabOrder = 7
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo Excel|*.CSV;*.XLS;*.XLSX'
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
      Caption = 'CONFIGURA'#199#213'ES'
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
    object actBackup: TAction
      Caption = 'BACKUP'
      OnExecute = actBackupExecute
    end
  end
  object cmdImportar: TFDCommand
    Connection = ConexaoDtm.Conexao
    Left = 80
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.sql'
    Filter = 'Arquivo SQL|*.SQL;'
    Left = 160
    Top = 160
  end
end
