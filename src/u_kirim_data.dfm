object F_kirim_data: TF_kirim_data
  Left = 422
  Top = 138
  BorderStyle = bsDialog
  Caption = 'EXPORT IMPORT DATA'
  ClientHeight = 357
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sg_load: TGauge
    Left = 0
    Top = 0
    Width = 479
    Height = 25
    Align = alTop
    Progress = 0
    Visible = False
  end
  object pc_1: TsPageControl
    Left = 0
    Top = 25
    Width = 479
    Height = 332
    ActivePage = ts_1
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PAGECONTROL'
    object ts_1: TsTabSheet
      Caption = 'Kirim Data'
      object l_1: TLabel
        Left = 0
        Top = 40
        Width = 465
        Height = 73
        AutoSize = False
        Caption = 
          'Proses ini Berfungsi untuk mengirim seluruh transaksi yang terja' +
          'di pada hari ini ke gudang'#13#10#13#10'Pastikan Seluruh Transaksi sudah s' +
          'elesai sebelum melakukan penyimpanan file'#13#10'yang akan di kirim ke' +
          ' gudang...'
      end
      object spnl1: TPanel
        Left = 0
        Top = 263
        Width = 471
        Height = 41
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          471
          41)
        object edt_kirim: TsDateEdit
          Left = 8
          Top = 12
          Width = 129
          Height = 21
          Anchors = [akLeft, akBottom]
          AutoSize = False
          EditMask = '!99/99/9999;1; '
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'MS Sans Serif'
          BoundLabel.Font.Style = []
          BoundLabel.ParentFont = False
          SkinData.SkinSection = 'EDIT'
          GlyphMode.Blend = 0
          GlyphMode.Grayed = False
        end
        object b_kirim: TButton
          Left = 332
          Top = 8
          Width = 132
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Kirim Data'
          TabOrder = 1
          OnClick = b_kirimClick
        end
      end
    end
    object ts_2: TsTabSheet
      Caption = 'Terima Data'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object edt_terima: TsDateEdit
        Left = 4
        Top = 232
        Width = 129
        Height = 21
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.ParentFont = False
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object zv_load: TAbZipView
        Left = 0
        Top = 33
        Width = 471
        Height = 192
        Align = alTop
        Attributes = [vaItemName, vaPacked, vaRatio, vaFileSize, vaPath]
        Colors.Selected = clHighlight
        Colors.SelectedText = clHighlightText
        Colors.Alternate = clAqua
        Colors.AlternateText = clRed
        Colors.Deleted = clYellow
        Colors.DeletedText = clNavy
        Headings.Strings = (
          'File name'
          'Packed'
          'Method'
          'Ratio (%)'
          'CRC32'
          'Attributes'
          'Format'
          'Encrypted'
          'Time stamp'
          'Size'
          'Version Made'
          'Version Needed'
          'Path')
        DefaultColWidth = 150
        DefaultRowHeight = 17
        DisplayOptions = [doColSizing, doMultiSelect, doShowIcons, doThumbTrack]
        HeaderRowHeight = 19
        SortAttributes = [saItemName, saPacked, saRatio, saTimeStamp, saFileSize]
        TabOrder = 1
        ZipComponent = zk_load
        ColWidths = (
          120
          78
          50
          85
          120)
        RowHeights = (
          19
          17)
      end
      object spnl_load: TPanel
        Left = 0
        Top = 0
        Width = 471
        Height = 33
        Align = alTop
        TabOrder = 2
      end
      object spnl2: TPanel
        Left = 0
        Top = 263
        Width = 471
        Height = 41
        Align = alBottom
        TabOrder = 3
        DesignSize = (
          471
          41)
        object sButton3: TButton
          Left = 280
          Top = 8
          Width = 188
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Simpan Data ke Dalam Database'
          TabOrder = 0
          OnClick = sButton3Click
        end
        object sButton2: TButton
          Left = 144
          Top = 8
          Width = 130
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Load From File'
          TabOrder = 1
          OnClick = sButton2Click
        end
        object sButton1: TButton
          Left = 4
          Top = 8
          Width = 129
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Load From Date'
          TabOrder = 2
          OnClick = sButton1Click
        end
      end
    end
  end
  object zk_load: TAbZipKit
    AutoSave = False
    DOSMode = False
    ExtractOptions = []
    Left = 184
  end
  object od_load: TOpenDialog
    Left = 220
  end
  object sknprvdr1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 20
    Top = 24
  end
end
