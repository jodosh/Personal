object frmPortPrompt: TfrmPortPrompt
  Left = 418
  Top = 323
  BorderStyle = bsDialog
  Caption = 'Select Port'
  ClientHeight = 87
  ClientWidth = 172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPort: TLabel
    Left = 8
    Top = 12
    Width = 22
    Height = 13
    Caption = 'Port:'
  end
  object chkUseBluetooth: TCheckBox
    Left = 40
    Top = 32
    Width = 97
    Height = 17
    Caption = 'Use bluetooth'
    TabOrder = 1
    Visible = False
  end
  object btnOK: TButton
    Left = 24
    Top = 56
    Width = 65
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 96
    Top = 56
    Width = 65
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object cboPort: TComboBox
    Left = 40
    Top = 8
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'usb'
  end
end
