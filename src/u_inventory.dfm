object F_Inventory: TF_Inventory
  Left = 225
  Top = 102
  BorderStyle = bsDialog
  Caption = 'Inventory Barang'
  ClientHeight = 464
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pc_inventory: TsPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 464
    ActivePage = ts_mutasi
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Rockwell'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    OnChange = pc_inventoryChange
    SkinData.SkinSection = 'PAGECONTROL'
    object ts_jelajah: TsTabSheet
      BorderWidth = 1
      Caption = 'Jelajahi Barang'
      ButtonSkin = 'BUTTON_BIG'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object db_barang: TDBGrid
        Left = 0
        Top = 0
        Width = 615
        Height = 332
        Align = alClient
        DataSource = ds_barang
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        OnTitleClick = db_barangTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'kd_barang'
            Title.Caption = 'PID'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'n_barang'
            Title.Caption = 'Deskripsi Barang'
            Width = 300
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'kd_kategori'
            Title.Alignment = taCenter
            Title.Caption = 'TAG'
            Width = 41
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'minstok'
            Title.Alignment = taCenter
            Title.Caption = 'Min Stok'
            Width = 62
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'maxstok'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'minor'
            Title.Alignment = taCenter
            Title.Caption = 'Min Order'
            Width = 72
            Visible = True
          end>
      end
      object sPanel1: TPanel
        Left = 0
        Top = 332
        Width = 615
        Height = 96
        Align = alBottom
        TabOrder = 0
        object gb_kondisi: TGroupBox
          Left = 209
          Top = 1
          Width = 112
          Height = 94
          Align = alLeft
          Caption = '| Kondisi|'
          TabOrder = 0
          object rb_like: TRadioButton
            Left = 8
            Top = 16
            Width = 61
            Height = 20
            Caption = 'Seperti'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rb_sama: TRadioButton
            Left = 8
            Top = 34
            Width = 29
            Height = 20
            Caption = '='
            Enabled = False
            TabOrder = 1
          end
          object rb_lebih: TRadioButton
            Left = 8
            Top = 52
            Width = 29
            Height = 20
            Caption = '>'
            Enabled = False
            TabOrder = 2
          end
          object rb_kurang: TRadioButton
            Left = 64
            Top = 52
            Width = 29
            Height = 20
            Caption = '<'
            Enabled = False
            TabOrder = 3
          end
          object rb_tdk_sama: TRadioButton
            Left = 64
            Top = 34
            Width = 38
            Height = 20
            Caption = '<>'
            Enabled = False
            TabOrder = 4
          end
          object rb_lebih_sama: TRadioButton
            Left = 8
            Top = 70
            Width = 38
            Height = 20
            Caption = '>='
            Enabled = False
            TabOrder = 5
          end
          object rb_kurang_sama: TRadioButton
            Left = 64
            Top = 70
            Width = 38
            Height = 20
            Caption = '<='
            Enabled = False
            TabOrder = 6
          end
        end
        object gb_saring: TGroupBox
          Left = 1
          Top = 1
          Width = 208
          Height = 94
          Align = alLeft
          Caption = '| Penyaringan|'
          TabOrder = 1
          object rb_plu: TRadioButton
            Left = 8
            Top = 24
            Width = 94
            Height = 20
            Caption = 'PLU/ Barang'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = rb_pluClick
          end
          object rb_min_order: TRadioButton
            Left = 8
            Top = 48
            Width = 79
            Height = 20
            Caption = 'Min Order'
            TabOrder = 1
            OnClick = rb_pluClick
          end
          object rb_max_stok: TRadioButton
            Left = 120
            Top = 48
            Width = 73
            Height = 20
            Caption = 'Max Stok'
            TabOrder = 2
            OnClick = rb_pluClick
          end
          object rb_min_stok: TRadioButton
            Left = 120
            Top = 24
            Width = 69
            Height = 20
            Caption = 'Min Stok'
            TabOrder = 3
            OnClick = rb_pluClick
          end
        end
        object sGroupBox6: TGroupBox
          Left = 321
          Top = 1
          Width = 293
          Height = 94
          Align = alClient
          TabOrder = 2
          object L_hasil: TLabel
            Left = 96
            Top = 46
            Width = 192
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Ada 1200 Item'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 1184274
            Font.Height = -13
            Font.Name = 'Rockwell'
            Font.Style = []
            ParentFont = False
          end
          object Ed_Cari: TEdit
            Left = 8
            Top = 12
            Width = 280
            Height = 24
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Rockwell'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = Ed_CariChange
          end
          object ed_temp: TEdit
            Left = 107
            Top = 32
            Width = 57
            Height = 24
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Rockwell'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'ed_temp'
            Visible = False
          end
          object ud_cari: TUpDown
            Left = 120
            Top = 32
            Width = 40
            Height = 24
            Orientation = udHorizontal
            TabOrder = 2
            Visible = False
          end
          object B_Cari: TButton
            Left = 208
            Top = 64
            Width = 81
            Height = 25
            Caption = 'Cari'
            TabOrder = 3
            Visible = False
            OnClick = B_CariClick
          end
          object rb_minO: TRadioButton
            Left = 8
            Top = 64
            Width = 79
            Height = 20
            Caption = 'Min Order'
            TabOrder = 4
            Visible = False
            OnClick = rb_minSClick
          end
          object rb_minS: TRadioButton
            Left = 8
            Top = 16
            Width = 69
            Height = 20
            Caption = 'Min Stok'
            TabOrder = 5
            Visible = False
            OnClick = rb_minSClick
          end
          object rb_maxS: TRadioButton
            Left = 8
            Top = 40
            Width = 73
            Height = 20
            Caption = 'Max Stok'
            TabOrder = 6
            Visible = False
            OnClick = rb_minSClick
          end
          object sButton1: TButton
            Left = 130
            Top = 64
            Width = 75
            Height = 25
            Caption = '&Preview'
            TabOrder = 7
            OnClick = sButton1Click
          end
        end
      end
    end
    object ts_detail: TsTabSheet
      BorderWidth = 1
      Caption = 'Detail Barang'
      ButtonSkin = 'BUTTON_BIG'
      OnClickBtn = ts_detailClickBtn
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sLabel1: TLabel
        Left = 0
        Top = 32
        Width = 34
        Height = 19
        Caption = 'Jenis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel2: TLabel
        Left = 0
        Top = 96
        Width = 39
        Height = 19
        Caption = 'Merk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel3: TLabel
        Left = 0
        Top = 64
        Width = 72
        Height = 19
        Caption = 'Golongan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel4: TLabel
        Left = 0
        Top = 128
        Width = 63
        Height = 19
        Caption = 'Kategori'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object l_aktif: TLabel
        Left = 424
        Top = 360
        Width = 185
        Height = 31
        Alignment = taCenter
        AutoSize = False
        Caption = 'AKTIF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel14: TLabel
        Left = 0
        Top = 186
        Width = 32
        Height = 19
        Caption = 'Satu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel15: TLabel
        Left = 0
        Top = 220
        Width = 30
        Height = 19
        Caption = 'Dua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel16: TLabel
        Left = 0
        Top = 252
        Width = 32
        Height = 19
        Caption = 'Tiga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object Ed_golongan: TEdit
        Left = 88
        Top = 64
        Width = 249
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Ed_Merk: TEdit
        Left = 88
        Top = 96
        Width = 249
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Ed_Kategori: TEdit
        Left = 88
        Top = 128
        Width = 249
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Ed_Jenis: TEdit
        Left = 88
        Top = 32
        Width = 249
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object sGroupBox1: TGroupBox
        Left = 344
        Top = 24
        Width = 265
        Height = 129
        Caption = '| Tanggal Terahir|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object sLabel11: TLabel
          Left = 8
          Top = 30
          Width = 70
          Height = 19
          Caption = 'Transaksi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel12: TLabel
          Left = 8
          Top = 62
          Width = 84
          Height = 19
          Caption = 'Pengiriman'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel13: TLabel
          Left = 8
          Top = 94
          Width = 54
          Height = 19
          Caption = 'Kosong'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object ed_trans_ah: TEdit
          Left = 104
          Top = 24
          Width = 153
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ed_kirim_ah: TEdit
          Left = 104
          Top = 56
          Width = 153
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ed_kosong_ah: TEdit
          Left = 104
          Top = 88
          Width = 153
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object sGroupBox2: TGroupBox
        Left = 424
        Top = 160
        Width = 185
        Height = 153
        Caption = '| Stok |'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object sLabel6: TLabel
          Left = 8
          Top = 26
          Width = 63
          Height = 19
          Caption = 'Min Stok'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel9: TLabel
          Left = 8
          Top = 90
          Width = 77
          Height = 19
          Caption = 'Min Order'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel8: TLabel
          Left = 8
          Top = 122
          Width = 76
          Height = 19
          Caption = 'Lead Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel7: TLabel
          Left = 8
          Top = 58
          Width = 68
          Height = 19
          Caption = 'Max Stok'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object ed_minstok: TEdit
          Left = 104
          Top = 28
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ed_maxstok: TEdit
          Left = 104
          Top = 60
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ed_minor: TEdit
          Left = 104
          Top = 92
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object ed_time: TEdit
          Left = 104
          Top = 124
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object sGroupBox3: TGroupBox
        Left = 48
        Top = 160
        Width = 201
        Height = 121
        Caption = '| Satuan dan Quantity |'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object ed_sat1: TEdit
          Left = 8
          Top = 24
          Width = 105
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ed_sat2: TEdit
          Left = 8
          Top = 56
          Width = 105
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ed_sat3: TEdit
          Left = 8
          Top = 88
          Width = 105
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object ed_qty1: TEdit
          Left = 120
          Top = 24
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object ed_qty2: TEdit
          Left = 120
          Top = 56
          Width = 73
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object sGroupBox4: TGroupBox
        Left = 256
        Top = 160
        Width = 161
        Height = 121
        Caption = '| Barcode |'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object ed_bar1: TEdit
          Left = 8
          Top = 24
          Width = 145
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ed_bar2: TEdit
          Left = 8
          Top = 56
          Width = 145
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object ed_bar3: TEdit
          Left = 8
          Top = 88
          Width = 145
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object sGroupBox5: TGroupBox
        Left = 0
        Top = 288
        Width = 417
        Height = 113
        Caption = '| Posisi Barang |'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object sLabel17: TLabel
          Left = 8
          Top = 28
          Width = 53
          Height = 19
          Caption = 'No Rak'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel18: TLabel
          Left = 8
          Top = 54
          Width = 88
          Height = 19
          Caption = 'No Shelving'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel19: TLabel
          Left = 8
          Top = 82
          Width = 57
          Height = 19
          Caption = 'No Urut'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel20: TLabel
          Left = 216
          Top = 52
          Width = 20
          Height = 19
          Caption = 'LD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel21: TLabel
          Left = 320
          Top = 52
          Width = 20
          Height = 19
          Caption = 'AB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel22: TLabel
          Left = 216
          Top = 84
          Width = 20
          Height = 19
          Caption = 'KK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel23: TLabel
          Left = 320
          Top = 84
          Width = 21
          Height = 19
          Caption = 'DB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object sLabel24: TLabel
          Left = 216
          Top = 28
          Width = 86
          Height = 19
          Caption = 'Min Display'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1184274
          Font.Height = -16
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
        end
        object Ed_urut: TEdit
          Left = 112
          Top = 80
          Width = 89
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_shelving: TEdit
          Left = 112
          Top = 52
          Width = 89
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_rak: TEdit
          Left = 112
          Top = 24
          Width = 89
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object ed_LD: TEdit
          Left = 248
          Top = 52
          Width = 57
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object ed_AB: TEdit
          Left = 352
          Top = 52
          Width = 57
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object ed_KK: TEdit
          Left = 248
          Top = 80
          Width = 57
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object ed_DB: TEdit
          Left = 352
          Top = 80
          Width = 57
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object Ed_min_display: TEdit
          Left = 312
          Top = 24
          Width = 97
          Height = 24
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Rockwell'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
      end
      object ed_pid: TEdit
        Left = 0
        Top = 0
        Width = 81
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object ed_nama: TEdit
        Left = 88
        Top = 0
        Width = 521
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
    end
    object ts_mutasi: TsTabSheet
      BorderWidth = 1
      Caption = 'Mutasi'
      OnClickBtn = ts_mutasiClickBtn
      object sLabel10: TLabel
        Left = 72
        Top = 32
        Width = 473
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'MUTASI BARANG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object sLabel25: TLabel
        Left = 72
        Top = 216
        Width = 473
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'MUTASI RUPIAH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1184274
        Font.Height = -27
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 72
        Top = 64
        Width = 473
        Height = 137
        DataSource = ds_mutasi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        OnTitleClick = db_barangTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'tgl'
            Title.Caption = 'Tanggal'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_awal'
            Title.Alignment = taCenter
            Title.Caption = 'Stok Awal'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_receipt'
            Title.Alignment = taCenter
            Title.Caption = 'Receipt'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_return'
            Title.Alignment = taCenter
            Title.Caption = 'Return'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_sales'
            Title.Alignment = taCenter
            Title.Caption = 'Sales'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_koreksi'
            Title.Alignment = taCenter
            Title.Caption = 'Koreksi'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'stok_ahir'
            Title.Alignment = taCenter
            Title.Caption = 'Stok Akhir'
            Width = 66
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 72
        Top = 248
        Width = 473
        Height = 137
        DataSource = ds_mutasi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Rockwell'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Rockwell'
        TitleFont.Style = []
        OnTitleClick = db_barangTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'tgl'
            Title.Caption = 'Tanggal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_awal'
            Title.Alignment = taRightJustify
            Title.Caption = 'Saldo Awal'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_receipt'
            Title.Alignment = taRightJustify
            Title.Caption = 'Receipt'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_return'
            Title.Alignment = taRightJustify
            Title.Caption = 'Return'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_sales'
            Title.Alignment = taRightJustify
            Title.Caption = 'Sales'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_koreksi'
            Title.Alignment = taRightJustify
            Title.Caption = 'Koreksi'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uang_ahir'
            Title.Alignment = taRightJustify
            Title.Caption = 'Saldo Akhir'
            Width = 71
            Visible = True
          end>
      end
      object ed_pid2: TEdit
        Left = 0
        Top = 0
        Width = 81
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object ed_nama2: TEdit
        Left = 88
        Top = 0
        Width = 521
        Height = 24
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Rockwell'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object B_Print: TButton
        Left = 464
        Top = 392
        Width = 75
        Height = 25
        Caption = '&Preview'
        TabOrder = 4
        OnClick = B_PrintClick
      end
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
    Left = 900
    Top = 360
  end
  object ds_mutasi: TDataSource
    DataSet = dm.Q_temp
    Left = 240
    Top = 120
  end
  object ds_barang: TDataSource
    DataSet = dm.Q_show
    Left = 144
    Top = 120
  end
  object db_mutasi: TfrxDBDataset
    UserName = 'db_mutasi'
    CloseDataSource = False
    FieldAliases.Strings = (
      'kd_barang=kd_barang'
      'tgl=tgl'
      'stok_awal=stok_awal'
      'stok_receipt=stok_receipt'
      'stok_return=stok_return'
      'stok_sales=stok_sales'
      'stok_koreksi=stok_koreksi'
      'stok_ahir=stok_ahir'
      'uang_awal=uang_awal'
      'uang_receipt=uang_receipt'
      'uang_return=uang_return'
      'uang_sales=uang_sales'
      'uang_koreksi=uang_koreksi'
      'uang_ahir=uang_ahir')
    DataSource = ds_mutasi
    BCDToCurrency = False
    Left = 236
    Top = 166
  end
  object laporan: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41084.196632395800000000
    ReportOptions.LastChange = 41091.123321192100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 200
    Top = 198
    Datasets = <
      item
        DataSet = db_laporan
        DataSetName = 'db_laporan'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = db_laporan
        DataSetName = 'db_laporan'
        RowCount = 0
        object db_laporankd_barang: TfrxMemoView
          Left = 45.354360000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'kd_barang'
          DataSet = db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[db_laporan."kd_barang"]')
          ParentFont = False
        end
        object db_laporanurut: TfrxMemoView
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Line#]  ')
          ParentFont = False
        end
        object db_laporann_barang: TfrxMemoView
          Left = 94.488250000000000000
          Width = 226.771800000000000000
          Height = 15.118120000000000000
          DataField = 'n_barang'
          DataSet = db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[db_laporan."n_barang"]')
          ParentFont = False
        end
        object db_laporanbarcode: TfrxMemoView
          Left = 321.260050000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          DataField = 'N_Jenis'
          DataSet = db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[db_laporan."N_Jenis"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 487.559370000000000000
          Width = 154.960730000000000000
          Height = 15.118120000000000000
          DataField = 'N_golbrg'
          DataSet = db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          Memo.UTF8W = (
            '[db_laporan."N_golbrg"]')
          ParentFont = False
        end
        object db_laporanaktif: TfrxMemoView
          Left = 642.520100000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'aktif'
          DataSet = db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Style = fsDot
          HAlign = haCenter
          Memo.UTF8W = (
            '[db_laporan."aktif"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 514.016080000000000000
          Top = 3.779530000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Lembar [Page]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Width = 699.213050000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DAFTAR BARANG')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 404.409710000000000000
          Top = 30.236240000000000000
          Width = 302.362400000000000000
          Height = 26.456710000000000000
          DisplayFormat.FormatStr = 'dd mmmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'dicetak pada: [Date]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 381.732530000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '| [db_laporan."kd_perusahaan"] | [db_laporan."n_perusahaan"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 45.354360000000000000
          Top = 75.590600000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'PID')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo6: TfrxMemoView
          Top = 75.590600000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'No')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Left = 94.488250000000000000
          Top = 75.590600000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Deskripsi')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo8: TfrxMemoView
          Left = 321.260050000000000000
          Top = 75.590600000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Jenis')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 487.559370000000000000
          Top = 75.590600000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Memo.UTF8W = (
            'Golongan')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo11: TfrxMemoView
          Left = 642.520100000000000000
          Top = 75.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = dm.db_laporan
          DataSetName = 'db_laporan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Aktif')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
  object db_laporan: TfrxDBDataset
    UserName = 'db_laporan'
    CloseDataSource = False
    DataSource = ds_barang
    BCDToCurrency = False
    Left = 148
    Top = 166
  end
end
