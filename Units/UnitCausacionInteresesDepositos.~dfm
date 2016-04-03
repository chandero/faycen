object frmCausacionInteresesDepositos: TfrmCausacionInteresesDepositos
  Left = 206
  Top = 112
  Width = 928
  Height = 360
  Caption = 'Causaci'#243'n de Intereses de Depositos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Periodo'
  end
  object Label2: TLabel
    Left = 13
    Top = 32
    Width = 47
    Height = 13
    Caption = 'Asociado:'
  end
  object CBMeses: TComboBox
    Left = 64
    Top = 3
    Width = 105
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Enero'
    Items.Strings = (
      'Enero'
      'Febrero'
      'Marzo'
      'Abril'
      'Mayo'
      'Junio'
      'Julio'
      'Agosto'
      'Septiembre'
      'Octubre'
      'Noviembre'
      'Diciembre')
  end
  object btnProcesar: TBitBtn
    Left = 184
    Top = 1
    Width = 75
    Height = 25
    Caption = '&Procesar'
    TabOrder = 1
    OnClick = btnProcesarClick
  end
  object pgb: TProgressBar
    Left = 536
    Top = 32
    Width = 379
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 56
    Width = 905
    Height = 233
    DataSource = DSgrid
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO_CAPTACION'
        Title.Alignment = taCenter
        Title.Caption = 'MODALIDAD'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_CUENTA'
        Title.Alignment = taCenter
        Title.Caption = 'NUMERO'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ASOCIADO'
        Title.Alignment = taCenter
        Width = 364
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_BASE'
        Title.Alignment = taCenter
        Title.Caption = 'BASE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TASAEFECTIVA'
        Title.Alignment = taCenter
        Title.Caption = 'TASA'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAUSACION_MENSUAL'
        Title.Alignment = taCenter
        Title.Caption = 'CAUSADO'
        Width = 121
        Visible = True
      end>
  end
  object edAsociado: TEdit
    Left = 64
    Top = 29
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object IBQcuentas: TIBQuery
    Left = 280
  end
  object IBQproceso: TIBQuery
    Left = 320
  end
  object CDScausacion: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_AGENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ID_TIPO_CAPTACION'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_CAPTACION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMERO_CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'DIGITO_CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'ASOCIADO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SALDO_BASE'
        DataType = ftCurrency
      end
      item
        Name = 'TASAEFECTIVA'
        DataType = ftFloat
      end
      item
        Name = 'DIAS'
        DataType = ftInteger
      end
      item
        Name = 'ANHO'
        DataType = ftInteger
      end
      item
        Name = 'MES'
        DataType = ftInteger
      end
      item
        Name = 'CAUSACION_MENSUAL'
        DataType = ftCurrency
      end
      item
        Name = 'RETEFUENTE_MENSUAL'
        DataType = ftCurrency
      end
      item
        Name = 'NETO_MENSUAL'
        DataType = ftCurrency
      end
      item
        Name = 'CODIGO_CAUSACION'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CODIGO_GASTO'
        DataType = ftString
        Size = 18
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 104
    Data = {
      E10100009619E0BD010000001800000010000000000003000000E1010A49445F
      4147454E43494104000100000000001149445F5449504F5F434150544143494F
      4E04000100000000000E5449504F5F434150544143494F4E0100490000000100
      0557494454480200020014000D4E554D45524F5F4355454E5441040001000000
      00000D44494749544F5F4355454E544104000100000000000841534F43494144
      4F010049000000010005574944544802000200C8000A53414C444F5F42415345
      080004000000010007535542545950450200490006004D6F6E6579000C544153
      4145464543544956410800040000000000044449415304000100000000000441
      4E484F0400010000000000034D4553040001000000000011434155534143494F
      4E5F4D454E5355414C080004000000010007535542545950450200490006004D
      6F6E65790012524554454655454E54455F4D454E5355414C0800040000000100
      07535542545950450200490006004D6F6E6579000C4E45544F5F4D454E535541
      4C080004000000010007535542545950450200490006004D6F6E65790010434F
      4449474F5F434155534143494F4E010049000000010005574944544802000200
      12000C434F4449474F5F474153544F0100490000000100055749445448020002
      0012000000}
    object CDScausacionID_AGENCIA: TIntegerField
      FieldName = 'ID_AGENCIA'
    end
    object CDScausacionID_TIPO_CAPTACION: TIntegerField
      FieldName = 'ID_TIPO_CAPTACION'
    end
    object CDScausacionTIPO_CAPTACION: TStringField
      FieldName = 'TIPO_CAPTACION'
    end
    object CDScausacionNUMERO_CUENTA: TIntegerField
      FieldName = 'NUMERO_CUENTA'
    end
    object CDScausacionDIGITO_CUENTA: TIntegerField
      FieldName = 'DIGITO_CUENTA'
    end
    object CDScausacionASOCIADO: TStringField
      FieldName = 'ASOCIADO'
      Size = 200
    end
    object CDScausacionSALDO_BASE: TCurrencyField
      FieldName = 'SALDO_BASE'
    end
    object CDScausacionTASAEFECTIVA: TFloatField
      FieldName = 'TASAEFECTIVA'
    end
    object CDScausacionDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object CDScausacionANHO: TIntegerField
      FieldName = 'ANHO'
    end
    object CDScausacionMES: TIntegerField
      FieldName = 'MES'
    end
    object CDScausacionCAUSACION_MENSUAL: TCurrencyField
      FieldName = 'CAUSACION_MENSUAL'
    end
    object CDScausacionRETEFUENTE_MENSUAL: TCurrencyField
      FieldName = 'RETEFUENTE_MENSUAL'
    end
    object CDScausacionNETO_MENSUAL: TCurrencyField
      FieldName = 'NETO_MENSUAL'
    end
    object CDScausacionCODIGO_CAUSACION: TStringField
      FieldName = 'CODIGO_CAUSACION'
      Size = 18
    end
    object CDScausacionCODIGO_GASTO: TStringField
      FieldName = 'CODIGO_GASTO'
      Size = 18
    end
  end
  object DSgrid: TDataSource
    DataSet = CDScausacion
    Left = 136
    Top = 144
  end
end
