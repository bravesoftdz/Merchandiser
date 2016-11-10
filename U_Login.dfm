object F_Login: TF_Login
  Left = 469
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login Server POS'
  ClientHeight = 292
  ClientWidth = 405
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_login: TsGroupBox
    Left = 0
    Top = 0
    Width = 405
    Height = 271
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Rockwell'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    object sLabel2: TsLabel
      Left = 8
      Top = 16
      Width = 111
      Height = 19
      Caption = 'Kode Operator'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 8
      Top = 80
      Width = 117
      Height = 19
      Caption = 'Nama Operator'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel4: TsLabel
      Left = 8
      Top = 136
      Width = 70
      Height = 19
      Caption = 'Password'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object l_1: TsLabel
      Left = 8
      Top = 240
      Width = 216
      Height = 16
      Caption = 'Tekan F2 untuk merubah Perusahaan'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
    end
    object ed_kd_op: TsEdit
      Left = 56
      Top = 40
      Width = 337
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ed_kd_opChange
      OnKeyDown = ed_kd_opKeyDown
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_n_op: TsEdit
      Left = 56
      Top = 104
      Width = 337
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnEnter = ed_n_opEnter
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object ed_pass: TsEdit
      Left = 56
      Top = 160
      Width = 337
      Height = 27
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      PasswordChar = '@'
      TabOrder = 2
      OnKeyDown = ed_passKeyDown
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object b_login: TsButton
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
      TabOrder = 3
      OnClick = b_loginClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object sButton1: TsButton
    Left = 64
    Top = 344
    Width = 75
    Height = 25
    Caption = 'sButton1'
    TabOrder = 1
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton2: TsButton
    Left = 152
    Top = 344
    Width = 75
    Height = 25
    Caption = 'sButton1'
    TabOrder = 2
    SkinData.SkinSection = 'BUTTON'
  end
  object sb: TsStatusBar
    Left = 0
    Top = 271
    Width = 405
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
end
