object F_toko: TF_toko
  Left = 408
  Top = 300
  BorderStyle = bsDialog
  Caption = 'Laporan Perkembangan Toko'
  ClientHeight = 170
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Pilih Periode'
  end
  object sButton2: TButton
    Left = 8
    Top = 136
    Width = 233
    Height = 25
    Caption = 'Preview Stok Out Harian'
    TabOrder = 0
    OnClick = sButton2Click
  end
  object cb_periode: TsComboBox
    Left = 95
    Top = 12
    Width = 147
    Height = 21
    Alignment = taLeftJustify
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.ParentFont = False
    SkinData.SkinSection = 'COMBOBOX'
    VerticalAlignment = taAlignTop
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS SANS SERIF'
    Font.Style = []
    ItemIndex = -1
    ParentFont = False
    TabOrder = 1
    OnChange = cb_periodeChange
  end
  object btnMutasi: TButton
    Left = 8
    Top = 72
    Width = 233
    Height = 25
    Caption = 'Preview Mutasi Barang'
    TabOrder = 2
    OnClick = btnMutasiClick
  end
  object btnGross: TButton
    Left = 8
    Top = 40
    Width = 233
    Height = 25
    Caption = 'Preview Gross Margin'
    TabOrder = 3
    OnClick = btnGrossClick
  end
  object btnMutasiHarga: TButton
    Left = 8
    Top = 104
    Width = 233
    Height = 25
    Caption = 'Preview Mutasi Harga'
    TabOrder = 4
    OnClick = btnMutasiClick
  end
end
