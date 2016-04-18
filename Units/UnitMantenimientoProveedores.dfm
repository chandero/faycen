object frmMantenimientoProveedores: TfrmMantenimientoProveedores
  Left = 387
  Top = 101
  Width = 665
  Height = 466
  Caption = 'Mantenimiento de Proveedores'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CmdPUC: TSpeedButton
    Left = 547
    Top = 375
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = CmdPUCClick
  end
  object DBgrid: TDBGrid
    Left = 8
    Top = 8
    Width = 641
    Height = 361
    DataSource = DSgrid
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PROVEEDOR'
        ReadOnly = True
        Title.Caption = 'ID'
        Width = 29
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        ReadOnly = True
        Width = 399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        ReadOnly = True
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMISION'
        Visible = True
      end>
  end
  object EdId: TDBEdit
    Left = 8
    Top = 375
    Width = 49
    Height = 21
    DataField = 'ID_PROVEEDOR'
    DataSource = DSgrid
    TabOrder = 1
  end
  object EdDescripcion: TDBEdit
    Left = 64
    Top = 376
    Width = 353
    Height = 21
    DataField = 'DESCRIPCION'
    DataSource = DSgrid
    TabOrder = 2
  end
  object EdCodigo: TDBEdit
    Left = 423
    Top = 376
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = DSgrid
    TabOrder = 3
  end
  object EdComision: TDBEdit
    Left = 576
    Top = 376
    Width = 73
    Height = 21
    DataField = 'COMISION'
    DataSource = DSgrid
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 399
    Width = 657
    Height = 33
    Align = alBottom
    Color = 16776176
    TabOrder = 5
    object CmdCerrar: TBitBtn
      Left = 566
      Top = 6
      Width = 75
      Height = 23
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = CmdCerrarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000006400004242
        42008C6363009A666600B9666600BB686800B0717200C3686900C66A6B00C76A
        6D00CF6C6E00D2686900D16D6E00CC6E7100C0797A00D2707200D4707100D572
        7300D0727500D3747600D9757600D8767700E37D7E000080000000960000DC7F
        8000FF00FF00D7868700DA888800D8888A00DA888A00DF898A00E6808100E085
        8500E9818200EE868700E3888900E78C8D00F0878800F18B8C00F28B8C00F18D
        8E00F48C8D00F48E8F00EB8F9000EC969700E49A9800F3919200F7909100F791
        9200F2939400F9909200F9949500FA949500F9969700F0999A00FC999A00FF9D
        9E00F7B58400F5A7A500FACCAA00FBD6BB00FADCDC00FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001A1A1A1A1A1A
        1A02011A1A1A1A1A1A1A1A1A1A1A02030405011A1A1A1A1A1A1A1A1A0203080B
        0B07010303030303031A1A1A030C0C0C0A09010E1F323B3B031A1A1A030C0C10
        0F0D01181818183B031A1A1A03111114151201181818183B031A1A1A03161616
        201301181717173B031A1A1A0326222D3E1D01171700003B031A1A1A03262337
        3F1E013C3A3A3A3B031A1A1A03272B282A19013C3D3D3D3B031A1A1A03273031
        2921013C3D3D3D3B031A1A1A032734352F24013C3D3D3D3B031A1A1A03273338
        3625013C3D3D3D3B031A1A1A03032E33392C013C3D3D3D3B031A1A1A1A1A0306
        1B1C010303030303031A1A1A1A1A1A1A0303011A1A1A1A1A1A1A}
    end
    object BitBtn3: TBitBtn
      Left = 173
      Top = 5
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Eliminar'
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 87
      Top = 5
      Width = 81
      Height = 25
      Caption = '&Guardar'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        36010000424D3601000000000000760000002800000011000000100000000100
        040000000000C0000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFF0FFFFFFFFF0F0F0F0FFFFFFF0FFFFFFFFFFFFFFF00FFFFFF0FFFFFFFF88
        888880008FFFF0FFFFFFF000008000B70FFFF0FFFFFFF0FFFFFFF0B80FFFF0FF
        FFFFF0F0F0F0F70B70FFF0FFFFFFF0FFFFFFFF0B80FFF0FFFFFFF0F0F0F0F7F0
        B70FF0FFFFFFF0FFFFFFFFF0B007F0FFFFFFF0F0F0F0F7F00190F0FFFFFFF0FF
        FFFFFFF0000FF0FFFFFFFCCCCCCCCCCC8FFFF0FFFFFFFCCFCFCFCFCCFFFFF0FF
        FFFFFCCCCCCCCCCCFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFF}
    end
    object Btnlimpiar: TBitBtn
      Left = 1
      Top = 5
      Width = 81
      Height = 25
      Caption = '&Nuevo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BtnlimpiarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100000E0F00000E0F00000001000000010000FF00FF00B584
        8400B5948C00C6A59C00D6BDB500E7C6B500E7CECE0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000020101010101010200000000000000000106060606
        0606010100000000000000010606060606060103010000000000000204040404
        0404010303010000000000000205050505050501030301000000000000020505
        0505050501030301000000000000020505050505050103030100000000000002
        0505050505050103010000000000000002050505050505010100000000000000
        0002050505050505010000000000000000000201010101010200000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object DSgrid: TDataSource
    DataSet = IBTproveedor
    Left = 32
    Top = 56
  end
  object IBQproveedor: TIBQuery
    AfterScroll = IBQproveedorAfterScroll
    SQL.Strings = (
      'select * from GEN$PROVEEDOR')
    Left = 72
    Top = 112
  end
  object IBTproveedor: TIBTable
    AfterScroll = IBTproveedorAfterScroll
    TableName = 'GEN$PROVEEDOR'
    Left = 112
    Top = 72
  end
end
