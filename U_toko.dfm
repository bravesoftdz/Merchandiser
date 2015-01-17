object F_toko: TF_toko
  Left = 307
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Perkembangan Toko'
  ClientHeight = 544
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pc_toko: TsPageControl
    Left = 0
    Top = 0
    Width = 796
    Height = 544
    ActivePage = ts_margin
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Rockwell'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object ts_margin: TsTabSheet
      BorderWidth = 1
      Caption = 'Gross margin'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel1: TsLabel
        Left = 8
        Top = 8
        Width = 769
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'PERKEMBANGAN GROSS MARGIN TOKO'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
      end
      object sStickyLabel1: TsStickyLabel
        Left = 56
        Top = 54
        Width = 689
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Hari ini'
        ParentBiDiMode = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        AlignTo = altTop
        AttachTo = DBGrid3
      end
      object sStickyLabel2: TsStickyLabel
        Left = 56
        Top = 246
        Width = 689
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Sampai dengan Hari ini'
        ParentBiDiMode = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        AlignTo = altTop
        AttachTo = DBGrid4
      end
      object DBGrid3: TDBGrid
        Left = 56
        Top = 72
        Width = 689
        Height = 161
        DataSource = dm.ds_gross
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'hpp'
            Title.Alignment = taRightJustify
            Title.Caption = 'HPP'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sales'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sales'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qty_sales'
            Title.Alignment = taCenter
            Title.Caption = 'QTY'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'struk'
            Title.Alignment = taCenter
            Title.Caption = 'STD'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'avg_pembelian'
            Title.Alignment = taRightJustify
            Title.Caption = 'APC'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gm_rp'
            Title.Alignment = taRightJustify
            Title.Caption = 'GM (Rp)'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'gm_Persen'
            Title.Alignment = taCenter
            Title.Caption = 'GM (%)'
            Width = 83
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 56
        Top = 264
        Width = 689
        Height = 190
        DataSource = dm.ds_gross
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tanggal'
            Title.Caption = 'Tanggal'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_sales'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sales'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_qty_sales'
            Title.Alignment = taCenter
            Title.Caption = 'QTY'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_struk'
            Title.Alignment = taCenter
            Title.Caption = 'STD'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_avg_pembelian'
            Title.Alignment = taRightJustify
            Title.Caption = 'APC'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_gm_rp'
            Title.Alignment = taRightJustify
            Title.Caption = 'GM (Rp)'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sdh_gm_persen'
            Title.Alignment = taCenter
            Title.Caption = 'GM (%)'
            Width = 96
            Visible = True
          end>
      end
      object b_cetak: TsButton
        Left = 672
        Top = 464
        Width = 75
        Height = 25
        Caption = '&Preview'
        TabOrder = 2
        OnClick = b_cetakClick
        SkinData.SkinSection = 'BUTTON'
      end
      object btn_benarkan_mutasi: TsButton
        Left = 56
        Top = 472
        Width = 161
        Height = 25
        Caption = '&Repair Mutasi'
        TabOrder = 3
        OnClick = btn_benarkan_mutasiClick
        SkinData.SkinSection = 'BUTTON'
      end
      object dt_mutasi: TsDateEdit
        Left = 224
        Top = 472
        Width = 129
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 4
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
    object ts_mutasi: TsTabSheet
      BorderWidth = 1
      Caption = 'Mutasi'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel10: TsLabel
        Left = 8
        Top = 8
        Width = 769
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'PERKEMBANGAN MUTASI TOKO'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
      end
      object sStickyLabel3: TsStickyLabel
        Left = 104
        Top = 46
        Width = 601
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Mutasi Barang'
        ParentBiDiMode = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        AlignTo = altTop
        AttachTo = DBGrid1
      end
      object sStickyLabel4: TsStickyLabel
        Left = 104
        Top = 254
        Width = 601
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'Mutasi Harga'
        ParentBiDiMode = False
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        AlignTo = altTop
        AttachTo = DBGrid2
      end
      object DBGrid1: TDBGrid
        Left = 104
        Top = 64
        Width = 601
        Height = 180
        DataSource = dm.ds_mutasi_toko
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tgl'
            Title.Caption = 'Tanggal'
            Width = 77
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_awal'
            Title.Alignment = taCenter
            Title.Caption = 'Stok Awal'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_receipt'
            Title.Alignment = taCenter
            Title.Caption = 'Receipt'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_return'
            Title.Alignment = taCenter
            Title.Caption = 'Return'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_sales'
            Title.Alignment = taCenter
            Title.Caption = 'Sales'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_koreksi'
            Title.Alignment = taCenter
            Title.Caption = 'Koreksi'
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_ahir'
            Title.Alignment = taCenter
            Title.Caption = 'Stok Akhir'
            Width = 83
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 104
        Top = 272
        Width = 601
        Height = 180
        DataSource = dm.ds_mutasi_toko
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'tgl'
            Title.Caption = 'Tanggal'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_awal'
            Title.Alignment = taRightJustify
            Title.Caption = 'Saldo Awal'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_receipt'
            Title.Alignment = taRightJustify
            Title.Caption = 'Receipt'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_return'
            Title.Alignment = taRightJustify
            Title.Caption = 'Return'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_sales'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sales'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_koreksi'
            Title.Alignment = taRightJustify
            Title.Caption = 'Koreksi'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_ahir'
            Title.Alignment = taRightJustify
            Title.Caption = 'Saldo Akhir'
            Width = 83
            Visible = True
          end>
      end
      object sButton1: TsButton
        Left = 624
        Top = 464
        Width = 75
        Height = 25
        Caption = '&Preview'
        TabOrder = 2
        OnClick = sButton1Click
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object sTabSheet1: TsTabSheet
      Caption = 'Stock Out'
      SkinData.CustomColor = False
      SkinData.CustomFont = False
      object sLabel3: TsLabel
        Left = 56
        Top = 8
        Width = 689
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'LAPORAN STOCK OUT HARIAN'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
      end
      object sButton2: TsButton
        Left = 704
        Top = 472
        Width = 75
        Height = 25
        Caption = '&Preview'
        TabOrder = 0
        OnClick = sButton2Click
        SkinData.SkinSection = 'BUTTON'
      end
      object g_stok: TcxGrid
        Left = 8
        Top = 48
        Width = 769
        Height = 417
        TabOrder = 1
        object grid_data: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dm.ds_stok_out
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object clmn_stokGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = 'PID'
            DataBinding.FieldName = 'kd_barang'
            Width = 94
          end
          object clmn_stokGrid1DBTableView1Column2: TcxGridDBColumn
            Caption = 'Deskripsi'
            DataBinding.FieldName = 'n_barang'
            Width = 357
          end
          object clmn_stokGrid1DBTableView1Column3: TcxGridDBColumn
            Caption = 'Jenis'
            DataBinding.FieldName = 'n_jenis'
            Width = 157
          end
          object clmn_stokGrid1DBTableView1Column4: TcxGridDBColumn
            Caption = 'Golongan'
            DataBinding.FieldName = 'n_golbrg'
            Width = 159
          end
        end
        object g_Grid1Level1: TcxGridLevel
          GridView = grid_data
        end
      end
    end
  end
end
