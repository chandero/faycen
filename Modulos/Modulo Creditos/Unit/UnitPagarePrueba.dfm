object frmPagarePrueba: TfrmPagarePrueba
  Left = 475
  Top = 208
  Width = 250
  Height = 204
  BorderIcons = [biSystemMenu]
  Caption = 'Impresi'#243'n de Pagar'#233
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 242
    Height = 33
    Align = alBottom
    Color = clOlive
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 146
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 1
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
    object CmdImprimir: TBitBtn
      Left = 2
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 0
      OnClick = CmdImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000181818002118
        21001821210031313100393939004242420052525200636363006B6B6B007373
        7300848484008C8C8C00948C8C00949494009C949400F7AD94009C9C9C00CE9C
        9C00F7AD9C00FFAD9C00FFB59C009C9CA500A5A5A500ADA5A500C6A5A500A5AD
        A500FFBDA500A5D6A500ADADAD00B5ADAD00FFC6AD00B5B5B500FFC6B500BDBD
        BD00C6BDBD00BDC6BD00E7C6BD00EFCEBD00FFCEBD00BDBDC600C6C6C600CEC6
        C600E7CEC600CECECE00D6CECE00DED6CE00FFDECE00D6D6D600FFE7D600D6DE
        DE00DEDEDE00EFE7DE00E7E7E700EFE7E700FFE7E700EFEFEF00F7EFEF00F7EF
        F700F7F7F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003B3B3B3B3B3B
        103B3B3B0A0A0B3B3B3B3B3B3B3B10102C0D04060E282F0A3B3B3B3B10103A3C
        2F1005010103070A0B3B0C10373C3528100B0D0A07040201093B10343421161D
        22160D0C0D0E0B080A3B0D1C161C282F373732281C100C0D0B3B0C1C282B2832
        2B19212B2F2F281F0D3B3B102B2B32281F1B231817161F22163B3B3B10211C1C
        343837332F2B1F0D3B3B3B3B3B102F2B10212F2F2F281C3B3B3B3B3B3B3B362E
        24242A2D2B0D3B3B3B3B3B3B3B3B112E261E1A133B3B3B3B3B3B3B3B3B3B112E
        261E1A0F3B3B3B3B3B3B3B3B3B3B112E261E1A123B3B3B3B3B3B3B3B3B11302E
        261E1A123B3B3B3B3B3B3B3B3B1111111112123B3B3B3B3B3B3B}
    end
  end
  object GridDeudores: TStringGrid
    Left = 4
    Top = 75
    Width = 221
    Height = 54
    ColCount = 4
    FixedCols = 0
    TabOrder = 2
    Visible = False
    ColWidths = (
      64
      64
      64
      64)
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 230
    Height = 48
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 89
      Height = 13
      Caption = 'COLOCACION No:'
    end
    object Label2: TLabel
      Left = 49
      Top = 28
      Width = 142
      Height = 13
      Caption = 'PERSONERIA JURIDICA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object EdColocacion: TMemo
      Left = 96
      Top = 2
      Width = 125
      Height = 19
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 11
      ParentFont = False
      TabOrder = 0
      OnEnter = EdColocacionEnter
      OnExit = EdColocacionExit
      OnKeyPress = EdColocacionKeyPress
    end
    object CHblanco: TCheckBox
      Left = 3
      Top = 28
      Width = 106
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Pagar'#233' en &Blanco'
      TabOrder = 1
      OnClick = CHblancoClick
    end
    object CHpoder: TCheckBox
      Left = 113
      Top = 28
      Width = 108
      Height = 17
      TabStop = False
      Alignment = taLeftJustify
      Caption = 'Pagar'#233' con &Poder'
      TabOrder = 2
      OnClick = CHpoderClick
    end
  end
  object IBSQLPagare: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'SELECT'
      '  "col$colocacion".ID_AGENCIA,'
      '  "col$colocacion".ID_COLOCACION,'
      '  "col$colocacion".ID_IDENTIFICACION,'
      '  "col$colocacion".ID_PERSONA,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO,'
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".LUGAR_EXPEDICION,'
      '  "gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,'
      '  "col$colocacion".VALOR_DESEMBOLSO,'
      '  "col$colocacion".FECHA_DESEMBOLSO,'
      '  "col$colocacion".FECHA_VENCIMIENTO,'
      '  "col$inversion".DESCRIPCION_INVERSION,'
      '  "col$garantia".DESCRIPCION_GARANTIA,'
      '  "col$colocacion".VALOR_CUOTA,'
      '  "col$colocacion".FECHA_VENCIMIENTO,'
      '  "col$colocacion".ID_INTERES,'
      '  "col$colocacion".TASA_INTERES_CORRIENTE,'
      '  "col$tasasvariables".DESCRIPCION_TASA,'
      '  "col$colocacion".PUNTOS_INTERES,'
      '  "col$colocacion".AMORTIZA_CAPITAL,'
      '  "col$colocacion".AMORTIZA_INTERES,'
      '  "col$tiposcuota".INTERES,'
      '  "col$tiposcuota".TIPO_CUOTA'
      'FROM'
      '  "col$colocacion"'
      
        '  INNER JOIN "gen$tiposidentificacion" ON ("col$colocacion".ID_I' +
        'DENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)'
      
        '  LEFT JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES' +
        ' = "col$tasasvariables".ID_INTERES)'
      
        '  LEFT JOIN "gen$persona" ON ("col$colocacion".ID_IDENTIFICACION' +
        ' = "gen$persona".ID_IDENTIFICACION and "col$colocacion".ID_PERSO' +
        'NA = "gen$persona".ID_PERSONA)'
      
        ' LEFT OUTER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA' +
        ' = "col$garantia".ID_GARANTIA)'
      
        ' LEFT OUTER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSI' +
        'ON = "col$inversion".ID_INVERSION)'
      
        ' LEFT OUTER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_C' +
        'UOTA = "col$tiposcuota".ID_TIPOS_CUOTA)'
      'WHERE'
      '  "col$colocacion".ID_AGENCIA = :AGENCIA and'
      '  "col$colocacion".ID_COLOCACION = :ID_COLOCACION')
    Transaction = dmGeneral.IBTransaction1
    Left = 342
    Top = 54
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = CDSCodeudores
    Left = 134
    Top = 64
  end
  object IBSQLCodeudores: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      
        'select "gen$persona".ID_IDENTIFICACION, "gen$persona".ID_PERSONA' +
        ', "gen$persona".PRIMER_APELLIDO, "gen$persona".SEGUNDO_APELLIDO,' +
        '"gen$persona".NOMBRE, '
      '"gen$persona".LUGAR_EXPEDICION,'
      
        '"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION from "col$c' +
        'olgarantias"'
      
        'inner join "gen$persona" on ("col$colgarantias".ID_IDENTIFICACIO' +
        'N = "gen$persona".ID_IDENTIFICACION and "col$colgarantias".ID_PE' +
        'RSONA = "gen$persona".ID_PERSONA)'
      
        'inner join "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTI' +
        'FICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)'
      'where'
      '  ID_AGENCIA = :ID_AGENCIA and'
      '  ID_COLOCACION = :ID_COLOCACION'
      'order by'
      '  "col$colgarantias".CSC_GARANTIA')
    Transaction = dmGeneral.IBTransaction1
    Left = 156
    Top = 46
  end
  object NLetra: TNLetra
    Numero = 0
    Letras = 'Cero'
    Left = 140
    Top = 10
  end
  object IBSQLCuotas: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'select * from "col$tablaliquidacion"'
      
        'where ID_AGENCIA = :ID_AGENCIA and ID_COLOCACION = :ID_COLOCACIO' +
        'N')
    Transaction = dmGeneral.IBTransaction1
    Left = 72
    Top = 86
  end
  object IBSQL1: TIBSQL
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 166
    Top = 18
  end
  object CDSCodeudores: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDENTIFICACION'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 102
    Top = 52
    Data = {
      580000009619E0BD0100000018000000020000000000030000005800064E4F4D
      42524501004900000001000557494454480200020014000E4944454E54494649
      434143494F4E020049000000010005574944544802000200FF000000}
    object CDSCodeudoresNOMBRE: TStringField
      FieldName = 'NOMBRE'
    end
    object CDSCodeudoresIDENTIFICACION: TStringField
      FieldName = 'IDENTIFICACION'
      Size = 255
    end
  end
  object ReporteN: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginPage = ReporteNBeginPage
    OnGetValue = ReporteGetValue
    OnPrintReport = ReporteNPrintReport
    Left = 72
    Top = 48
    ReportForm = {19000000}
  end
  object IBSQL2: TIBSQL
    Database = dmGeneral.IBDatabase1
    SQL.Strings = (
      'SELECT '
      '  "gen$persona".NOMBRE,'
      '  "gen$persona".PRIMER_APELLIDO,'
      '  "gen$persona".SEGUNDO_APELLIDO'
      'FROM'
      ' "gen$persona"'
      'WHERE'
      '  ("gen$persona".ID_IDENTIFICACION = :ID_IDENTIFICACION) AND '
      '  ("gen$persona".ID_PERSONA = :ID_PERSONA)')
    Transaction = dmGeneral.IBTransaction1
    Left = 48
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    Left = 16
    Top = 56
  end
  object IBQDeudor: TIBQuery
    Left = 48
    Top = 56
  end
  object CDSDeudor: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 40
    Data = {
      D10000009619E0BD010000001800000006000000000003000000D100064E554D
      45524F040001000000000009444F43554D454E544F0100490000000100055749
      445448020002001400074E4F4D42524553010049000000010005574944544802
      000200C8000F5052494D45525F4150454C4C49444F0100490000000100055749
      44544802000200640010534547554E444F5F4150454C4C49444F010049000000
      0100055749445448020002006400104C554741525F45585045444943494F4E01
      0049000000010005574944544802000200C8000000}
    object CDSDeudorNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object CDSDeudorDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
    end
    object CDSDeudorNOMBRES: TStringField
      FieldName = 'NOMBRES'
      Size = 200
    end
    object CDSDeudorPRIMER_APELLIDO: TStringField
      FieldName = 'PRIMER_APELLIDO'
      Size = 100
    end
    object CDSDeudorSEGUNDO_APELLIDO: TStringField
      FieldName = 'SEGUNDO_APELLIDO'
      Size = 100
    end
    object CDSDeudorLUGAR_EXPEDICION: TStringField
      FieldName = 'LUGAR_EXPEDICION'
      Size = 200
    end
  end
  object frDBDSDeudor: TfrDBDataSet
    DataSet = CDSDeudor
    Left = 182
    Top = 56
  end
  object CDSDescuento: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_DESCUENTO'
        DataType = ftInteger
      end
      item
        Name = 'DESCONTAR'
        DataType = ftBoolean
      end
      item
        Name = 'DESCRIPCION_DESCUENTO'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_SOLICITUD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 40
    Top = 392
    Data = {
      6B0000009619E0BD0100000018000000030000000000030000006B000C49445F
      4445534355454E544F040001000000000009444553434F4E5441520200030000
      000000154445534352495043494F4E5F4445534355454E544F01004900000001
      0005574944544802000200C8000000}
    object CDSDescuentoID_DESCUENTO: TIntegerField
      FieldName = 'ID_DESCUENTO'
    end
    object CDSDescuentoDESCONTAR: TBooleanField
      FieldName = 'DESCONTAR'
    end
    object CDSDescuentoDESCRIPCION_DESCUENTO: TStringField
      FieldName = 'DESCRIPCION_DESCUENTO'
      Size = 200
    end
  end
  object CDSADescontar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_DESCUENTO'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CUOTA_NUMERO'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 392
    Data = {
      810000009619E0BD01000000180000000400000000000300000081000C49445F
      4445534355454E544F040001000000000006434F4449474F0100490000000100
      05574944544802000200C8000C43554F54415F4E554D45524F04000100000000
      000556414C4F52080004000000010007535542545950450200490006004D6F6E
      6579000000}
    object CDSADescontarID_DESCUENTO: TIntegerField
      FieldName = 'ID_DESCUENTO'
    end
    object CDSADescontarCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 200
    end
    object CDSADescontarCUOTA: TIntegerField
      FieldName = 'CUOTA_NUMERO'
    end
    object CDSADescontarVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
  end
  object IBQDescuento: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM "col$colocaciondescuento" '
      
        'INNER JOIN "col$descuentos" on ("col$colocaciondescuento".ID_DES' +
        'CUENTO = "col$descuentos".ID_DESCUENTO) '
      
        ' WHERE ID_COLOCACION = :ID_COLOCACION and ID_AGENCIA = :ID_AGENC' +
        'IA')
    Left = 120
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_COLOCACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end>
  end
  object CDSCuotas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 104
    Data = {
      E10000009619E0BD010000001800000006000000000003000000E1000C43554F
      54415F4E554D45524F04000100000000000D46454348415F415F504147415204
      000600000000000F4341504954414C5F415F5041474152080004000000010007
      535542545950450200490006004D6F6E6579000F494E54455245535F415F5041
      474152080004000000010007535542545950450200490006004D6F6E65790005
      53414C444F080004000000010007535542545950450200490006004D6F6E6579
      00054F54524F53080004000000010007535542545950450200490006004D6F6E
      6579000000}
    object CDSCuotasCUOTA_NUMERO: TIntegerField
      FieldName = 'CUOTA_NUMERO'
    end
    object CDSCuotasFECHA_A_PAGAR: TDateField
      FieldName = 'FECHA_A_PAGAR'
    end
    object CDSCuotasCAPITAL_A_PAGAR: TCurrencyField
      FieldName = 'CAPITAL_A_PAGAR'
    end
    object CDSCuotasINTERES_A_PAGAR: TCurrencyField
      FieldName = 'INTERES_A_PAGAR'
    end
    object CDSCuotasSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object CDSCuotasOTROS: TCurrencyField
      FieldName = 'OTROS'
    end
  end
  object IBSQL: TIBSQL
    Left = 184
    Top = 88
  end
end
