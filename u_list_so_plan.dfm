object f_list_so_plan: Tf_list_so_plan
  Left = 192
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Dafta Rencana SO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 441
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object grid_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dsDsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = clmn_dataColumn3
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = clmn_dataColumn4
        end
        item
          Format = '0 Data'
          Kind = skCount
          Column = clmn_dataColumn1
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object clmn_dataColumn1: TcxGridDBColumn
        Caption = 'Kode Koreksi'
        DataBinding.FieldName = 'kd_koreksi'
      end
      object clmn_dataColumn2: TcxGridDBColumn
        Caption = 'Dibuat Pada'
        DataBinding.FieldName = 'create_at'
      end
      object clmn_dataColumn3: TcxGridDBColumn
        Caption = 'Qty Real'
        DataBinding.FieldName = 'qty_real'
      end
      object clmn_dataColumn4: TcxGridDBColumn
        Caption = 'Total Hpp'
        DataBinding.FieldName = 'total_hpp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;-###,###,##0;0'
        Properties.EditFormat = '###,###,##0;'
        HeaderAlignmentHorz = taRightJustify
      end
    end
    object l_data: TcxGridLevel
      GridView = grid_data
    end
  end
  object sPanel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 441
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
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
  end
  object sknprvdr1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
  object QList: TmySQLQuery
    Database = dm.db_conn
    Left = 56
    Top = 24
  end
  object dsDsList: TDataSource
    DataSet = QList
    Left = 96
    Top = 24
  end
end
