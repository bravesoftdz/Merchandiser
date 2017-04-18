object f_planogram: Tf_planogram
  Left = 285
  Top = 132
  BorderStyle = bsDialog
  Caption = 'Set Up Planogram'
  ClientHeight = 363
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object sLabel2: TsLabel
    Left = 8
    Top = 8
    Width = 20
    Height = 13
    Caption = 'Rak'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object sLabel3: TsLabel
    Left = 136
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Shelving'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object se_rak: TsSpinEdit
    Left = 56
    Top = 8
    Width = 73
    Height = 21
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnChange = se_rakChange
    SkinData.SkinSection = 'EDIT'
    Increment = 1
  end
  object se_shelving: TsSpinEdit
    Left = 184
    Top = 8
    Width = 73
    Height = 21
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '0'
    OnChange = se_shelvingChange
    SkinData.SkinSection = 'EDIT'
    Increment = 1
  end
  object grid_plano: TcxGrid
    Left = 8
    Top = 40
    Width = 849
    Height = 313
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object t_data_plano: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dm.ds_barang
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0 Item'
          Kind = skCount
          Column = t_data_planoColumn3
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object t_data_planoColumn1: TcxGridDBColumn
        Caption = 'No'
        DataBinding.FieldName = 'no_urut'
        Options.Editing = False
        Width = 25
      end
      object t_data_planoColumn2: TcxGridDBColumn
        Caption = 'PID'
        DataBinding.FieldName = 'kd_barang'
        Options.Editing = False
        Width = 76
      end
      object t_data_planoColumn3: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'n_barang'
        Options.Editing = False
        Width = 359
      end
      object t_data_planoColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'KK'
        Options.Editing = False
        Width = 44
      end
      object t_data_planoColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'DB'
        Options.Editing = False
        Width = 46
      end
      object t_data_planoColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'AB'
        Options.Editing = False
        Width = 44
      end
      object t_data_planoColumn7: TcxGridDBColumn
        Caption = 'Kap'
        DataBinding.FieldName = 'kapasitas'
        Options.Editing = False
        Width = 46
      end
      object t_data_planoColumn8: TcxGridDBColumn
        Caption = 'Max Dis'
        DataBinding.FieldName = 'min_display'
        Options.Editing = False
        Width = 44
      end
    end
    object l_data_plano: TcxGridLevel
      GridView = t_data_plano
    end
  end
  object b_cetak: TsButton
    Left = 656
    Top = 8
    Width = 201
    Height = 25
    Caption = 'Cetak &Semua Planogram'
    TabOrder = 3
    OnClick = b_cetakClick
    SkinData.SkinSection = 'BUTTON'
  end
  object sButton1: TsButton
    Left = 264
    Top = 8
    Width = 201
    Height = 25
    Caption = '&Cetak Planogram per Rak'
    TabOrder = 4
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sSkinProvider1: TsSkinProvider
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 16
    Top = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 64
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
end
