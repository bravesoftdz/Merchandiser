object F_Utama: TF_Utama
  Left = 251
  Top = 65
  Width = 965
  Height = 635
  Caption = 'Point of sales'
  Color = clBtnFace
  Constraints.MinWidth = 915
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 0
    Top = 385
    Width = 949
    Height = 4
    Cursor = crVSplit
    Align = alTop
    SkinData.SkinSection = 'SPLITTER'
  end
  object sb: TsStatusBar
    Left = 0
    Top = 576
    Width = 949
    Height = 21
    Panels = <
      item
        Alignment = taCenter
        Text = '  Jum'#39'at  '
        Width = 80
      end
      item
        Alignment = taCenter
        Text = '27/01/1989'
        Width = 80
      end
      item
        Alignment = taCenter
        Text = '06:00:00'
        Width = 70
      end
      item
        Alignment = taCenter
        Width = 70
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
  object sCoolBar1: TsPanel
    Left = 0
    Top = 0
    Width = 949
    Height = 70
    Align = alTop
    BorderWidth = 5
    ParentBackground = True
    ParentColor = True
    TabOrder = 1
    SkinData.SkinSection = 'TOOLBAR'
    object sb_inventory: TsSpeedButton
      Left = 6
      Top = 6
      Width = 139
      Height = 58
      Cursor = crHandPoint
      Caption = 'Inventory'#13#10'Toko'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_inventoryClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 1
      Images = dm.gambar
      Reflected = True
    end
    object sb_toko: TsSpeedButton
      Left = 145
      Top = 6
      Width = 168
      Height = 58
      Cursor = crHandPoint
      Caption = 'Perkembangan'#13#10'Toko'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      OnClick = sb_tokoClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 3
      Images = dm.gambar
      Reflected = True
    end
    object sb_laporan: TsSpeedButton
      Left = 457
      Top = 6
      Width = 144
      Height = 58
      Cursor = crHandPoint
      Caption = 'Laporan'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      Align = alLeft
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_laporan
      ImageIndex = 4
      Images = dm.gambar
      Reflected = True
    end
    object sb_tutup_kasir: TsSpeedButton
      Left = 313
      Top = 6
      Width = 144
      Height = 58
      Cursor = crHandPoint
      Caption = 'Tutup'#13#10'Kasir'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_tutup_kasirClick
      Align = alLeft
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 5
      Images = dm.gambar
      Reflected = True
    end
    object sb_tutup_toko: TsSpeedButton
      Left = 783
      Top = 6
      Width = 160
      Height = 58
      Cursor = crHandPoint
      Caption = 'Tutup Toko'#13#10'dan Keluar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_tutup_tokoClick
      Align = alRight
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 6
      Images = dm.gambar
      Reflected = True
    end
    object sb_refresh: TsSpeedButton
      Left = 601
      Top = 6
      Width = 144
      Height = 58
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
  object dbc_mutasi: TDBChart
    Left = 0
    Top = 389
    Width = 949
    Height = 187
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    LeftWall.Color = 16744576
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -32
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'PERKEMBANGAN MUTASI HARGA')
    Legend.Alignment = laBottom
    Align = alClient
    TabOrder = 2
    OnDblClick = dbc_mutasiDblClick
    object Series4: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clRed
      Title = 'Receipt'
      XLabelsSource = 'tgl'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'uang_receipt'
    end
    object Series2: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clBlue
      Title = 'Sales'
      XLabelsSource = 'tgl'
      BarStyle = bsRectGradient
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'uang_sales'
    end
    object Series5: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clGreen
      Title = 'Return'
      XLabelsSource = 'tgl'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'uang_return'
    end
    object Series6: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clYellow
      Title = 'Koreksi'
      XLabelsSource = 'tgl'
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'uang_koreksi'
    end
  end
  object DBC_margin: TDBChart
    Left = 0
    Top = 94
    Width = 949
    Height = 291
    AllowPanning = pmNone
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    LeftWall.Brush.Color = clWhite
    LeftWall.Color = 4210816
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clRed
    Title.Font.Height = -32
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'PERKEMBANGAN GROSS MARGIN')
    Legend.Alignment = laBottom
    View3DOptions.Elevation = 341
    Align = alTop
    TabOrder = 3
    OnDblClick = DBC_marginDblClick
    object sLabel1: TsLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Periode'
    end
    object cb_periode: TsComboBox
      Left = 48
      Top = 6
      Width = 129
      Height = 22
      Alignment = taLeftJustify
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'COMBOBOX'
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = -1
      TabOrder = 0
      OnChange = cb_periodeChange
    end
    object s_mg_today: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_gross
      SeriesColor = clRed
      Title = 'Margin Hari ini'
      XLabelsSource = 'tanggal'
      BarStyle = bsRectGradient
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'gm_rp'
    end
    object s_mg_until: TBarSeries
      Marks.ArrowLength = 20
      Marks.Style = smsValue
      Marks.Visible = False
      DataSource = dm.Q_gross
      SeriesColor = clGreen
      Title = 'Margin s/d Hari ini'
      XLabelsSource = 'tanggal'
      BarStyle = bsRectGradient
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'sdh_gm_rp'
    end
  end
  object tc_child: TsTabControl
    Left = 0
    Top = 70
    Width = 949
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    TabOrder = 4
    Visible = False
    OnChange = tc_childChange
    SkinData.SkinSection = 'PAGECONTROL'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 72
    Top = 168
  end
  object pm_laporan: TPopupMenu
    OwnerDraw = True
    Left = 552
    Top = 8
    object PenjualanItemHarian1: TMenuItem
      Caption = 'Penjualan Item Harian'
      OnClick = PenjualanItemHarian1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ExportImportData1: TMenuItem
      Caption = 'Export Import Data'
      OnClick = ExportImportData1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object laporanpo: TMenuItem
      Caption = 'Purchase Order (PO)'
      object PO1: TMenuItem
        Caption = 'PO'
        OnClick = PO1Click
      end
      object DaftarPO1: TMenuItem
        Caption = 'Daftar PO'
        OnClick = DaftarPO1Click
      end
    end
    object LaporanTerimaBarang1: TMenuItem
      Caption = 'Terima Barang'
      object ReceiptOrderRO1: TMenuItem
        Caption = 'Receipt Order (RO)'
        OnClick = ReceiptOrderRO1Click
      end
      object DaftarRO1: TMenuItem
        Caption = 'Daftar RO'
        OnClick = DaftarRO1Click
      end
    end
    object LaporanReturnBarang1: TMenuItem
      Caption = 'Return Barang'
      object Return1: TMenuItem
        Caption = 'Return'
        OnClick = Return1Click
      end
      object DaftarReturn1: TMenuItem
        Caption = 'Daftar Return'
        OnClick = DaftarReturn1Click
      end
    end
    object mniLaporanSO: TMenuItem
      Caption = 'Stock Opname (SO)'
      object mniStockOpnameSO2: TMenuItem
        Caption = 'Stock Opname (SO)'
      end
      object mniDaftarSO1: TMenuItem
        Caption = 'Daftar SO'
        OnClick = mniDaftarSO1Click
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Planogram1: TMenuItem
      Caption = 'Planogram'
      OnClick = Planogram1Click
    end
    object RealCard1: TMenuItem
      Caption = 'Real Card / Barcode'
      OnClick = RealCard1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object DaftarPelanggan1: TMenuItem
      Caption = 'Daftar Pelanggan'
      OnClick = DaftarPelanggan1Click
    end
    object DaftarSupplier1: TMenuItem
      Caption = 'Daftar Supplier'
      OnClick = DaftarSupplier1Click
    end
  end
  object spd: TsSavePictureDialog
    Left = 320
    Top = 206
  end
  object MadExceptionHandler1: TMadExceptionHandler
    Left = 8
    Top = 166
  end
  object Q_time: TmySQLQuery
    Database = dm.db_conn
    Left = 128
    Top = 168
  end
end
