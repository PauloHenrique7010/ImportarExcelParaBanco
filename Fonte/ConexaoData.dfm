object ConexaoDtm: TConexaoDtm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=1234'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
end
