object frmOptions: TfrmOptions
  Left = 600
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 208
  ClientWidth = 207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    0000010008000000000040010000000000000000000000010000000000000000
    0000800080008000000080800000008000000080800000008000C0C0C000C0DC
    C000F0CAA60080808000FF00FF00FF000000FFFF000000FF000000FFFF000000
    FF00FFFFFF00F0FBFF00A4A0A000D4F0FF00B1E2FF008ED4FF006BC6FF0048B8
    FF0025AAFF0000AAFF000092DC00007AB90000629600004A730000325000D4E3
    FF00B1C7FF008EABFF006B8FFF004873FF002557FF000055FF000049DC00003D
    B900003196000025730000195000D4D4FF00B1B1FF008E8EFF006B6BFF004848
    FF002525FF000000FF000000DC000000B900000096000000730000005000E3D4
    FF00C7B1FF00AB8EFF008F6BFF007348FF005725FF005500FF004900DC003D00
    B900310096002500730019005000F0D4FF00E2B1FF00D48EFF00C66BFF00B848
    FF00AA25FF00AA00FF009200DC007A00B900620096004A00730032005000FFD4
    FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00FF25FF00FF00FF00DC00DC00B900
    B900960096007300730050005000FFD4F000FFB1E200FF8ED400FF6BC600FF48
    B800FF25AA00FF00AA00DC009200B9007A009600620073004A0050003200FFD4
    E300FFB1C700FF8EAB00FF6B8F00FF487300FF255700FF005500DC004900B900
    3D00960031007300250050001900FFD4D400FFB1B100FF8E8E00FF6B6B00FF48
    4800FF252500FF000000DC000000B9000000960000007300000050000000FFE3
    D400FFC7B100FFAB8E00FF8F6B00FF734800FF572500FF550000DC490000B93D
    0000963100007325000050190000FFF0D400FFE2B100FFD48E00FFC66B00FFB8
    4800FFAA2500FFAA0000DC920000B97A000096620000734A000050320000FFFF
    D400FFFFB100FFFF8E00FFFF6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B9
    0000969600007373000050500000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF
    4800AAFF2500AAFF000092DC00007AB90000629600004A73000032500000E3FF
    D400C7FFB100ABFF8E008FFF6B0073FF480057FF250055FF000049DC00003DB9
    0000319600002573000019500000D4FFD400B1FFB1008EFF8E006BFF6B0048FF
    480025FF250000FF000000DC000000B90000009600000073000000500000D4FF
    E300B1FFC7008EFFAB006BFF8F0048FF730025FF570000FF550000DC490000B9
    3D00009631000073250000501900D4FFF000B1FFE2008EFFD4006BFFC60048FF
    B80025FFAA0000FFAA0000DC920000B97A000096620000734A0000503200D4FF
    FF00B1FFFF008EFFFF006BFFFF0048FFFF0025FFFF0000FFFF0000DCDC0000B9
    B900009696000073730000505000F2F2F200E6E6E600DADADA00CECECE00C2C2
    C200B6B6B600AAAAAA009E9E9E0092929200868686007A7A7A006E6E6E006262
    6200565656004A4A4A003E3E3E0032323200262626001A1A1A000E0E0E000000
    0000000000000000000000000000000000F9F9F9F90000000000000000000000
    F9F5FDFDFDF7000000000000000000F9F5F5F5F5FDFDF90000000000000000F9
    EFF5F9F9F5FDF90000000000000000F9EFF5F9F9F5FDF90000000000000000F9
    EFEFF5F5F5F5F9F9F9F9F9F900000000F9EFEFEFF5F9F9F5F5FDFDFDF9000000
    00F9F9F9F9F9F5F5F5F5F5FDFDF900000000000000F9EFF5F5F9F5F5FDF90000
    0000000000F9EFF5F9F9F9F5FDF900000000000000F9EFF5F5F9F5F5F5F90000
    0000000000F9EFEFF5F5F5F5F5F90000000000000000F9EFEFEFEFF5F9000000
    00000000000000F9F9F9F9F9000000000000000000000000000000000000FFFF
    FFFFE1FFFFFFC0FFFFFF807FFFFF807FFFFF807FFFFF8003FFFFC001FFFFE000
    FFFFFE00FFFFFE00FFFFFE00FFFFFE00FFFFFF01FFFFFF83FFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 81
    Caption = 'Options'
    TabOrder = 0
    object chkClipboard: TCheckBox
      Left = 8
      Top = 16
      Width = 169
      Height = 17
      Caption = 'Copy Hex Value to clipboard?'
      TabOrder = 0
      OnClick = chkClipboardClick
    end
    object chkSaveOnExit: TCheckBox
      Left = 8
      Top = 56
      Width = 153
      Height = 17
      Caption = 'Save Current Value on Exit?'
      TabOrder = 1
    end
    object chkClipboardHash: TCheckBox
      Left = 8
      Top = 32
      Width = 129
      Height = 17
      Caption = 'Include Hash "#"'
      Enabled = False
      TabOrder = 2
    end
  end
  object butSave: TButton
    Left = 16
    Top = 176
    Width = 81
    Height = 25
    Caption = 'Save'
    TabOrder = 1
    OnClick = butSaveClick
  end
  object butCancel: TButton
    Left = 112
    Top = 176
    Width = 81
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = butCancelClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 96
    Width = 193
    Height = 73
    TabOrder = 3
    object StaticText1: TStaticText
      Left = 16
      Top = 16
      Width = 136
      Height = 17
      Caption = 'Zoom Ratio for Eye Dropper'
      TabOrder = 0
    end
    object lblZoom: TStaticText
      Left = 152
      Top = 16
      Width = 21
      Height = 17
      Caption = '1/1'
      TabOrder = 1
    end
    object tckZoom: TTrackBar
      Left = 8
      Top = 32
      Width = 169
      Height = 33
      Max = 5
      Min = 1
      Orientation = trHorizontal
      Frequency = 1
      Position = 1
      SelEnd = 0
      SelStart = 0
      TabOrder = 2
      TickMarks = tmBottomRight
      TickStyle = tsAuto
      OnChange = tckZoomChange
    end
  end
end
