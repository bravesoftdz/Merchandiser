object f_return: Tf_return
  Left = 10
  Top = 112
  Caption = 'Return Barang'
  ClientHeight = 411
  ClientWidth = 854
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 870
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
  PixelsPerInch = 96
  TextHeight = 13
  object panel4: TPanel
    Left = 704
    Top = 0
    Width = 150
    Height = 411
    Align = alRight
    TabOrder = 1
    object sSpeedButton18: TsSpeedButton
      Left = 1
      Top = 1
      Width = 148
      Height = 96
      Cursor = crHandPoint
      Align = alTop
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
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 10
      Reflected = True
    end
    object sPanel2: TPanel
      Left = 1
      Top = 369
      Width = 148
      Height = 41
      Align = alBottom
      TabOrder = 0
      object b_load: TButton
        Left = 8
        Top = 9
        Width = 129
        Height = 25
        Caption = '&Load File'
        TabOrder = 0
        OnClick = b_loadClick
      end
    end
    object spnl1: TPanel
      Left = 1
      Top = 104
      Width = 148
      Height = 97
      TabOrder = 1
      object b_print: TButton
        Left = 8
        Top = 64
        Width = 129
        Height = 25
        Caption = '&Print Preview'
        TabOrder = 2
        OnClick = b_printClick
      end
      object b_new: TButton
        Left = 8
        Top = 34
        Width = 129
        Height = 25
        Caption = '&Baru'
        TabOrder = 1
        OnClick = b_newClick
      end
      object b_simpan: TButton
        Left = 8
        Top = 4
        Width = 129
        Height = 25
        Caption = '&Simpan'
        TabOrder = 0
        OnClick = b_simpanClick
      end
    end
  end
  object sPanel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 411
    Align = alClient
    TabOrder = 0
    object Grid: TcxGrid
      Left = 1
      Top = 137
      Width = 702
      Height = 201
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object TableView: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Append.Visible = False
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
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = t_view_Qty
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            Column = view_harga
          end
          item
            Format = '###,###,##0;(###,###,##0);0'
            Kind = skSum
            OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText
            Column = view_total
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
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Belum ada Data>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 10
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
        object view_harga: TcxGridColumn
          Caption = 'Harga'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
          Properties.EditFormat = '###,###,##0;(###,###,##0);0'
          GroupSummaryAlignment = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Options.IncSearch = False
          Width = 83
        end
        object view_total: TcxGridColumn
          Caption = 'Total Harga'
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
    object panel1: TPanel
      Left = 1
      Top = 1
      Width = 702
      Height = 73
      Align = alTop
      Enabled = False
      TabOrder = 3
      object Mm_nama: TMemo
        Left = 1
        Top = 1
        Width = 420
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
      end
      object ce_harga: TsCurrencyEdit
        Left = 421
        Top = 1
        Width = 280
        Height = 71
        Align = alRight
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
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DecimalPlaces = 0
        DisplayFormat = '###,###,##0;-###,###,##0;0'
      end
    end
    object panel2: TPanel
      Left = 1
      Top = 74
      Width = 702
      Height = 63
      Align = alTop
      TabOrder = 0
      object sLabel6: TLabel
        Left = 481
        Top = 1
        Width = 220
        Height = 60
        Align = alRight
        Alignment = taRightJustify
        Caption = 'RETURN'
        Constraints.MinWidth = 220
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'ARIAL'
        Font.Style = []
        ParentFont = False
      end
      object sLabel1: TLabel
        Left = 8
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Faktur Return'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sLabel3: TLabel
        Left = 264
        Top = 32
        Width = 39
        Height = 13
        Caption = 'Tanggal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sLabel4: TLabel
        Left = 264
        Top = 8
        Width = 38
        Height = 13
        Caption = 'Supplier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sLabel5: TLabel
        Left = 8
        Top = 32
        Width = 70
        Height = 13
        Caption = 'Faktur Receipt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ed_no_faktur: TEdit
        Left = 88
        Top = 8
        Width = 169
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
        OnChange = ed_no_fakturChange
      end
      object ed_tgl: TsDateEdit
        Left = 312
        Top = 32
        Width = 137
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
        ReadOnly = True
        TabOrder = 3
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        DefaultToday = True
      end
      object ed_supplier: TEdit
        Left = 312
        Top = 6
        Width = 137
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
        TabOrder = 2
      end
      object ed_fak_receipt: TEdit
        Left = 88
        Top = 32
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = ed_fak_receiptChange
      end
    end
    object panel3: TPanel
      Left = 1
      Top = 338
      Width = 702
      Height = 72
      Align = alBottom
      TabOrder = 2
      object ed_nilai_faktur: TsCurrencyEdit
        Left = 325
        Top = 1
        Width = 376
        Height = 70
        Align = alRight
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
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 8
  end
  object od: TsOpenDialog
    DefaultExt = '.srk'
    Filter = 'RB File|*.srk'
    Left = 843
    Top = 408
  end
end
