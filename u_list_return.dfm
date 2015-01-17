object f_list_return: Tf_list_return
  Left = 193
  Top = 154
  Width = 928
  Height = 480
  Caption = 'Daftar Return Pembelian'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 0
    Width = 762
    Height = 442
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    object t_data: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dm.ds_list_return
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Data'
          Kind = skCount
          Column = t_datan_supp
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_datan_supp: TcxGridDBColumn
        Caption = 'Supplier'
        DataBinding.FieldName = 'n_supp'
        Width = 190
      end
      object t_datakd_return: TcxGridDBColumn
        Caption = 'Kode Return'
        DataBinding.FieldName = 'kd_return'
        Width = 105
      end
      object t_dataColumn1: TcxGridDBColumn
        Caption = 'Kode Receipt'
        DataBinding.FieldName = 'faktur_receipt'
      end
      object t_datatgl_return: TcxGridDBColumn
        Caption = 'Taggal Return'
        DataBinding.FieldName = 'tgl_return'
        Width = 79
      end
      object t_datanilai_faktur: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
        Width = 82
      end
      object t_dataColumn2: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'disk_rp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        HeaderGlyphAlignmentHorz = taCenter
      end
      object t_dataColumn3: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sPanel1: TsPanel
    Left = 762
    Top = 0
    Width = 150
    Height = 442
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sBitBtn6: TsBitBtn
      Left = 7
      Top = 88
      Width = 138
      Height = 65
      Cursor = crHandPoint
      Caption = 'Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = sBitBtn6Click
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 2
      Images = dm.gambar
      Reflected = True
    end
    object sBitBtn2: TsBitBtn
      Left = 8
      Top = 8
      Width = 137
      Height = 65
      Cursor = crHandPoint
      Caption = 'Selesai'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = sBitBtn2Click
      Layout = blGlyphTop
      Spacing = 0
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 10
      Images = dm.gambar
      Reflected = True
    end
  end
  object sSkinProvider1: TsSkinProvider
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
end
