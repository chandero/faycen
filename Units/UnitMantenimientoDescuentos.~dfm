object frmMantenimientoDescuentos: TfrmMantenimientoDescuentos
  Left = 181
  Top = 93
  Width = 1024
  Height = 484
  Caption = 'Mantenimiento de Descuentos'
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
  object grPersona: TDBGrid
    Left = 8
    Top = 8
    Width = 473
    Height = 401
    DataSource = dsGridPersona
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = grPersonaTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PERSONA'
        ReadOnly = True
        Title.Caption = 'DOCUMENTO'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_CUENTA'
        ReadOnly = True
        Title.Caption = 'CUENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        ReadOnly = True
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMER_APELLIDO'
        ReadOnly = True
        Title.Caption = 'PRIMER APELLIDO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEGUNDO_APELLIDO'
        ReadOnly = True
        Title.Caption = 'SEGUNDO APELLIDO'
        Width = 80
        Visible = True
      end>
  end
  object panel1: TPanel
    Left = 0
    Top = 416
    Width = 1016
    Height = 34
    Align = alBottom
    Color = clBackground
    TabOrder = 1
    object btnCerrar: TBitBtn
      Left = 936
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
      Glyph.Data = {
        AA040000424DAA04000000000000360000002800000014000000130000000100
        18000000000074040000CE0E0000D80E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080
        000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF808080FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000
        0080808080FFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000
        80808080FFFFFF0000FF000080000080000080000080808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080
        808080000080000080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00008000008000008000008000
        0080000080000080000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000800000800000
        80000080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000080000080000080000080000080808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF000080000080000080000080808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000FF000080000080000080000080000080808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF00
        0080000080000080808080000080000080000080808080FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000800000800000
        80808080FFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080000080808080FFFFFF
        FFFFFFFFFFFF0000FF000080000080000080808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF000080FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000FF000080000080000080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FF0000800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object grProducto: TDBGrid
    Left = 488
    Top = 8
    Width = 521
    Height = 361
    DataSource = dsGridProducto
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grProductoCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUCTO'
        ReadOnly = True
        Title.Caption = 'ID'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        ReadOnly = True
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION_PRODUCTO'
        ReadOnly = True
        Title.Caption = 'DESCRIPCION'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_DESCUENTO'
        Title.Caption = 'VALOR'
        Width = 150
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 488
    Top = 376
    Width = 521
    Height = 33
    Color = clGradientActiveCaption
    TabOrder = 3
    object btnAplicar: TBitBtn
      Left = 416
      Top = 5
      Width = 102
      Height = 25
      Caption = '&Aplicar Cambios'
      TabOrder = 0
      OnClick = btnAplicarClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFF5AFFFFF
        0000000000000FFFF5AFFFF08B000000880B0FFF55FAFFF0B800000088080FFF
        55FAFFF08B000000880B0FFFFFFFFFF0B800000000080FFFFFFFFFF08B8B8B8B
        8B8B0FFFFFFFFFF0B800000000B80FFFFFFFFFF080888888880B0FFFFFFFFFF0
        B088888888080FFFFFFFFFF080888888880B0FFFFFFFFFF0B088888888080FFF
        FFFFFFF08088888888000FFFFFFFFFF0B088888888080FFFFFFFFFF000000000
        00000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFFFFFFFFFF0000}
    end
  end
  object dsGridPersona: TDataSource
    DataSet = cdsPersona
    Left = 64
    Top = 80
  end
  object IBQPersona: TIBQuery
    Left = 64
    Top = 168
  end
  object dsProducto: TDataSource
    DataSet = IBQProducto
    Left = 632
    Top = 232
  end
  object cdsProducto: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_PRODUCTO'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRIPCION_PRODUCTO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'VALOR_DESCUENTO'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_PRODUCTO'
    Params = <>
    StoreDefs = True
    AfterEdit = cdsProductoAfterEdit
    AfterScroll = cdsProductoAfterScroll
    Left = 632
    Top = 168
    Data = {
      9E0000009619E0BD0100000018000000040000000000030000009E000B49445F
      50524F445543544F0400010000000000064E554D45524F010049000000010005
      5749445448020002001400144445534352495043494F4E5F50524F445543544F
      010049000000010005574944544802000200C8000F56414C4F525F4445534355
      454E544F080004000000010007535542545950450200490006004D6F6E657900
      0000}
    object cdsProductoID_PRODUCTO: TIntegerField
      FieldName = 'ID_PRODUCTO'
    end
    object cdsProductoNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsProductoDESCRIPCION_PRODUCTO: TStringField
      DisplayWidth = 200
      FieldName = 'DESCRIPCION_PRODUCTO'
      Size = 200
    end
    object cdsProductoVALOR_DESCUENTO: TCurrencyField
      FieldName = 'VALOR_DESCUENTO'
    end
  end
  object IBQProducto: TIBQuery
    Left = 592
    Top = 232
  end
  object cdsPersona: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'P_APELLIDO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'S_APELLIDO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'cdsPersonaIndex1'
        Fields = 'ID_PERSONA'
      end
      item
        Name = 'cdsPersonaIndex2'
        Fields = 'NUMERO_CUENTA'
      end
      item
        Name = 'cdsPersonaIndex3'
        Fields = 'NOMBRE'
      end
      item
        Name = 'cdsPersonaIndex4'
        Fields = 'PRIMER_APELLIDO'
      end
      item
        Name = 'cdsPersonaIndex5'
        Fields = 'SEGUNDO_APELLIDO'
      end>
    Params = <>
    ProviderName = 'dspPersona'
    StoreDefs = True
    BeforeScroll = cdsPersonaBeforeScroll
    AfterScroll = cdsPersonaAfterScroll
    Left = 112
    Top = 80
  end
  object dsPersona: TDataSource
    DataSet = IBQPersona
    Left = 112
    Top = 168
  end
  object dsGridProducto: TDataSource
    DataSet = cdsProducto
    Left = 584
    Top = 168
  end
  object dspPersona: TDataSetProvider
    DataSet = IBQPersona
    Constraints = True
    Left = 112
    Top = 128
  end
end
