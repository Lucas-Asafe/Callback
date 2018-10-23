object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 299
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmo: TMemo
    Left = 24
    Top = 8
    Width = 241
    Height = 153
    TabOrder = 0
  end
  object edtMessage: TEdit
    Left = 24
    Top = 176
    Width = 241
    Height = 21
    TabOrder = 1
  end
  object btnEnviar: TButton
    Left = 24
    Top = 216
    Width = 241
    Height = 25
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = btnEnviarClick
  end
  object callback: TDSClientCallbackChannelManager
    DSHostname = '127.0.0.1'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'MyChannel'
    ManagerId = '812563.478229.196868'
    Left = 48
    Top = 48
  end
  object con: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DbxDatasnap'
      'HostName=127.0.0.1'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/')
    Connected = True
    Left = 48
    Top = 104
  end
end
