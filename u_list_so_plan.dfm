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
    LookAndFeel.NativeStyle = False
    object grid_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dsDsList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvQtyReal
        end
        item
          Format = '###,###,##0;(###,###,##0);0'
          Kind = skSum
          Column = tvTotalHpp
        end
        item
          Format = '0 Data'
          Kind = skCount
          Column = tvKodeKoreksi
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object tvKodeKoreksi: TcxGridDBColumn
        Caption = 'Kode Koreksi'
        DataBinding.FieldName = 'kd_koreksi'
        Width = 191
      end
      object tvQtyReal: TcxGridDBColumn
        Caption = 'Qty Real'
        DataBinding.FieldName = 'qty_real'
        Width = 123
      end
      object tvTotalHpp: TcxGridDBColumn
        Caption = 'Total Hpp'
        DataBinding.FieldName = 'total_hpp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;-###,###,##0;0'
        Properties.EditFormat = '###,###,##0;'
        HeaderAlignmentHorz = taRightJustify
        Width = 168
      end
      object tvDibuatPada: TcxGridDBColumn
        Caption = 'Dibuat Pada'
        DataBinding.FieldName = 'create_at'
        Width = 202
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
      Images = dm.gambar
      ImageIndex = 10
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
      Images = dm.gambar
      ImageIndex = 2
      Reflected = True
    end
  end
  object sknprvdr1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
  object QList: TMyQuery
    Connection = dm.db_conn
    Left = 56
    Top = 24
  end
  object dsDsList: TDataSource
    DataSet = QList
    Left = 96
    Top = 24
  end
end
