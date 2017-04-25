object F_Utama: TF_Utama
  Left = 251
  Top = 65
  Caption = 'Point of sales'
  ClientHeight = 443
  ClientWidth = 899
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
    Width = 899
    Height = 4
    Cursor = crVSplit
    Align = alTop
    SkinData.SkinSection = 'SPLITTER'
    ExplicitWidth = 949
  end
  object sb: TStatusBar
    Left = 0
    Top = 422
    Width = 899
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
        Text = 'USER'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'NAMA USER'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'KODE'
        Width = 80
      end
      item
        Alignment = taCenter
        Text = 'PERUSAHAAN'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'DATABASE@HOST'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'PUSAT'
        Width = 50
      end
      item
        Text = 'VERSI'
        Width = 50
      end>
  end
  object PnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 899
    Height = 70
    Align = alTop
    BorderWidth = 5
    ParentColor = True
    TabOrder = 1
    object sb_inventory: TsSpeedButton
      Left = 6
      Top = 6
      Width = 139
      Height = 58
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Barang'#13#10'Toko'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      OnClick = sb_inventoryClick
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 1
      Reflected = True
    end
    object sb_toko: TsSpeedButton
      Left = 145
      Top = 6
      Width = 168
      Height = 58
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Perkembangan'#13#10'Toko'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      OnClick = sb_tokoClick
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 3
      Reflected = True
    end
    object sb_laporan: TsSpeedButton
      Left = 457
      Top = 6
      Width = 144
      Height = 58
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Laporan'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      Spacing = 2
      ButtonStyle = tbsDropDown
      SkinData.SkinSection = 'TOOLBUTTON'
      DropdownMenu = pm_laporan
      Images = dm.gambar
      ImageIndex = 4
      Reflected = True
    end
    object sb_tutup_kasir: TsSpeedButton
      Left = 313
      Top = 6
      Width = 144
      Height = 58
      Cursor = crHandPoint
      Align = alLeft
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
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 5
      Reflected = True
    end
    object sb_tutup_toko: TsSpeedButton
      Left = 733
      Top = 6
      Width = 160
      Height = 58
      Cursor = crHandPoint
      Align = alRight
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
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 6
      Reflected = True
      ExplicitLeft = 783
    end
    object sb_refresh: TsSpeedButton
      Left = 601
      Top = 6
      Width = 144
      Height = 58
      Cursor = crHandPoint
      Align = alLeft
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
      SkinData.SkinSection = 'TOOLBUTTON'
      Images = dm.gambar
      ImageIndex = 2
      Reflected = True
    end
  end
  object dbc_mutasi: TDBChart
    Left = 0
    Top = 389
    Width = 899
    Height = 33
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    LeftWall.Color = 16744576
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Font.Height = -32
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'PERKEMBANGAN MUTASI HARGA')
    Legend.Alignment = laBottom
    Zoom.Allow = False
    Align = alClient
    TabOrder = 2
    OnDblClick = dbc_mutasiDblClick
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series4: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clRed
      Title = 'Receipt'
      XLabelsSource = 'tgl'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'uang_receipt'
    end
    object Series5: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clGreen
      Title = 'Return'
      XLabelsSource = 'tgl'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'uang_return'
    end
    object Series2: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clBlue
      Title = 'Jual'
      XLabelsSource = 'tgl'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'uang_sales'
    end
    object Series1: TBarSeries
      Marks.Visible = False
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clAqua
      Title = 'Return Jual'
      XLabelsSource = 'tgl'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'uang_return_jual'
    end
    object Series6: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_mutasi_toko
      SeriesColor = clYellow
      Title = 'Koreksi'
      XLabelsSource = 'tgl'
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'uang_koreksi'
    end
  end
  object DBC_margin: TDBChart
    Left = 0
    Top = 94
    Width = 899
    Height = 291
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    LeftWall.Color = 4210816
    MarginBottom = 2
    MarginLeft = 2
    MarginRight = 2
    MarginTop = 2
    Title.Font.Color = clRed
    Title.Font.Height = -32
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'PERKEMBANGAN GROSS MARGIN')
    Legend.Alignment = laBottom
    View3DOptions.Elevation = 341
    Align = alTop
    TabOrder = 3
    OnDblClick = DBC_marginDblClick
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object sLabel1: TLabel
      Left = 8
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Periode'
    end
    object cb_periode: TComboBox
      Left = 48
      Top = 6
      Width = 129
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cb_periodeChange
    end
    object s_mg_jual: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_gross
      SeriesColor = clGreen
      Title = 'Penjualan'
      XLabelsSource = 'tanggal'
      BarStyle = bsRectGradient
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'sales'
    end
    object s_mg_laba: TBarSeries
      Marks.Visible = False
      Marks.Style = smsValue
      DataSource = dm.Q_gross
      SeriesColor = clRed
      Title = 'Margin'
      XLabelsSource = 'tanggal'
      BarStyle = bsRectGradient
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      YValues.ValueSource = 'gm_rp'
    end
  end
  object tc_child: TTabControl
    Left = 0
    Top = 70
    Width = 899
    Height = 24
    Cursor = crHandPoint
    Align = alTop
    TabOrder = 4
    Visible = False
    OnChange = tc_childChange
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
        OnClick = mniStockOpnameSO2Click
      end
      object DaftarRencanaSO1: TMenuItem
        Caption = 'Daftar Rencana SO'
        OnClick = DaftarRencanaSO1Click
      end
      object N5: TMenuItem
        Caption = '-'
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
      Caption = 'Real Card'
      OnClick = RealCard1Click
    end
    object Barcode1: TMenuItem
      Caption = 'Barcode'
      OnClick = Barcode1Click
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
  object Q_time: TMyQuery
    Connection = dm.db_conn
    Left = 128
    Top = 168
  end
end
