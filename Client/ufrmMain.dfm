object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 0
    Top = 96
    Width = 635
    Height = 203
    Align = alBottom
    TabOrder = 0
  end
  object callback: TDSClientCallbackChannelManager
    DSHostname = '127.0.0.1'
    DSPort = '211'
    CommunicationProtocol = 'tcp/ip'
    ChannelName = 'MyChannel'
    Left = 312
    Top = 152
  end
end
