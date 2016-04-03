object dmColocacion: TdmColocacion
  OldCreateOrder = False
  Left = 326
  Top = 161
  Height = 395
  Width = 284
  object IBDStiposid: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "gen$tiposidentificacion"."ID_IDENTIFICACION",'
      '  "gen$tiposidentificacion"."DESCRIPCION_IDENTIFICACION",'
      '  "gen$tiposidentificacion"."MASCARA_IDENTIFICACION"'
      'from "gen$tiposidentificacion" '
      'where'
      
        '  "gen$tiposidentificacion"."ID_IDENTIFICACION" = :"ID_IDENTIFIC' +
        'ACION"')
    SelectSQL.Strings = (
      'select * from "gen$tiposidentificacion"')
    Left = 10
    Top = 6
  end
  object IBDSclasificacion: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "col$clasificacion"."ID_CLASIFICACION",'
      '  "col$clasificacion"."DESCRIPCION_CLASIFICACION"'
      'from "col$clasificacion" '
      'where'
      '  "col$clasificacion"."ID_CLASIFICACION" = :"ID_CLASIFICACION"')
    SelectSQL.Strings = (
      'select * from "col$clasificacion"')
    Left = 66
    Top = 6
  end
  object IBDSlinea: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "col$lineas"."ID_LINEA",'
      '  "col$lineas"."DESCRIPCION_LINEA",'
      '  "col$lineas"."VECES_APORTES",'
      '  "col$lineas"."VECES_AHORROS",'
      '  "col$lineas"."PORCENTAJE_CREDITO",'
      '  "col$lineas"."PORCENTAJE_APORTES",'
      '  "col$lineas"."PORCENTAJE_AHORROS",'
      '  "col$lineas"."MINIMO_CAPITALIZAR",'
      '  "col$lineas"."CAPITALIZACION_ACUMULADA"'
      'from "col$lineas" '
      'where'
      '  "col$lineas"."ID_LINEA" = :"ID_LINEA"')
    SelectSQL.Strings = (
      'select * from "col$lineas"')
    Left = 122
    Top = 6
  end
  object IBDSinversion: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "col$inversion"."ID_INVERSION",'
      '  "col$inversion"."DESCRIPCION_INVERSION"'
      'from "col$inversion" '
      'where'
      '  "col$inversion"."ID_INVERSION" = :"ID_INVERSION" and'
      
        '  "col$inversion"."DESCRIPCION_INVERSION" = :"DESCRIPCION_INVERS' +
        'ION"')
    SelectSQL.Strings = (
      'select * from "col$inversion"')
    Left = 178
    Top = 6
  end
  object IBDSrespaldo: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "col$respaldo"."ID_RESPALDO",'
      '  "col$respaldo"."DESCRIPCION_RESPALDO"'
      'from "col$respaldo" '
      'where'
      '  "col$respaldo"."ID_RESPALDO" = :"ID_RESPALDO"')
    SelectSQL.Strings = (
      'select * from "col$respaldo"')
    ModifySQL.Strings = (
      '')
    Left = 12
    Top = 52
  end
  object IBDSgarantia: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select '
      '  "col$garantia"."ID_GARANTIA",'
      '  "col$garantia"."DESCRIPCION_GARANTIA"'
      'from "col$garantia" '
      'where'
      '  "col$garantia"."ID_GARANTIA" = :"ID_GARANTIA"')
    SelectSQL.Strings = (
      'select * from "col$garantia"')
    ModifySQL.Strings = (
      '')
    Left = 72
    Top = 52
  end
  object IBDStipocuota: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'Select '
      '  "col$tiposcuota"."ID_TIPOS_CUOTA",'
      '  "col$tiposcuota"."DESCRIPCION_TIPO_CUOTA",'
      '  "col$tiposcuota"."CAPITAL",'
      '  "col$tiposcuota"."INTERES",'
      '  "col$tiposcuota"."TIPO_CUOTA"'
      'from "col$tiposcuota" '
      'where'
      '  "col$tiposcuota"."ID_TIPOS_CUOTA" = :"ID_TIPOS_CUOTA"')
    SelectSQL.Strings = (
      'Select * from "col$tiposcuota"'
      'where'
      '"col$tiposcuota".ES_VARIABLE =:"ES_VARIABLE" or'
      '"col$tiposcuota".ES_FIJA =:"ES_FIJA"')
    Left = 130
    Top = 52
  end
  object IBDScolocacion: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "col$colocacion"'
      'where'
      '  "col$colocacion"."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      '  "col$colocacion"."ID_COLOCACION" = :"OLD_ID_COLOCACION"')
    InsertSQL.Strings = (
      'insert into "col$colocacion"'
      
        '  ("col$colocacion"."ID_AGENCIA", "col$colocacion"."ID_COLOCACIO' +
        'N", "col$colocacion"."ID_IDENTIFICACION", '
      
        '   "col$colocacion"."ID_PERSONA", "col$colocacion"."ID_CLASIFICA' +
        'CION", '
      
        '   "col$colocacion"."ID_LINEA", "col$colocacion"."ID_INVERSION",' +
        ' "col$colocacion"."ID_RESPALDO", '
      
        '   "col$colocacion"."ID_GARANTIA", "col$colocacion"."ID_CATEGORI' +
        'A", "col$colocacion"."ID_EVALUACION", '
      
        '   "col$colocacion"."FECHA_DESEMBOLSO", "col$colocacion"."VALOR_' +
        'DESEMBOLSO", '
      
        '   "col$colocacion"."PLAZO_COLOCACION", "col$colocacion"."FECHA_' +
        'VENCIMIENTO", '
      
        '   "col$colocacion"."TIPO_INTERES", "col$colocacion"."ID_INTERES' +
        '", "col$colocacion"."TASA_INTERES_CORRIENTE", '
      
        '   "col$colocacion"."TASA_INTERES_MORA", "col$colocacion"."PUNTO' +
        'S_INTERES", '
      
        '   "col$colocacion"."ID_TIPO_CUOTA", "col$colocacion"."AMORTIZA_' +
        'CAPITAL", '
      
        '   "col$colocacion"."AMORTIZA_INTERES", "col$colocacion"."PERIOD' +
        'O_GRACIA", '
      
        '   "col$colocacion"."DIAS_PRORROGADOS", "col$colocacion"."VALOR_' +
        'CUOTA", '
      
        '   "col$colocacion"."ABONOS_CAPITAL", "col$colocacion"."FECHA_CA' +
        'PITAL", '
      
        '   "col$colocacion"."FECHA_INTERES", "col$colocacion"."ID_ESTADO' +
        '_COLOCACION", '
      
        '   "col$colocacion"."ID_ENTE_APROBADOR", "col$colocacion"."ID_EM' +
        'PLEADO", '
      '   "col$colocacion"."NOTA_CONTABLE")'
      'values'
      
        '  (:"ID_AGENCIA", :"ID_COLOCACION", :"ID_IDENTIFICACION", :"ID_P' +
        'ERSONA", '
      
        '   :"ID_CLASIFICACION", :"ID_LINEA", :"ID_INVERSION", :"ID_RESPA' +
        'LDO", :"ID_GARANTIA", '
      
        '   :"ID_CATEGORIA", :"ID_EVALUACION", :"FECHA_DESEMBOLSO", :"VAL' +
        'OR_DESEMBOLSO", '
      
        '   :"PLAZO_COLOCACION", :"FECHA_VENCIMIENTO", :"TIPO_INTERES", :' +
        '"ID_INTERES", '
      
        '   :"TASA_INTERES_CORRIENTE", :"TASA_INTERES_MORA", :"PUNTOS_INT' +
        'ERES", '
      
        '   :"ID_TIPO_CUOTA", :"AMORTIZA_CAPITAL", :"AMORTIZA_INTERES", :' +
        '"PERIODO_GRACIA", '
      
        '   :"DIAS_PRORROGADOS", :"VALOR_CUOTA", :"ABONOS_CAPITAL", :"FEC' +
        'HA_CAPITAL", '
      
        '   :"FECHA_INTERES", :"ID_ESTADO_COLOCACION", :"ID_ENTE_APROBADO' +
        'R", :"ID_EMPLEADO", '
      '   :"NOTA_CONTABLE")')
    RefreshSQL.Strings = (
      'Select '
      '  "col$colocacion"."ID_AGENCIA",'
      '  "col$colocacion"."ID_COLOCACION",'
      '  "col$colocacion"."ID_IDENTIFICACION",'
      '  "col$colocacion"."ID_PERSONA",'
      '  "col$colocacion"."ID_CLASIFICACION",'
      '  "col$colocacion"."ID_LINEA",'
      '  "col$colocacion"."ID_INVERSION",'
      '  "col$colocacion"."ID_RESPALDO",'
      '  "col$colocacion"."ID_GARANTIA",'
      '  "col$colocacion"."ID_CATEGORIA",'
      '  "col$colocacion"."ID_EVALUACION",'
      '  "col$colocacion"."FECHA_DESEMBOLSO",'
      '  "col$colocacion"."VALOR_DESEMBOLSO",'
      '  "col$colocacion"."PLAZO_COLOCACION",'
      '  "col$colocacion"."FECHA_VENCIMIENTO",'
      '  "col$colocacion"."TIPO_INTERES",'
      '  "col$colocacion"."ID_INTERES",'
      '  "col$colocacion"."TASA_INTERES_CORRIENTE",'
      '  "col$colocacion"."TASA_INTERES_MORA",'
      '  "col$colocacion"."PUNTOS_INTERES",'
      '  "col$colocacion"."ID_TIPO_CUOTA",'
      '  "col$colocacion"."AMORTIZA_CAPITAL",'
      '  "col$colocacion"."AMORTIZA_INTERES",'
      '  "col$colocacion"."PERIODO_GRACIA",'
      '  "col$colocacion"."DIAS_PRORROGADOS",'
      '  "col$colocacion"."VALOR_CUOTA",'
      '  "col$colocacion"."ABONOS_CAPITAL",'
      '  "col$colocacion"."FECHA_CAPITAL",'
      '  "col$colocacion"."FECHA_INTERES",'
      '  "col$colocacion"."ID_ESTADO_COLOCACION",'
      '  "col$colocacion"."ID_ENTE_APROBADOR",'
      '  "col$colocacion"."ID_EMPLEADO",'
      '  "col$colocacion"."NOTA_CONTABLE"'
      'from "col$colocacion" '
      'where'
      '  "col$colocacion"."ID_AGENCIA" = :"ID_AGENCIA" and'
      '  "col$colocacion"."ID_COLOCACION" = :"ID_COLOCACION"')
    SelectSQL.Strings = (
      'select * from "col$colocacion" where '
      '"col$colocacion"."ID_AGENCIA" =:"ID_AGENCIA" and'
      '"col$colocacion"."ID_COLOCACION" =:"ID_COLOCACION"')
    ModifySQL.Strings = (
      'update "col$colocacion"'
      'set'
      '  "col$colocacion"."ID_AGENCIA" = :"ID_AGENCIA",'
      '  "col$colocacion"."ID_COLOCACION" = :"ID_COLOCACION",'
      '  "col$colocacion"."ID_IDENTIFICACION" = :"ID_IDENTIFICACION",'
      '  "col$colocacion"."ID_PERSONA" = :"ID_PERSONA",'
      '  "col$colocacion"."ID_CLASIFICACION" = :"ID_CLASIFICACION",'
      '  "col$colocacion"."ID_LINEA" = :"ID_LINEA",'
      '  "col$colocacion"."ID_INVERSION" = :"ID_INVERSION",'
      '  "col$colocacion"."ID_RESPALDO" = :"ID_RESPALDO",'
      '  "col$colocacion"."ID_GARANTIA" = :"ID_GARANTIA",'
      '  "col$colocacion"."ID_CATEGORIA" = :"ID_CATEGORIA",'
      '  "col$colocacion"."ID_EVALUACION" = :"ID_EVALUACION",'
      '  "col$colocacion"."FECHA_DESEMBOLSO" = :"FECHA_DESEMBOLSO",'
      '  "col$colocacion"."VALOR_DESEMBOLSO" = :"VALOR_DESEMBOLSO",'
      '  "col$colocacion"."PLAZO_COLOCACION" = :"PLAZO_COLOCACION",'
      '  "col$colocacion"."FECHA_VENCIMIENTO" = :"FECHA_VENCIMIENTO",'
      '  "col$colocacion"."TIPO_INTERES" = :"TIPO_INTERES",'
      '  "col$colocacion"."ID_INTERES" = :"ID_INTERES",'
      '  "col$colocacion"."TASA_INTERES_CORRIENTE" = '
      ':"TASA_INTERES_CORRIENTE",'
      '  "col$colocacion"."TASA_INTERES_MORA" = :"TASA_INTERES_MORA",'
      '  "col$colocacion"."PUNTOS_INTERES" = :"PUNTOS_INTERES",'
      '  "col$colocacion"."ID_TIPO_CUOTA" = :"ID_TIPO_CUOTA",'
      '  "col$colocacion"."AMORTIZA_CAPITAL" = :"AMORTIZA_CAPITAL",'
      '  "col$colocacion"."AMORTIZA_INTERES" = :"AMORTIZA_INTERES",'
      '  "col$colocacion"."PERIODO_GRACIA" = :"PERIODO_GRACIA",'
      '  "col$colocacion"."DIAS_PRORROGADOS" = :"DIAS_PRORROGADOS",'
      '  "col$colocacion"."VALOR_CUOTA" = :"VALOR_CUOTA",'
      '  "col$colocacion"."ABONOS_CAPITAL" = :"ABONOS_CAPITAL",'
      '  "col$colocacion"."FECHA_CAPITAL" = :"FECHA_CAPITAL",'
      '  "col$colocacion"."FECHA_INTERES" = :"FECHA_INTERES",'
      
        '  "col$colocacion"."ID_ESTADO_COLOCACION" = :"ID_ESTADO_COLOCACI' +
        'ON",'
      '  "col$colocacion"."ID_ENTE_APROBADOR" = :"ID_ENTE_APROBADOR",'
      '  "col$colocacion"."ID_EMPLEADO" = :"ID_EMPLEADO",'
      '  "col$colocacion"."NOTA_CONTABLE" = :"NOTA_CONTABLE"'
      'where'
      '  "col$colocacion"."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      '  "col$colocacion"."ID_COLOCACION" = :"OLD_ID_COLOCACION"')
    Left = 186
    Top = 52
    object IBDScolocacionID_AGENCIA: TSmallintField
      FieldName = 'ID_AGENCIA'
      Origin = '"col$colocacion"."ID_AGENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDScolocacionID_COLOCACION: TIBStringField
      FieldName = 'ID_COLOCACION'
      Origin = '"col$colocacion"."ID_COLOCACION"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 11
    end
  end
  object IBDSpersona: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select ID_IDENTIFICACION, ID_PERSONA, PRIMER_APELLIDO, SEGUNDO_A' +
        'PELLIDO, NOMBRE from "gen$persona" where "gen$persona" ."ID_IDEN' +
        'TIFICACION" = :"ID_IDENTIFICACION" and  "gen$persona" ."ID_PERSO' +
        'NA" = :"ID_PERSONA"')
    Left = 14
    Top = 98
  end
  object IBDStasavariable: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from "col$tasavariables"')
    Left = 86
    Top = 98
  end
  object IBDSenteaprobador: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from "col$enteaprobador"'
      'where'
      
        '  "col$enteaprobador"."ID_ENTE_APROBADOR" = :"OLD_ID_ENTE_APROBA' +
        'DOR"')
    InsertSQL.Strings = (
      'insert into "col$enteaprobador"'
      
        '  ("col$enteaprobador"."ID_ENTE_APROBADOR", "col$enteaprobador".' +
        '"DESCRIPCION_ENTE_APROBADOR")'
      'values'
      '  (:"ID_ENTE_APROBADOR", :"DESCRIPCION_ENTE_APROBADOR")')
    RefreshSQL.Strings = (
      'Select '
      '  "col$enteaprobador"."ID_ENTE_APROBADOR",'
      '  "col$enteaprobador"."DESCRIPCION_ENTE_APROBADOR"'
      'from "col$enteaprobador" '
      'where'
      '  "col$enteaprobador"."ID_ENTE_APROBADOR" = :"ID_ENTE_APROBADOR"')
    SelectSQL.Strings = (
      'select * from "col$enteaprobador"')
    ModifySQL.Strings = (
      'update "col$enteaprobador"'
      'set'
      
        '  "col$enteaprobador"."ID_ENTE_APROBADOR" = :"ID_ENTE_APROBADOR"' +
        ','
      '  "col$enteaprobador"."DESCRIPCION_ENTE_APROBADOR" = '
      ':"DESCRIPCION_ENTE_APROBADOR"'
      'where'
      '  "col$enteaprobador"."ID_ENTE_APROBADOR" = '
      ':"OLD_ID_ENTE_APROBADOR"')
    Left = 152
    Top = 100
  end
  object DStiposid: TDataSource
    AutoEdit = False
    DataSet = IBDStiposid
    Left = 20
    Top = 202
  end
  object IBQuery: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CODIGO,"nombre",DEBITO,CREDITO FROM "col$concol" left joi' +
        'n "con$puc" ON "col$concol"."CODIGO" = "con$puc"."codigo" ')
    Left = 136
    Top = 146
  end
  object DSclasificacion: TDataSource
    AutoEdit = False
    DataSet = IBDSclasificacion
    Left = 20
    Top = 254
  end
  object DSlinea: TDataSource
    DataSet = IBDSlinea
    Left = 82
    Top = 252
  end
  object DSinversion: TDataSource
    DataSet = IBDSinversion
    Left = 128
    Top = 248
  end
  object DSrespaldo: TDataSource
    DataSet = IBDSrespaldo
    Left = 28
    Top = 308
  end
  object DSgarantia: TDataSource
    AutoEdit = False
    DataSet = IBDSgarantia
    Left = 96
    Top = 302
  end
  object DStipocuota: TDataSource
    DataSet = IBDStipocuota
    Left = 152
    Top = 302
  end
  object DStasavariable: TDataSource
    DataSet = IBDStasavariable
    Left = 198
    Top = 298
  end
  object DSenteaprobador: TDataSource
    DataSet = IBDSenteaprobador
    Left = 198
    Top = 248
  end
  object IBDScontable: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into "col$concol"'
      '  ("col$concol"."ID_AGENCIA", "col$concol"."ID_COLOCACION", '
      '"col$concol"."CODIGO", '
      '   "col$concol"."DEBITO", "col$concol"."CREDITO", '
      '"col$concol"."FECHA_Y_HORA")'
      'values'
      
        '  (:"ID_AGENCIA", :"ID_COLOCACION", :"CODIGO", :"DEBITO", :"CRED' +
        'ITO", '
      ':"FECHA_Y_HORA")')
    RefreshSQL.Strings = (
      'Select '
      '  "col$concol"."ID_AGENCIA",'
      '  "col$concol"."ID_COLOCACION",'
      '  "col$concol"."CODIGO",'
      '  "col$concol"."DEBITO",'
      '  "col$concol"."CREDITO",'
      '  "col$concol"."FECHA_Y_HORA"'
      'from "col$concol" '
      'where'
      '  "col$concol"."ID_AGENCIA" = :"ID_AGENCIA" and'
      '  "col$concol"."ID_COLOCACION" = :"ID_COLOCACION"')
    SelectSQL.Strings = (
      'select * from "col$concol" where ID_COLOCACION = '#39'00000000000'#39)
    ModifySQL.Strings = (
      'update "col$concol"'
      'set'
      '  "col$concol"."ID_AGENCIA" = :"ID_AGENCIA",'
      '  "col$concol"."ID_COLOCACION" = :"ID_COLOCACION",'
      '  "col$concol"."CODIGO" = :"CODIGO",'
      '  "col$concol"."DEBITO" = :"DEBITO",'
      '  "col$concol"."CREDITO" = :"CREDITO",'
      '  "col$concol"."FECHA_Y_HORA" = :"FECHA_Y_HORA"'
      'where'
      '  "col$concol"."ID_AGENCIA" = :"OLD_ID_AGENCIA" and'
      '  "col$concol"."ID_COLOCACION" = :"OLD_ID_COLOCACION"')
    Left = 22
    Top = 148
  end
  object IBQuery1: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 146
  end
  object IBSQL: TIBSQL
    Database = dmGeneral.IBDatabase1
    ParamCheck = True
    Transaction = dmGeneral.IBTransaction1
    Left = 224
    Top = 144
  end
  object IBSQLcodigos: TIBSQL
    Database = dmGeneral.IBDatabase1
    ParamCheck = True
    Transaction = dmGeneral.IBTransaction1
    Left = 214
    Top = 192
  end
  object IBDSagencias: TIBDataSet
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from "gen$agencia"')
    Left = 90
    Top = 150
  end
  object DSagencia: TDataSource
    DataSet = IBDSagencias
    Left = 84
    Top = 206
  end
  object IBQueryVarios: TIBQuery
    Database = dmGeneral.IBDatabase1
    Transaction = dmGeneral.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 194
  end
end
