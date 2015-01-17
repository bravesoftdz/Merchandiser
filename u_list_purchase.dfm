object f_List_purchase: Tf_List_purchase
  Left = 192
  Top = 107
  Width = 928
  Height = 480
  Caption = 'Daftar Purchase Order'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 442
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object t_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dm.ds_list_purchase
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 data'
          Kind = skCount
          Column = t_datan_supp
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = t_datanilai_faktur
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_datan_supp: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'n_supp'
        Width = 171
      end
      object t_datakd_purchase: TcxGridDBColumn
        Caption = 'Kode  PO'
        DataBinding.FieldName = 'kd_purchase'
        Width = 94
      end
      object t_datatgl_purchase: TcxGridDBColumn
        Caption = 'Tanggal PO'
        DataBinding.FieldName = 'tgl_purchase'
        Width = 72
      end
      object t_datanilai_faktur: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'nilai_faktur'
        Width = 69
      end
      object t_dataColumn1: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sPanel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sb_2: TsSpeedButton
      Left = 0
      Top = 90
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_2Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 2
      Images = dm.gambar
      Reflected = True
    end
    object sb_1: TsSpeedButton
      Left = 0
      Top = 0
      Width = 150
      Height = 90
      Cursor = crHandPoint
      Caption = 'Selesai'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      OnClick = sb_1Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 10
      Images = dm.gambar
      Reflected = True
    end
    object p1: TsPanel
      Left = 0
      Top = 352
      Width = 150
      Height = 90
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object l_1: TsLabel
        Left = 4
        Top = 5
        Width = 31
        Height = 13
        Caption = 'Mulai :'
      end
      object l_2: TsLabel
        Left = 4
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Sampai :'
      end
      object de_mulai: TsDateEdit
        Left = 4
        Top = 21
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object de_sampai: TsDateEdit
        Left = 4
        Top = 61
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 704
    Top = 128
  end
end
