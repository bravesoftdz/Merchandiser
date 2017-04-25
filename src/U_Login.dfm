object F_Login: TF_Login
  Left = 264
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Login Server POS'
  ClientHeight = 291
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl1: TLabel
    Left = 8
    Top = 16
    Width = 111
    Height = 19
    Caption = 'Kode Operator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
  end
  object Lbl2: TLabel
    Left = 8
    Top = 80
    Width = 117
    Height = 19
    Caption = 'Nama Operator'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
  end
  object Lbl3: TLabel
    Left = 8
    Top = 136
    Width = 70
    Height = 19
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
  end
  object LblKeterangan: TLabel
    Left = 8
    Top = 240
    Width = 216
    Height = 16
    Caption = 'Tekan F2 untuk merubah Perusahaan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object sb: TsStatusBar
    Left = 0
    Top = 270
    Width = 402
    Height = 21
    Panels = <
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
    OnClick = sbClick
    SkinData.SkinSection = 'STATUSBAR'
  end
  object EdKdPengguna: TEdit
    Left = 32
    Top = 40
    Width = 361
    Height = 27
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = EdKdPenggunaChange
    OnKeyDown = EdKdPenggunaKeyDown
  end
  object EdNamaPengguna: TEdit
    Left = 32
    Top = 104
    Width = 361
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    OnEnter = EdNamaPenggunaEnter
  end
  object EdPassword: TEdit
    Left = 32
    Top = 160
    Width = 361
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    PasswordChar = '@'
    TabOrder = 3
    OnKeyDown = EdPasswordKeyDown
  end
  object BtnLogin: TButton
    Left = 256
    Top = 208
    Width = 137
    Height = 49
    Caption = '&Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnLoginClick
  end
end
