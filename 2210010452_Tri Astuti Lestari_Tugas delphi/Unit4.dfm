object DataModule4: TDataModule4
  OldCreateOrder = False
  Left = 187
  Top = 337
  Height = 215
  Width = 268
  object connection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Program Files (x86)\Borland\Delphi7\Folder Baru\libmysql.dll'
    Left = 40
    Top = 24
  end
  object Zkategori: TZQuery
    Connection = connection1
    Active = True
    SQL.Strings = (
      'Select * from kategori')
    Params = <>
    Left = 112
    Top = 24
  end
  object dskategori: TDataSource
    DataSet = Zkategori
    Left = 112
    Top = 88
  end
  object Zsatuan: TZQuery
    Connection = connection1
    Active = True
    SQL.Strings = (
      'select * from satuan')
    Params = <>
    Left = 176
    Top = 24
  end
  object dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 176
    Top = 88
  end
end
