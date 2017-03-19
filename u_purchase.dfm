object f_purchase: Tf_purchase
  Left = 200
  Top = 107
  Width = 1005
  Height = 581
  Caption = 'Purchase Order (PO)'
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object panel4: TsPanel
    Left = 839
    Top = 0
    Width = 150
    Height = 542
    Align = alRight
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sSpeedButton18: TsSpeedButton
      Left = 1
      Top = 1
      Width = 148
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
      OnClick = sSpeedButton18Click
      Align = alTop
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 10
      Images = dm.gambar
      Reflected = True
    end
    object b_rekom: TsButton
      Left = 8
      Top = 196
      Width = 129
      Height = 25
      Caption = '&RECOMENDED'
      TabOrder = 1
      OnClick = b_rekomClick
      SkinData.SkinSection = 'BUTTON'
    end
    object sPanel2: TsPanel
      Left = 1
      Top = 467
      Width = 148
      Height = 74
      Align = alBottom
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object b_simpan_file: TsButton
        Left = 8
        Top = 9
        Width = 129
        Height = 25
        Caption = 'Simpan &File'
        TabOrder = 0
        OnClick = b_simpan_fileClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_load: TsButton
        Left = 8
        Top = 41
        Width = 129
        Height = 25
        Caption = '&Load File'
        TabOrder = 1
        OnClick = b_loadClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object spnl1: TsPanel
      Left = 1
      Top = 91
      Width = 148
      Height = 97
      Align = alTop
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object b_new: TsButton
        Left = 8
        Top = 34
        Width = 129
        Height = 25
        Caption = '&Baru'
        TabOrder = 1
        OnClick = b_newClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_simpan: TsButton
        Left = 8
        Top = 4
        Width = 129
        Height = 25
        Caption = '&Simpan'
        TabOrder = 0
        OnClick = b_simpanClick
        SkinData.SkinSection = 'BUTTON'
      end
      object b_print: TsButton
        Left = 8
        Top = 64
        Width = 129
        Height = 25
        Caption = '&Print Preview'
        Enabled = False
        TabOrder = 2
        OnClick = b_printClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 542
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object Grid: TcxGrid
      Left = 1
      Top = 170
      Width = 837
      Height = 299
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TableView: TcxGridTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Append.Visible = False
        OnFocusedRecordChanged = TableViewFocusedRecordChanged
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Total'
            Kind = skCount
            Column = ableViewColumn1
            DisplayText = 'Total'
          end
          item
            Format = '0 Item Barang'
            Kind = skCount
            Column = ableViewColumn2
            DisplayText = 'baris 5'
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = t_view_Qty
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = t_view_harga
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
            Column = t_view_total_harga
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Belum ada Data>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 10
        Styles.Inactive = cxstyl1
        Styles.Selection = cxstyl1
        object ableViewColumn1: TcxGridColumn
          Caption = 'PID'
          GroupSummaryAlignment = taCenter
          Options.Editing = False
          Width = 58
        end
        object ableViewColumn2: TcxGridColumn
          Caption = 'Deskripsi'
          GroupSummaryAlignment = taCenter
          Options.Editing = False
          Width = 232
        end
        object t_view_Qty: TcxGridColumn
          Caption = 'Qty'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          Properties.MinValue = 1.000000000000000000
          GroupSummaryAlignment = taCenter
          HeaderAlignmentHorz = taCenter
          Options.IncSearch = False
          Width = 58
        end
        object t_view_harga: TcxGridColumn
          Caption = 'Harga'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.IncSearch = False
          Width = 81
        end
        object t_view_total_harga: TcxGridColumn
          Caption = 'Total Harga'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.IncSearch = False
        end
        object t_view_barcode: TcxGridColumn
          Caption = 'Barcode'
          Visible = False
          Options.Editing = False
        end
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
    object panel1: TsPanel
      Left = 1
      Top = 1
      Width = 837
      Height = 73
      Align = alTop
      Enabled = False
      TabOrder = 3
      SkinData.SkinSection = 'PANEL'
      object Mm_nama: TsMemo
        Left = 1
        Top = 1
        Width = 555
        Height = 71
        Align = alClient
        Alignment = taCenter
        Color = 15263976
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
      end
      object ce_harga: TsCurrencyEdit
        Left = 556
        Top = 1
        Width = 280
        Height = 71
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = 15263976
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -59
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Align = alRight
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 0
        DisplayFormat = '###,###,##0;-###,###,##0;0'
      end
    end
    object panel2: TsPanel
      Left = 1
      Top = 74
      Width = 837
      Height = 96
      Align = alTop
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      DesignSize = (
        837
        96)
      object sLabel5: TsLabel
        Left = 544
        Top = 1
        Width = 292
        Height = 63
        Align = alRight
        Alignment = taRightJustify
        Caption = 'PURCHASE'
        Constraints.MinWidth = 220
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'ARIAL'
        Font.Style = []
      end
      object sBevel1: TsBevel
        Left = 1
        Top = 64
        Width = 835
        Height = 31
        Align = alBottom
      end
      object sLabel1: TsLabel
        Left = 8
        Top = 32
        Width = 62
        Height = 13
        Caption = 'No Purchase'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel3: TsLabel
        Left = 8
        Top = 72
        Width = 39
        Height = 13
        Caption = 'Tanggal'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sLabel4: TsLabel
        Left = 8
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Supplier'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
      end
      object sb_cari: TsSpeedButton
        Tag = 9
        Left = 232
        Top = 70
        Width = 24
        Height = 21
        OnClick = sb_cariClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        ImageIndex = 0
        Images = dm.im
      end
      object ed_no_faktur: TsEdit
        Left = 80
        Top = 32
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = ed_no_fakturChange
        OnKeyDown = ed_no_fakturKeyDown
        SkinData.CustomColor = True
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
      object ed_tgl: TsDateEdit
        Left = 80
        Top = 70
        Width = 145
        Height = 21
        AutoSize = False
        Color = clWhite
        EditMask = '!99/99/9999;1; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 3
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DefaultToday = True
      end
      object ed_supplier: TsEdit
        Left = 80
        Top = 8
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.CustomColor = True
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
      object ed_code: TsEdit
        Left = 264
        Top = 70
        Width = 569
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnKeyDown = ed_codeKeyDown
        OnKeyPress = ed_codeKeyPress
        SkinData.CustomColor = True
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
      object b_auto: TsButton
        Left = 232
        Top = 32
        Width = 73
        Height = 21
        Caption = '&Auto Kode'
        TabOrder = 2
        OnClick = b_autoClick
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object panel3: TsPanel
      Left = 1
      Top = 469
      Width = 837
      Height = 72
      Align = alBottom
      Enabled = False
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
      object ed_nilai_faktur: TsCurrencyEdit
        Left = 460
        Top = 1
        Width = 376
        Height = 70
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        Color = 15263976
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -59
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Align = alRight
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 0
        DisplayFormat = '###,###,##0;-###,###,##0;0'
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
    Left = 8
    Top = 8
  end
  object od: TsOpenDialog
    DefaultExt = '.spo'
    Filter = 'PO File|*.spo'
    Left = 883
    Top = 312
  end
  object sd: TsSaveDialog
    DefaultExt = '.spo'
    Filter = 'PO File|*.spo'
    Left = 851
    Top = 312
  end
  object stl1: TcxStyleRepository
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clTeal
      TextColor = clBtnHighlight
    end
  end
end
