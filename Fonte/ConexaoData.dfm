object ConexaoDtm: TConexaoDtm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=1234'
      'Database=banco'
      'DriverID=MySQL')
    Left = 88
    Top = 56
  end
end
