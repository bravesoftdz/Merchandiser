object F_Setor: TF_Setor
  Left = 312
  Top = 119
  BorderStyle = bsDialog
  Caption = 'Setor Kasir'
  ClientHeight = 367
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object grid: TcxGrid
    Left = 8
    Top = 200
    Width = 657
    Height = 161
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ds_kasir
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_datauser: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'user'
        Width = 50
      end
      object t_datan_user: TcxGridDBColumn
        Caption = 'Nama User'
        DataBinding.FieldName = 'n_user'
        Width = 115
      end
      object t_datatanggal: TcxGridDBColumn
        DataBinding.FieldName = 'tanggal'
        Width = 104
      end
      object t_datastatus: TcxGridDBColumn
        Caption = 'Kondisi'
        DataBinding.FieldName = 'status'
        Width = 45
      end
      object t_datakomp: TcxGridDBColumn
        DataBinding.FieldName = 'komp'
        Width = 86
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object gb_1: TsGroupBox
    Left = 8
    Top = 56
    Width = 657
    Height = 137
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    object l_1: TsLabel
      Left = 8
      Top = 16
      Width = 53
      Height = 18
      Caption = 'Id Kasir'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1184274
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object l_3: TsLabel
      Left = 368
      Top = 48
      Width = 74
      Height = 18
      Caption = 'Setor Real'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1184274
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel1: TsLabel
      Left = 8
      Top = 48
      Width = 42
      Height = 18
      Caption = 'Nama'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1184274
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 8
      Top = 80
      Width = 86
      Height = 18
      Caption = 'Waktu Login'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1184274
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object sLabel3: TsLabel
      Left = 368
      Top = 16
      Width = 57
      Height = 18
      Caption = 'IP Login'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 1184274
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = []
    end
    object ed_Kd_kasir: TsEdit
      Left = 112
      Top = 16
      Width = 249
      Height = 25
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = ed_Kd_kasirKeyDown
      SkinData.SkinSection = 'EDIT'
    end
    object ed_set_Real: TsCurrencyEdit
      Left = 464
      Top = 44
      Width = 177
      Height = 24
      AutoSize = False
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = ed_set_RealKeyDown
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DisplayFormat = '###,###,##0;-###,###,##0;0'
    end
    object b_simpan: TsBitBtn
      Left = 408
      Top = 84
      Width = 113
      Height = 40
      Cancel = True
      Caption = '&Simpan'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = b_simpanClick
      SkinData.SkinSection = 'BUTTON'
    end
    object b_cetak: TsBitBtn
      Left = 528
      Top = 84
      Width = 113
      Height = 40
      Caption = '&Cetak'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = b_cetakClick
      SkinData.SkinSection = 'BUTTON'
    end
    object edNama: TsEdit
      Left = 112
      Top = 48
      Width = 249
      Height = 25
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyDown = ed_Kd_kasirKeyDown
      SkinData.SkinSection = 'EDIT'
    end
    object edWaktu: TsEdit
      Left = 112
      Top = 80
      Width = 249
      Height = 25
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyDown = ed_Kd_kasirKeyDown
      SkinData.SkinSection = 'EDIT'
    end
    object edIP: TsEdit
      Left = 464
      Top = 16
      Width = 177
      Height = 25
      CharCase = ecUpperCase
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Rockwell'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnKeyDown = ed_Kd_kasirKeyDown
      SkinData.SkinSection = 'EDIT'
    end
  end
  object p1: TsPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 49
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object l_5: TsLabel
      Left = 8
      Top = 8
      Width = 166
      Height = 18
      Caption = 'Transaksi Mulai Tanggal'
      ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
    end
    object b_refresh: TsBitBtn
      Left = 536
      Top = 8
      Width = 129
      Height = 25
      Caption = '&Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = b_refreshClick
      SkinData.SkinSection = 'BUTTON'
    end
    object de_trans: TsDateEdit
      Left = 184
      Top = 8
      Width = 289
      Height = 25
      AutoSize = False
      EditMask = '!99/99/9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
    end
  end
  object ds_kasir: TDataSource
    DataSet = dm.Q_show
    Left = 288
    Top = 224
  end
  object laporan: TfrxReport
    Version = '4.9.35'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40974.799996296300000000
    ReportOptions.LastChange = 40979.676370185190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnClickObject = laporanClickObject
    Left = 256
    Top = 280
    Datasets = <
      item
        DataSet = setor_kasir
        DataSetName = 'db_kasir'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 58.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Style = fsDot
      EndlessHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 181.417440000000000000
        object Memo1: TfrxMemoView
          Width = 173.858380000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'LAPORAN TUTUP KASIR '
            'DUTA SWALAYAN')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 41.574830000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 60.472480000000000000
        Top = 181.417440000000000000
        Width = 181.417440000000000000
        DataSet = setor_kasir
        DataSetName = 'db_kasir'
        RowCount = 0
        object mm_kasir_user: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Cursor = crHandPoint
          TagStr = '[db_kasir."user"]'
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[db_kasir."user"]')
          ParentFont = False
        end
        object db_kasirn_user: TfrxMemoView
          Left = 45.354360000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Memo.UTF8 = (
            '[db_kasir."n_user"]')
          ParentFont = False
        end
        object db_kasirjumlah_setor_real: TfrxMemoView
          Left = 83.149660000000000000
          Top = 22.677180000000000000
          Width = 90.708654090000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[db_kasir."jumlah_setor_real"]')
          ParentFont = False
        end
        object db_kasirselisih: TfrxMemoView
          Left = 83.149660000000000000
          Top = 41.574830000000000000
          Width = 90.708656540000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            '[db_kasir."selisih"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.677180000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Setor Kasir')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 41.574830000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Selisih')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 18.897650000000000000
        Top = 139.842610000000000000
        Width = 181.417440000000000000
        object Memo30: TfrxMemoView
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Setor per Kasir')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Height = 434.645950000000000000
        Top = 264.567100000000000000
        Width = 181.417440000000000000
        object Memo16: TfrxMemoView
          Top = 7.559060000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'TOTAL SETOR KASIR')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 83.149660000000000000
          Top = 26.456710000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."jumlah_setor_real">)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 83.149660000000000000
          Top = 49.133890000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."selisih">)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 75.590600000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Hasil Penjualan')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 94.488250000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Penjualan Tunai')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 7.559060000000000000
          Top = 113.385900000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Penjualan Kredit')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 7.559060000000000000
          Top = 132.283550000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Total Penjualan')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 234.330860000000000000
          Width = 68.031496062992100000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Void')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 253.228510000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Return Jual')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 272.126160000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Discount')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 75.590600000000000000
          Top = 234.330860000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[sum(<db_kasir."void">)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 75.590600000000000000
          Top = 253.228510000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."return_jual">)]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 75.590600000000000000
          Top = 272.126160000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."discount">)]')
          ParentFont = False
        end
        object mm_kredit: TfrxMemoView
          Left = 94.488250000000000000
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."kredit">)]')
          ParentFont = False
        end
        object mm_tunai: TfrxMemoView
          Left = 94.488250000000000000
          Top = 94.488250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."price_oh">)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 94.488250000000000000
          Top = 132.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[mm_tunai.value+mm_kredit.value]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Top = 158.740260000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Variant')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 7.559060000000000000
          Top = 177.637910000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Transaksi')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Top = 196.535560000000000000
          Width = 68.031496062992100000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Barang Trs')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 7.559060000000000000
          Top = 215.433210000000000000
          Width = 68.031496062992100000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Qty Out')
          ParentFont = False
        end
        object db_kasirtransaksi: TfrxMemoView
          Left = 75.590600000000000000
          Top = 177.637910000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."transaksi">)]')
          ParentFont = False
        end
        object db_kasirTr_barang: TfrxMemoView
          Left = 75.590600000000000000
          Top = 196.535560000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."Tr_barang">)]')
          ParentFont = False
        end
        object db_kasirQty_barang: TfrxMemoView
          Left = 75.590600000000000000
          Top = 215.433210000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = setor_kasir
          DataSetName = 'db_kasir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<db_kasir."Qty_barang">)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 132.283550000000000000
          Top = 177.637910000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            'Kali')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 132.283550000000000000
          Top = 196.535560000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            'Item')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 132.283550000000000000
          Top = 215.433210000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            'Barang')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 132.283550000000000000
          Top = 234.330860000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            'Barang')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Setor Kasir')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 7.559060000000000000
          Top = 49.133890000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Selisih')
          ParentFont = False
        end
      end
    end
  end
  object setor_kasir: TfrxDBDataset
    UserName = 'db_kasir'
    CloseDataSource = False
    DataSet = dm.Q_laporan
    BCDToCurrency = False
    Left = 256
    Top = 312
  end
  object R_detail_setor: TfrxReport
    Version = '4.9.35'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40974.799996296300000000
    ReportOptions.LastChange = 41089.289645254600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 296
    Top = 280
    Datasets = <
      item
        DataSet = Detail_setor
        DataSetName = 'db_detail_setor'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 58.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Style = fsDot
      EndlessHeight = True
      object ReportTitle1: TfrxReportTitle
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 181.417440000000000000
        object Memo1: TfrxMemoView
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'LAPORAN PER KASIR')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Top = 15.118120000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'dd mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Date]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 442.205010000000000000
        Top = 113.385900000000000000
        Width = 181.417440000000000000
        DataSet = Detail_setor
        DataSetName = 'db_detail_setor'
        RowCount = 0
        object db_kasiruser: TfrxMemoView
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'user'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[db_detail_setor."user"]')
          ParentFont = False
        end
        object db_kasirn_user: TfrxMemoView
          Left = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'n_user'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."n_user"]')
          ParentFont = False
        end
        object db_kasirjumlah_setor_real: TfrxMemoView
          Left = 90.708720000000000000
          Top = 18.897650000000000000
          Width = 90.708654090000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."jumlah_setor_real"]')
          ParentFont = False
        end
        object db_kasirselisih: TfrxMemoView
          Left = 90.708720000000000000
          Top = 56.692950000000000000
          Width = 90.708656540000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'selisih'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."selisih"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Top = 79.370130000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Hasil Penjualan')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 7.559060000000000000
          Top = 98.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Penjualan Tunai')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Penjualan Kredit')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 7.559060000000000000
          Top = 136.063080000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Total Penjualan')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 238.110390000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Void')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 257.008040000000000000
          Width = 86.929141180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Return Jual')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 275.905690000000000000
          Width = 86.929141180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Discount')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 94.488250000000000000
          Top = 238.110390000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'void'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."void"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 94.488250000000000000
          Top = 257.008040000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'return_jual'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."return_jual"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 94.488250000000000000
          Top = 275.905690000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'discount'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."discount"]')
          ParentFont = False
        end
        object mm_kredit: TfrxMemoView
          Left = 94.488250000000000000
          Top = 117.165430000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'kredit'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."kredit"]')
          ParentFont = False
        end
        object mm_tunai: TfrxMemoView
          Left = 94.488250000000000000
          Top = 98.267780000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'price_oh'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."price_oh"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 94.488250000000000000
          Top = 136.063080000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[mm_tunai.value+mm_kredit.value]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Top = 162.519790000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Variant')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 7.559060000000000000
          Top = 181.417440000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Transaksi')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Top = 200.315090000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Barang Trs')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 7.559060000000000000
          Top = 219.212740000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            '-Qty Out')
          ParentFont = False
        end
        object db_kasirtransaksi: TfrxMemoView
          Left = 94.488250000000000000
          Top = 181.417440000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'transaksi'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."transaksi"]')
          ParentFont = False
        end
        object db_kasirTr_barang: TfrxMemoView
          Left = 94.488250000000000000
          Top = 200.315090000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Tr_barang'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."Tr_barang"]')
          ParentFont = False
        end
        object db_kasirQty_barang: TfrxMemoView
          Left = 94.488250000000000000
          Top = 219.212740000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Qty_barang'
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."Qty_barang"]')
          ParentFont = False
        end
        object db_detail_setorjumlah_setor_oh: TfrxMemoView
          Left = 90.708720000000000000
          Top = 37.795300000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = Detail_setor
          DataSetName = 'db_detail_setor'
          DisplayFormat.FormatStr = '###,###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[db_detail_setor."jumlah_setor_oh"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897637800000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Setor Real')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Top = 37.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Setor OH')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Top = 56.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8 = (
            'Selisih')
          ParentFont = False
        end
      end
    end
  end
  object Detail_setor: TfrxDBDataset
    UserName = 'db_detail_setor'
    CloseDataSource = False
    DataSet = dm.Q_temp
    BCDToCurrency = False
    Left = 296
    Top = 312
  end
end
