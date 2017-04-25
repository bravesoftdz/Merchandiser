object f_stok_opname: Tf_stok_opname
  Left = 299
  Top = 133
  Caption = 'Stock Opname'
  ClientHeight = 411
  ClientWidth = 774
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
  object panel4: TPanel
    Left = 624
    Top = 0
    Width = 150
    Height = 411
    Align = alRight
    TabOrder = 1
    object sSpeedButton18: TsSpeedButton
      Left = 1
      Top = 1
      Width = 148
      Height = 90
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
    object spnl1: TPanel
      Left = 1
      Top = 91
      Width = 148
      Height = 118
      Align = alTop
      TabOrder = 0
      object BtnCetak: TButton
        Left = 8
        Top = 8
        Width = 129
        Height = 25
        Caption = '&Cetak Lembar SO'
        TabOrder = 0
        OnClick = BtnCetakClick
      end
      object BtnKoreksi: TButton
        Left = 8
        Top = 40
        Width = 129
        Height = 25
        Caption = 'Koreksi SO'
        TabOrder = 1
        OnClick = BtnKoreksiClick
      end
      object BtnSimpan: TButton
        Left = 8
        Top = 76
        Width = 129
        Height = 25
        Caption = '&Simpan'
        TabOrder = 2
        OnClick = BtnSimpanClick
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 339
      Width = 148
      Height = 71
      Align = alBottom
      TabOrder = 1
      object BtnBaru: TButton
        Left = 8
        Top = 10
        Width = 129
        Height = 25
        Caption = '&Baru'
        TabOrder = 0
        OnClick = BtnBaruClick
      end
      object BtnBatal: TButton
        Left = 8
        Top = 40
        Width = 129
        Height = 25
        Caption = 'Batalkan SO'
        TabOrder = 1
        OnClick = BtnBatalClick
      end
    end
  end
  object sPanel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 411
    Align = alClient
    TabOrder = 0
    object panel1: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 73
      Align = alTop
      Enabled = False
      TabOrder = 1
      object Mm_nama: TsMemo
        Left = 1
        Top = 1
        Width = 340
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
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'PANEL'
      end
      object ce_harga: TsCurrencyEdit
        Left = 341
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
      Width = 622
      Height = 119
      Align = alTop
      TabOrder = 0
      object sLabel5: TLabel
        Left = 198
        Top = 1
        Width = 423
        Height = 86
        Align = alRight
        Alignment = taRightJustify
        Caption = 'STOCK OPNAME'
        Constraints.MinWidth = 220
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'ARIAL'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 60
      end
      object sBevel1: TsBevel
        Left = 1
        Top = 87
        Width = 620
        Height = 31
        Align = alBottom
        ExplicitWidth = 788
      end
      object sLabel1: TLabel
        Left = 8
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Kode SO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Sb_cari: TsSpeedButton
        Tag = 9
        Left = 9
        Top = 94
        Width = 25
        Height = 21
        OnClick = Sb_cariClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = dm.im
        ImageIndex = 0
      end
      object ed_kodeSO: TsEdit
        Left = 56
        Top = 8
        Width = 233
        Height = 21
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = ed_kodeSOChange
        OnKeyDown = ed_kodeSOKeyDown
        SkinData.CustomColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object ed_code: TsEdit
        Left = 37
        Top = 94
        Width = 1174
        Height = 21
        Color = clWhite
        TabOrder = 2
        OnKeyDown = ed_codeKeyDown
        OnKeyPress = ed_codeKeyPress
        SkinData.SkinSection = 'EDIT'
      end
      object BtnAuto: TButton
        Left = 296
        Top = 8
        Width = 65
        Height = 21
        Caption = '&Auto'
        TabOrder = 1
        OnClick = BtnAutoClick
      end
      object rg_pilihan: TsRadioGroup
        Left = 8
        Top = 32
        Width = 281
        Height = 41
        Caption = '| Pilihan |'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        SkinData.SkinSection = 'GROUPBOX'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Semua Rak'
          'Rak No')
      end
      object BtnTambah: TButton
        Left = 296
        Top = 36
        Width = 65
        Height = 36
        Cursor = crHandPoint
        Caption = '&Tambah'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = BtnTambahClick
      end
      object se_rak: TsDecimalSpinEdit
        Left = 224
        Top = 46
        Width = 57
        Height = 21
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '1'
        SkinData.SkinSection = 'EDIT'
        Increment = 1.000000000000000000
        Value = 1.000000000000000000
        DecimalPlaces = 0
      end
    end
    object grid: TcxGrid
      Left = 1
      Top = 193
      Width = 622
      Height = 217
      Align = alClient
      TabOrder = 2
      object t_koreksi: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsDsListData
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
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 14
        Styles.Inactive = dm.cxstyl1
        Styles.Indicator = dm.cxstyl1
        Styles.Selection = dm.cxstyl1
        object t_koreksiRak: TcxGridDBColumn
          DataBinding.FieldName = 'Rak'
          Options.Editing = False
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
      object l_koreksi: TcxGridLevel
        GridView = t_koreksi
      end
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 8
  end
  object QListData: TMyQuery
    Connection = dm.db_conn
    Left = 24
    Top = 232
  end
  object dsDsListData: TDataSource
    DataSet = QListData
    Left = 64
    Top = 232
  end
end
