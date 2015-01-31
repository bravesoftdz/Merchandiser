object F_SO: TF_SO
  Left = 256
  Top = 143
  Width = 1040
  Height = 570
  Caption = 'Stock Opname'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Rockwell'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 305
    Width = 1024
    Height = 205
    Align = alClient
    TabOrder = 2
    object t_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dm.ds_barang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Tidak Ada Data yang Bisa ditampilkan>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object t_dataRak: TcxGridDBColumn
        DataBinding.FieldName = 'Rak'
        SortIndex = 0
        SortOrder = soAscending
        Width = 44
      end
      object t_dataShelving: TcxGridDBColumn
        DataBinding.FieldName = 'Shelving'
        SortIndex = 1
        SortOrder = soAscending
        Width = 68
      end
      object t_dataColumn1: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'urut'
        SortIndex = 2
        SortOrder = soAscending
        Width = 38
      end
      object t_datakd_barang: TcxGridDBColumn
        Caption = 'PID'
        DataBinding.FieldName = 'kd_barang'
        Width = 116
      end
      object t_databarcode: TcxGridDBColumn
        Caption = 'Barcode'
        DataBinding.FieldName = 'barcode'
        Width = 174
      end
      object t_datan_barang: TcxGridDBColumn
        Caption = 'Deskripsi Barang'
        DataBinding.FieldName = 'n_barang'
        Width = 482
      end
    end
    object t_koreksi: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnEditValueChanged = t_koreksiEditValueChanged
      DataController.DataSource = dm.ds_koreksi
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0 (Item)'
          Kind = skCount
          FieldName = 'kd_barang'
        end
        item
          Format = '0 (Barang OH)'
          Kind = skSum
          FieldName = 'qty_oh'
        end
        item
          Format = '0 (OH)'
          Kind = skSum
          FieldName = 'harga_pokok_oh'
        end
        item
          Format = '0 (Selisih Rp)'
          Kind = skSum
          FieldName = 'selisih_rp'
        end
        item
          Format = '0 (Qty Real)'
          Kind = skSum
          FieldName = 'qty_real'
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 (Item)'
          Kind = skCount
          FieldName = 'kd_barang'
          Column = t_koreksiColumn1
        end
        item
          Format = '0 (Barang OH)'
          Kind = skSum
          FieldName = 'qty_oh'
          Column = t_koreksikd_barang
        end
        item
          Format = '0 (Qty Real)'
          Kind = skSum
          FieldName = 'qty_real'
          Column = t_koreksiqty_real
        end
        item
          Format = '0 (OH)'
          Kind = skSum
          FieldName = 'harga_pokok_oh'
          Column = t_koreksibarcode
        end
        item
          Format = '0 (Selisih Rp)'
          Kind = skSum
          FieldName = 'selisih_rp'
          Column = t_koreksin_barang
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsView.NoDataToDisplayInfoText = '<Tidak Ada Data yang Bisa ditampilkan>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 14
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.FilterBox = cxStyle2
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
      Styles.Group = cxStyle3
      Styles.Header = cxStyle4
      Styles.Indicator = dm.cxstyl1
      object t_koreksiRak: TcxGridDBColumn
        DataBinding.FieldName = 'Rak'
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 51
      end
      object t_koreksiShelving: TcxGridDBColumn
        DataBinding.FieldName = 'Shelving'
        Options.Editing = False
        Width = 78
      end
      object t_koreksiColumn1: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'urut'
        Options.Editing = False
        Width = 45
      end
      object t_koreksikd_barang: TcxGridDBColumn
        Caption = 'PID'
        DataBinding.FieldName = 'kd_barang'
        FooterAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 127
      end
      object t_koreksibarcode: TcxGridDBColumn
        Caption = 'Barcode'
        DataBinding.FieldName = 'barcode'
        FooterAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 123
      end
      object t_koreksin_barang: TcxGridDBColumn
        Caption = 'Deskripsi Barang'
        DataBinding.FieldName = 'n_barang'
        FooterAlignmentHorz = taRightJustify
        Options.Editing = False
        Width = 411
      end
      object t_koreksiqty_real: TcxGridDBColumn
        Caption = 'Qty Real'
        DataBinding.FieldName = 'qty_real'
        Options.Editing = False
        Options.IncSearch = False
        Width = 87
      end
      object t_koreksiColumn2: TcxGridDBColumn
        Caption = 'Insert at'
        DataBinding.FieldName = 'create_at'
        Visible = False
        Options.Editing = False
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
    object l_koreksi: TcxGridLevel
      GridView = t_koreksi
    end
  end
  object sCoolBar1: TsPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 97
    Align = alTop
    BorderWidth = 5
    ParentBackground = True
    ParentColor = True
    TabOrder = 0
    SkinData.SkinSection = 'TOOLBAR'
    object sb_Persiapan: TsSpeedButton
      Left = 6
      Top = 6
      Width = 203
      Height = 85
      Cursor = crHandPoint
      Caption = '&Lembar Baru'#13#10'Stock Opname (SO)'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_PersiapanClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 9
      Images = dm.gambar
      Reflected = True
    end
    object sb_penyesuaian: TsSpeedButton
      Left = 209
      Top = 6
      Width = 176
      Height = 85
      Cursor = crHandPoint
      Caption = '&Penyesuaian '#13#10'Stock'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_daftar
      ImageIndex = 8
      Images = dm.gambar
      Reflected = True
    end
    object sBitBtn1: TsSpeedButton
      Left = 872
      Top = 6
      Width = 146
      Height = 85
      Cursor = crHandPoint
      Caption = 'K&eluar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 8
      OnClick = sBitBtn1Click
      Align = alRight
      SkinData.SkinSection = 'TOOLBUTTON'
      DisabledGlyphKind = []
      ImageIndex = 0
      Images = dm.gambar
      Reflected = True
    end
    object sb_ahir: TsSpeedButton
      Left = 385
      Top = 6
      Width = 208
      Height = 85
      Cursor = crHandPoint
      Caption = '&Adjustment '#13#10'Stock Opname (SO)'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      PopupMenu = pm_daftar
      Spacing = 2
      OnClick = sb_ahirClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 7
      Images = dm.gambar
      Reflected = True
    end
    object sb_refresh: TsSpeedButton
      Left = 593
      Top = 6
      Width = 160
      Height = 85
      Cursor = crHandPoint
      Caption = 'Refresh'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_refreshClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 2
      Images = dm.gambar
      Reflected = True
    end
  end
  object p_persiapan: TsPanel
    Left = 0
    Top = 97
    Width = 1024
    Height = 96
    Align = alTop
    PopupMenu = pm_daftar
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 20
      Top = 0
      Width = 285
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Kode Registrasi Stock Opname'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sb_cari: TsSpeedButton
      Left = 280
      Top = 56
      Width = 25
      Height = 25
      Cursor = crHandPoint
      OnClick = sb_cariClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = dm.im
    end
    object rb_pilihan: TsRadioGroup
      Left = 308
      Top = 8
      Width = 181
      Height = 73
      Caption = '| Pilihan |'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      SkinData.SkinSection = 'GROUPBOX'
      ItemIndex = 0
      Items.Strings = (
        'Semua Rak'
        'Rak No')
      OnChanging = rb_pilihanChanging
    end
    object b_tampil: TsButton
      Left = 496
      Top = 16
      Width = 97
      Height = 65
      Cursor = crHandPoint
      Caption = '&Tambah '#13#10'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = b_tampilClick
      SkinData.SkinSection = 'BUTTON'
    end
    object se_rak: TsDecimalSpinEdit
      Left = 424
      Top = 48
      Width = 57
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '1'
      Visible = False
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
      Alignment = taCenter
      Increment = 1.000000000000000000
      Value = 1.000000000000000000
      DecimalPlaces = 0
    end
    object ed_kd_SO: TsEdit
      Left = 20
      Top = 24
      Width = 229
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = ed_kd_SOChange
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
    object ED_INPUT: TsEdit
      Left = 20
      Top = 56
      Width = 253
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = ED_INPUTKeyDown
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
    object btnAuto: TsButton
      Left = 256
      Top = 24
      Width = 49
      Height = 25
      Caption = 'Auto'
      TabOrder = 5
      OnClick = btnAutoClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object p_penyesuaian: TsPanel
    Left = 0
    Top = 193
    Width = 1024
    Height = 112
    Align = alTop
    PopupMenu = pm_daftar
    TabOrder = 3
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel2: TsLabel
      Left = 124
      Top = 16
      Width = 285
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = 'Kode Registrasi Stock Opname'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object b_cetak: TsButton
      Left = 20
      Top = 8
      Width = 97
      Height = 65
      Cursor = crHandPoint
      Caption = '&Cetak '#13#10'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = b_cetakClick
      SkinData.SkinSection = 'BUTTON'
    end
    object ed_kd_koreksi: TsEdit
      Left = 124
      Top = 40
      Width = 285
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
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
    object b_koreksi: TsButton
      Left = 556
      Top = 8
      Width = 133
      Height = 65
      Cursor = crHandPoint
      Caption = '&Koreksi Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = b_koreksiClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_update: TsButton
      Left = 416
      Top = 8
      Width = 129
      Height = 65
      Cursor = crHandPoint
      Caption = 'Perbarui'#13#10'&Stock OH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = b_updateClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_batal: TsButton
      Left = 704
      Top = 8
      Width = 177
      Height = 65
      Cursor = crHandPoint
      Caption = '&Batalkan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = b_batalClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edInput: TsEdit
      Left = 1
      Top = 90
      Width = 1022
      Height = 21
      TabOrder = 5
      OnKeyDown = edInputKeyDown
      OnKeyPress = edInputKeyPress
      Align = alBottom
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
  end
  object sb: TsStatusBar
    Left = 0
    Top = 510
    Width = 1024
    Height = 21
    Panels = <
      item
        Alignment = taCenter
        Text = '  Jum'#39'at  '
        Width = 75
      end
      item
        Alignment = taCenter
        Text = '27/01/1989'
        Width = 75
      end
      item
        Alignment = taCenter
        Text = '06:00:00'
        Width = 75
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 50
      end
      item
        Width = 50
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object pm_daftar: TPopupMenu
    OwnerDraw = True
    Left = 40
    Top = 80
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 16776176
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object cxStyleRepository4: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 72
    Top = 80
  end
  object Q_time: TmySQLQuery
    Database = dm.db_conn
    Left = 56
    Top = 192
  end
end
