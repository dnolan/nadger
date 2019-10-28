object frmNamedColours: TfrmNamedColours
  Left = 214
  Top = 228
  BorderStyle = bsNone
  Caption = 'Netscape Colours'
  ClientHeight = 278
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object imgColours: TImage
    Left = 0
    Top = 0
    Width = 265
    Height = 253
    ParentShowHint = False
    ShowHint = True
    OnClick = imgColoursClick
    OnMouseMove = imgColoursMouseMove
  end
  object Label1: TLabel
    Left = 40
    Top = 260
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object hintColourName: TStaticText
    Left = 80
    Top = 260
    Width = 161
    Height = 17
    AutoSize = False
    TabOrder = 0
  end
end
