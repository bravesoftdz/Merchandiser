object f_cari: Tf_cari
  Left = 306
  Top = 134
  BorderIcons = [biSystemMenu]
  Caption = 'Pencarian'
  ClientHeight = 455
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    584
    455)
  PixelsPerInch = 96
  TextHeight = 13
  object Ed_cari: TEdit
    Left = 4
    Top = 8
    Width = 557
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = Ed_cariChange
  end
  object grid: TcxGrid
    Left = 4
    Top = 32
    Width = 557
    Height = 346
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      OnDblClick = t_dataDblClick
      OnKeyDown = t_dataKeyDown
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = ds_cari
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Inactive = dm.cxstyl1
      Styles.Selection = dm.cxstyl1
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object BtnKeluar: TButton
    Left = 485
    Top = 385
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Keluar'
    ModalResult = 2
    TabOrder = 2
  end
  object BtnPilih: TButton
    Left = 400
    Top = 385
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Ambil'
    ModalResult = 1
    TabOrder = 3
    OnClick = BtnPilihClick
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 352
    Top = 32
  end
  object ds_cari: TDataSource
    DataSet = Q_cari
    Left = 48
    Top = 56
  end
  object Q_cari: TMyQuery
    Connection = dm.db_conn
    SQL.Strings = (
      '')
    Left = 8
    Top = 56
  end
end
