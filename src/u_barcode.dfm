object f_Barcode: Tf_Barcode
  Left = 344
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Cetak Real Card'
  ClientHeight = 396
  ClientWidth = 547
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object sb_cari: TsSpeedButton
    Tag = 9
    Left = 512
    Top = 8
    Width = 24
    Height = 21
    OnClick = sb_cariClick
    SkinData.SkinSection = 'SPEEDBUTTON'
    Images = dm.im
    ImageIndex = 0
  end
  object l_4: TLabel
    Left = 8
    Top = 348
    Width = 130
    Height = 13
    Caption = 'Hapus Baris -> Ctrl + Delete'
  end
  object ed_PID: TEdit
    Left = 8
    Top = 8
    Width = 497
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyDown = ed_PIDKeyDown
    OnKeyPress = ed_PIDKeyPress
  end
  object btnBarcode: TButton
    Left = 384
    Top = 352
    Width = 153
    Height = 33
    Caption = '&Cetak Barcode'
    Enabled = False
    TabOrder = 1
    OnClick = btnBarcodeClick
  end
  object Grid: TcxGrid
    Left = 8
    Top = 32
    Width = 529
    Height = 313
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object TableView: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Append.Visible = False
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
          Format = '0'
          Kind = skSum
          OnGetText = TableViewTcxGridDataControllerTcxDataSummaryFooterSummaryItems2GetText
          Column = ableViewColumn3
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
      OptionsView.NoDataToDisplayInfoText = '<Belum ada Data>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Styles.Inactive = dm.cxstyl1
      object ableViewColumn1: TcxGridColumn
        Caption = 'PID'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 61
      end
      object ableViewColumn2: TcxGridColumn
        Caption = 'Deskripsi'
        GroupSummaryAlignment = taCenter
        Options.Editing = False
        Width = 187
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
        Options.Editing = False
        Width = 101
      end
      object ableViewColumn3: TcxGridColumn
        Caption = 'Copy'
        DataBinding.ValueType = 'Smallint'
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taRightJustify
        Width = 39
      end
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 8
    Top = 160
  end
  object UDLaporan: TfrxUserDataSet
    UserName = 'UDlaporan'
    Left = 224
    Top = 352
  end
  object laporan: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41109.882931898200000000
    ReportOptions.LastChange = 42280.774044097220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = laporanGetValue
    Left = 184
    Top = 352
    Datasets = <
      item
        DataSet = UDLaporan
        DataSetName = 'UDlaporan'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 72.000000000000000000
      PaperHeight = 90.000000000000000000
      PaperSize = 256
      LeftMargin = 1.000000000000000000
      RightMargin = 1.000000000000000000
      Columns = 1
      ColumnWidth = 200.000000000000000000
      ColumnPositions.Strings = (
        '0')
      EndlessHeight = True
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 68.031496060000000000
        Top = 18.897650000000000000
        Width = 264.567100000000000000
        Columns = 2
        ColumnWidth = 124.724409448819000000
        ColumnGap = 11.338582677165400000
        DataSet = UDLaporan
        DataSetName = 'UDlaporan'
        RowCount = 0
        object BarCode1: TfrxBarCodeView
          Left = 17.913382170000000000
          Top = 0.377952760000000000
          Width = 103.000000000000000000
          Height = 30.992125980000000000
          BarType = bcCode39
          Expression = '<kd_barang>'
          HAlign = haCenter
          Rotation = 0
          ShowText = False
          Text = '123456'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 40.062992130000000000
          Width = 124.724490000000000000
          Height = 13.228346460000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          DisplayFormat.FormatStr = '###,###,##0 ;(###,###,##0); 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[n_barang]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 13.984254410000000000
          Top = 29.480314960000000000
          Width = 37.795300000000000000
          Height = 15.118107800000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          DisplayFormat.FormatStr = '###,###,##0 ;(###,###,##0); 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[kd_barang]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 29.480314960000000000
          Width = 71.811070000000000000
          Height = 15.118107800000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          DisplayFormat.FormatStr = '###,###,##0 ;(###,###,##0); 0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Rp.[harga_jual3]')
          ParentFont = False
        end
      end
    end
  end
end
