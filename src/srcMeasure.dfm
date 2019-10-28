object frmMeasure: TfrmMeasure
  Left = 327
  Top = 350
  Width = 638
  Height = 567
  Caption = 'frmMeasure'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tbrMain: TToolBar
    Left = 0
    Top = 0
    Width = 25
    Height = 540
    Align = alLeft
    ButtonWidth = 22
    Caption = 'tbrMain'
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
  end
  object ScrollBox: TScrollBox
    Left = 40
    Top = 8
    Width = 585
    Height = 529
    TabOrder = 1
    object imgMeasure: TImage
      Left = -4
      Top = 0
      Width = 517
      Height = 441
    end
  end
end
