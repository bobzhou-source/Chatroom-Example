object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Chat Example (Client)'
  ClientHeight = 251
  ClientWidth = 702
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 705
    Height = 212
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 0
    Top = 218
    Width = 613
    Height = 25
    TabOrder = 1
  end
  object Button1: TButton
    Left = 619
    Top = 218
    Width = 75
    Height = 25
    Caption = 'Send'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    Left = 48
    Top = 8
  end
end
