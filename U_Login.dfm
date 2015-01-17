object F_Login: TF_Login
  Left = 469
  Top = 201
  BorderStyle = bsDialog
  Caption = 'Login Server POS'
  ClientHeight = 277
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_login: TsGroupBox
    Left = 0
    Top = 0
    Width = 405
    Height = 256
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
      Top = 88
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
      Top = 120
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
      Top = 152
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
    object ed_kd_op: TsEdit
      Left = 136
      Top = 80
      Width = 233
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Left = 136
      Top = 112
      Width = 233
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
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
      Left = 136
      Top = 144
      Width = 233
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
      Left = 232
      Top = 192
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
      OnClick = b_loginClick
      SkinData.SkinSection = 'BUTTON'
    end
    object gb_pilihan: TsGroupBox
      Left = 8
      Top = 16
      Width = 369
      Height = 57
      Caption = '| Jenis Login |'
      TabOrder = 0
      SkinData.SkinSection = 'GROUPBOX'
      object rb_jaga: TsRadioButton
        Left = 16
        Top = 24
        Width = 130
        Height = 23
        Caption = '&Penjaga Toko'
        Checked = True
        TabOrder = 0
        TabStop = True
        SkinData.SkinSection = 'RADIOBUTTON'
      end
      object rb_so: TsRadioButton
        Left = 200
        Top = 24
        Width = 139
        Height = 23
        Caption = '&Stock Opname'
        TabOrder = 1
        SkinData.SkinSection = 'RADIOBUTTON'
      end
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
    Top = 256
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
    SkinData.SkinSection = 'STATUSBAR'
  end
end
