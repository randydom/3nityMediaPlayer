object frmSettings: TfrmSettings
  Left = 606
  Top = 117
  BorderIcons = []
  Caption = 'frmSettings'
  ClientHeight = 298
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  DesignSize = (
    283
    298)
  PixelsPerInch = 96
  TextHeight = 13
  object btnMReset: TSpeedButton
    Left = 120
    Top = 2
    Width = 105
    Height = 15
    Caption = 'Master Reset'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnMResetClick
  end
  object btnClose: TBitBtn
    Left = 258
    Top = 2
    Width = 25
    Height = 15
    Anchors = [akTop, akRight]
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = btnCloseClick
  end
end
