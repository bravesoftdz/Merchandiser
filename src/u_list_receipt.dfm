object f_list_receipt: Tf_list_receipt
  Left = 195
  Top = 152
  Caption = 'Daftar Receipt Order'
  ClientHeight = 0
  ClientWidth = 120
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
    Width = 154
    Height = 0
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = t_dataCellDblClick
      DataController.DataSource = dm.ds_list_receipt
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
        Width = 171
      end
      object t_datakd_receipt: TcxGridDBColumn
        Caption = 'Kode Receipt'
        DataBinding.FieldName = 'kd_receipt'
        Width = 93
      end
      object t_datatgl_receipt: TcxGridDBColumn
        Caption = 'Tanggal Receipt'
        DataBinding.FieldName = 'tgl_receipt'
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 73
      end
      object t_datanilai_faktur: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'nilai_faktur'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
        Width = 68
      end
      object t_dataColumn2: TcxGridDBColumn
        Caption = 'J. Tempo'
        DataBinding.FieldName = 'jatuh_tempo'
        HeaderAlignmentHorz = taRightJustify
      end
      object t_dataColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'PPN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
      end
      object t_dataColumn4: TcxGridDBColumn
        Caption = 'Diskon'
        DataBinding.FieldName = 'disk_rp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '###,###,##0;(###,###,##0);0'
        HeaderAlignmentHorz = taRightJustify
      end
      object t_dataColumn1: TcxGridDBColumn
        Caption = 'Tunai'
        DataBinding.FieldName = 'tunai'
        GroupSummaryAlignment = taCenter
        Width = 68
      end
      object t_dataColumn5: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'pengguna'
      end
    end
    object l_data: TcxGridLevel
      GridView = t_data
    end
  end
  object sPanel1: TPanel
    Left = -30
    Top = 0
    Width = 150
    Height = 0
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object sBitBtn2: TBitBtn
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
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      TabOrder = 0
      OnClick = sBitBtn2Click
    end
    object sBitBtn6: TBitBtn
      Left = 8
      Top = 88
      Width = 136
      Height = 65
      Cursor = crHandPoint
      Caption = 'Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Rockwell'
      Font.Style = [fsBold]
      Layout = blGlyphTop
      ParentFont = False
      Spacing = 0
      TabOrder = 1
      OnClick = sBitBtn6Click
    end
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 752
    Top = 72
  end
end
