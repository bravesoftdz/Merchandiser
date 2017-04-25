object f_list_SO: Tf_list_SO
  Left = 192
  Top = 116
  Width = 928
  Height = 480
  Caption = 'Dafta Stok Opname'
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
      DataController.DataSource = dm.ds_ist_SO
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
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tgl_koreksi'
      end
      object clmn_dataColumn3: TcxGridDBColumn
        Caption = 'Qty Selisih'
        DataBinding.FieldName = 'Qty_selisih'
      end
      object clmn_dataColumn4: TcxGridDBColumn
        Caption = 'Selisih Harga'
        DataBinding.FieldName = 'harga_pokok'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '###,###,##0;-###,###,##0;0'
        Properties.EditFormat = '###,###,##0;'
        HeaderAlignmentHorz = taRightJustify
      end
      object clmn_dataColumn5: TcxGridDBColumn
        Caption = 'User'
        DataBinding.FieldName = 'user'
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
    object p1: TsPanel
      Left = 0
      Top = 351
      Width = 150
      Height = 90
      Align = alBottom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object l_1: TLabel
        Left = 4
        Top = 5
        Width = 31
        Height = 13
        Caption = 'Mulai :'
      end
      object l_2: TLabel
        Left = 4
        Top = 45
        Width = 41
        Height = 13
        Caption = 'Sampai :'
      end
      object de_mulai: TsDateEdit
        Left = 4
        Top = 21
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object de_sampai: TsDateEdit
        Left = 4
        Top = 61
        Width = 138
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
    end
  end
  object sknprvdr1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 24
  end
end
