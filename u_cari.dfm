object f_cari: Tf_cari
  Left = 306
  Top = 134
  Width = 600
  Height = 494
  BorderIcons = [biSystemMenu]
  Caption = 'Pencarian'
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
  object Ed_cari: TsEdit
    Left = 4
    Top = 8
    Width = 573
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
    SkinData.CustomColor = True
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
  object grid: TcxGrid
    Left = 4
    Top = 32
    Width = 573
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      OnDblClick = t_dataDblClick
      OnKeyDown = t_dataKeyDown
      NavigatorButtons.ConfirmDelete = False
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
  object BtnKeluar: TsButton
    Left = 501
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Keluar'
    ModalResult = 2
    TabOrder = 2
    SkinData.SkinSection = 'BUTTON'
  end
  object BtnPilih: TsButton
    Left = 416
    Top = 424
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Ambil'
    ModalResult = 1
    TabOrder = 3
    OnClick = BtnPilihClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
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
