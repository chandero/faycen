object frmExtractoAsociado: TfrmExtractoAsociado
  Left = 106
  Top = 150
  Width = 1100
  Height = 451
  Caption = 'Extracto de Asociado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 584
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Corte Inicial'
    Visible = False
  end
  object Label8: TLabel
    Left = 584
    Top = 32
    Width = 50
    Height = 13
    Caption = 'Corte Final'
    Visible = False
  end
  object Label9: TLabel
    Left = 800
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Inicial'
    Visible = False
  end
  object Label10: TLabel
    Left = 800
    Top = 32
    Width = 22
    Height = 13
    Caption = 'Final'
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = -1
    Width = 573
    Height = 74
    Caption = 'Asociado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label18: TLabel
      Left = 3
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 43
      Width = 44
      Height = 14
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 304
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Periodo'
    end
    object Label16: TLabel
      Left = 416
      Top = 43
      Width = 41
      Height = 13
      Caption = 'Cuenta'
    end
    object EdNumeroIdentificacion: TMemo
      Left = 72
      Top = 12
      Width = 127
      Height = 22
      Alignment = taRightJustify
      MaxLength = 11
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnExit = EdNumeroIdentificacionExit
    end
    object EdNombre: TStaticText
      Left = 50
      Top = 39
      Width = 359
      Height = 21
      AutoSize = False
      BevelEdges = []
      BevelInner = bvLowered
      BorderStyle = sbsSunken
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    object btnBuscar: TBitBtn
      Left = 200
      Top = 12
      Width = 65
      Height = 21
      Caption = 'Buscar ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnBuscarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
        73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
        8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
        9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
        A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
        AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
        BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
        D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
        E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
        F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
        424242424242424242422B39180B42424242424242424242424243443C180B42
        4242424242424242424242444438180B42424242424242424242424244433918
        0A424242424242424242424242444335004201101A114242424242424242453D
        05072F343434291942424242424242221A2D34343437403E0442424242424206
        231C303437404146284242424242421B210F30373A414140310D42424242421F
        20032434373A3A37321342424242421D25030F2D37373737311042424242420D
        2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
        4227312D21252314424242424242424242420E141B1B42424242}
    end
    object btnProcesar: TBitBtn
      Left = 480
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Procesar'
      Enabled = False
      TabOrder = 3
      OnClick = btnProcesarClick
    end
    object CBMeses: TComboBox
      Left = 360
      Top = 11
      Width = 105
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
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
    object edCuenta: TEdit
      Left = 464
      Top = 40
      Width = 89
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 388
    Width = 1092
    Height = 29
    Align = alBottom
    TabOrder = 1
    object CmdCerrar: TBitBtn
      Left = 990
      Top = 2
      Width = 75
      Height = 25
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
    object CmdNuevo: TBitBtn
      Left = 912
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 1
      OnClick = CmdNuevoClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000420B0000420B00000001000000010000CE630000FFD6
        AD00FFE7C600FFEFDE00FFEFE700FFF7EF0042B5F7008CD6F700B5DEF700FF00
        FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
        090909090909090909090900000000000000000000000000000009000B0B0505
        0303030402020101010009000B0B0B050505030303020202010009000B0B0B0B
        0505050303040201010009000B0B0B0B0B0B050503030302010009000B0B0B0B
        0B0B0B0505030402010009000B0B0B0B0B0B0B0B050A0A0A010009000B0B0B0B
        0B0B0B0B0B0A060A010009000B0B0B0B0B0B0B0A0A0A060A0A0A09000B0B0B0B
        0B0B0B0A07080808070A09000B0B0B0B0B0B0B0A0A0A080A0A0A090000000000
        00000000000A080A000009090000000000000000000A0A0A0009090909090909
        0909090909090909090909090909090909090909090909090909}
    end
    object btnPlano: TBitBtn
      Left = 4
      Top = 4
      Width = 81
      Height = 23
      Caption = '&Plano'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPlanoClick
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
    object btnGrafico: TBitBtn
      Left = 89
      Top = 4
      Width = 81
      Height = 23
      Caption = '&Gr'#225'fico'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
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
  object DBGextracto: TDBGrid
    Left = 8
    Top = 80
    Width = 1057
    Height = 217
    DataSource = DSgridextracto
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CBTE'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEPTO'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_COLOCACION'
        Title.Caption = 'CREDITO'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_DESEMBOLSO'
        Title.Caption = 'VALOR'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUOTA_PERIODO'
        Title.Caption = 'CP'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_CUOTAS'
        Title.Caption = 'TC'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_ANTERIOR'
        Title.Caption = 'ANTERIOR'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAGOS'
        Title.Caption = 'MOVS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITAL'
        Title.Caption = 'A PAGAR'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTERES'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEGURO'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO_SIGUIENTE'
        Title.Caption = 'SIGUIENTE'
        Width = 110
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 304
    Width = 1057
    Height = 41
    Caption = 'Cuentas Por Cobrar'
    TabOrder = 3
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 66
      Height = 13
      Caption = 'Saldo Anterior'
    end
    object Label4: TLabel
      Left = 232
      Top = 24
      Width = 51
      Height = 13
      Caption = 'Cargo Mes'
    end
    object Label6: TLabel
      Left = 448
      Top = 24
      Width = 30
      Height = 13
      Caption = 'Pagos'
    end
    object Label5: TLabel
      Left = 664
      Top = 24
      Width = 38
      Height = 13
      Caption = 'A Pagar'
    end
    object EdCXCSaldoAnterior: TJvCurrencyEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 0
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object EdCXCCargoMes: TJvCurrencyEdit
      Left = 312
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 1
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object EdCXCAbonoMes: TJvCurrencyEdit
      Left = 512
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 2
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object EdCXCApagar: TJvCurrencyEdit
      Left = 728
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 3
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
  end
  object edfechacorteini: TDateTimePicker
    Left = 648
    Top = 5
    Width = 105
    Height = 21
    CalAlignment = dtaLeft
    Date = 42440.3687832755
    Time = 42440.3687832755
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    Visible = False
  end
  object edfechacortefin: TDateTimePicker
    Left = 648
    Top = 29
    Width = 105
    Height = 21
    CalAlignment = dtaLeft
    Date = 42440.3687832755
    Time = 42440.3687832755
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
    Visible = False
  end
  object edfechaini: TDateTimePicker
    Left = 840
    Top = 5
    Width = 105
    Height = 21
    CalAlignment = dtaLeft
    Date = 42440.3687832755
    Time = 42440.3687832755
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    Visible = False
  end
  object edfechafin: TDateTimePicker
    Left = 840
    Top = 29
    Width = 105
    Height = 21
    CalAlignment = dtaLeft
    Date = 42440.3687832755
    Time = 42440.3687832755
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
    Visible = False
  end
  object GroupBox3: TGroupBox
    Left = 584
    Top = 0
    Width = 481
    Height = 73
    Caption = 'Informaci'#243'n del Asociado'
    TabOrder = 8
    object Label11: TLabel
      Left = 8
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Direcci'#243'n:'
    end
    object Label12: TLabel
      Left = 8
      Top = 38
      Width = 45
      Height = 13
      Caption = 'Tel'#233'fono:'
    end
    object edDireccion: TEdit
      Left = 61
      Top = 13
      Width = 404
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edTelefono: TEdit
      Left = 61
      Top = 35
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 344
    Width = 1057
    Height = 41
    Caption = 'Otros Valores'
    TabOrder = 9
    object Label13: TLabel
      Left = 8
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Sueldo'
    end
    object Label14: TLabel
      Left = 232
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Almac'#233'n'
    end
    object Label15: TLabel
      Left = 448
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Mercado'
    end
    object edSueldo: TJvCurrencyEdit
      Left = 96
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 0
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edAlmacen: TJvCurrencyEdit
      Left = 312
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 1
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
    object edMercado: TJvCurrencyEdit
      Left = 512
      Top = 16
      Width = 121
      Height = 21
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 2
      HasMaxValue = False
      HasMinValue = False
      ClipBoardCommands = [caCopy]
    end
  end
  object DSasociado: TDataSource
    DataSet = IBQasociado
    Left = 276
    Top = 32
  end
  object IBQasociado: TIBQuery
    SQL.Strings = (
      
        'SELECT m.NUMERO_CUENTA, p.ID_PERSONA, (p.NOMBRE || '#39' '#39' || p.PRIM' +
        'ER_APELLIDO || '#39' '#39' || p.SEGUNDO_APELLIDO) AS NOMBRE_COMPLETO FRO' +
        'M "gen$persona" p'
      'INNER JOIN "cap$maestrotitular" m ON p.ID_PERSONA = m.ID_PERSONA'
      'WHERE m.ID_TIPO_CAPTACION = 1'
      'ORDER BY NOMBRE_COMPLETO ASC')
    Left = 248
    Top = 32
  end
  object CDSextracto: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CSC'
        DataType = ftInteger
      end
      item
        Name = 'CBTE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FECHA'
        DataType = ftDate
      end
      item
        Name = 'CONCEPTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_COLOCACION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALOR_DESEMBOLSO'
        DataType = ftCurrency
      end
      item
        Name = 'CUOTA_PERIODO'
        DataType = ftInteger
      end
      item
        Name = 'TOTAL_CUOTAS'
        DataType = ftInteger
      end
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftCurrency
      end
      item
        Name = 'PAGOS'
        DataType = ftCurrency
      end
      item
        Name = 'CAPITAL'
        DataType = ftCurrency
      end
      item
        Name = 'INTERES'
        DataType = ftCurrency
      end
      item
        Name = 'SEGURO'
        DataType = ftCurrency
      end
      item
        Name = 'SALDO_SIGUIENTE'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'CDSextractoIndex3'
        Fields = 'CSC'
      end>
    IndexName = 'CDSextractoIndex3'
    Params = <>
    StoreDefs = True
    Left = 63
    Top = 136
    Data = {
      DE0100009619E0BD01000000180000000E000000000003000000DE0103435343
      0400010000000000044342544501004900000001000557494454480200020014
      00054645434841040006000000000008434F4E434550544F0100490000000100
      0557494454480200020032000D49445F434F4C4F434143494F4E010049000000
      01000557494454480200020014001056414C4F525F444553454D424F4C534F08
      0004000000010007535542545950450200490006004D6F6E6579000D43554F54
      415F504552494F444F04000100000000000C544F54414C5F43554F5441530400
      0100000000000E53414C444F5F414E544552494F520800040000000100075355
      42545950450200490006004D6F6E657900055041474F53080004000000010007
      535542545950450200490006004D6F6E657900074341504954414C0800040000
      00010007535542545950450200490006004D6F6E65790007494E544552455308
      0004000000010007535542545950450200490006004D6F6E6579000653454755
      524F080004000000010007535542545950450200490006004D6F6E6579000F53
      414C444F5F5349475549454E5445080004000000010007535542545950450200
      490006004D6F6E65790001000D44454641554C545F4F52444552020082000000
      0000}
    object CDSextractoCSC: TIntegerField
      FieldName = 'CSC'
    end
    object CDSextractoCBTE: TStringField
      FieldName = 'CBTE'
    end
    object CDSextractoFECHA: TDateField
      FieldName = 'FECHA'
    end
    object CDSextractoCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 50
    end
    object CDSextractoID_COLOCACION: TStringField
      FieldName = 'ID_COLOCACION'
    end
    object CDSextractoVALOR_DESEMBOLSO: TCurrencyField
      FieldName = 'VALOR_DESEMBOLSO'
    end
    object CDSextractoCUOTA_PERIODO: TIntegerField
      FieldName = 'CUOTA_PERIODO'
    end
    object CDSextractoTOTAL_CUOTAS: TIntegerField
      FieldName = 'TOTAL_CUOTAS'
    end
    object CDSextractoSALDO_ANTERIOR: TCurrencyField
      FieldName = 'SALDO_ANTERIOR'
    end
    object CDSextractoPAGOS: TCurrencyField
      FieldName = 'PAGOS'
    end
    object CDSextractoCAPITAL: TCurrencyField
      FieldName = 'CAPITAL'
    end
    object CDSextractoINTERES: TCurrencyField
      FieldName = 'INTERES'
    end
    object CDSextractoSEGURO: TCurrencyField
      FieldName = 'SEGURO'
    end
    object CDSextractoSALDO_SIGUIENTE: TCurrencyField
      FieldName = 'SALDO_SIGUIENTE'
    end
  end
  object CDSotros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 176
    object CDSotrosCXC: TCurrencyField
      FieldName = 'CXC'
    end
    object CDSotrosCARGOS: TCurrencyField
      FieldName = 'CARGOS'
    end
    object CDSotrosPAGOS: TCurrencyField
      FieldName = 'PAGOS'
    end
    object CDSotrosAPAGAR: TCurrencyField
      FieldName = 'APAGAR'
    end
    object CDSotrosSUELDO: TCurrencyField
      FieldName = 'SUELDO'
    end
    object CDSotrosALMACEN: TCurrencyField
      FieldName = 'ALMACEN'
    end
    object CDSotrosMERCADO: TCurrencyField
      FieldName = 'MERCADO'
    end
  end
  object IBQcartera: TIBQuery
    SQL.Strings = (
      'SELECT '
      '  "c".ID_COLOCACION,'
      '  "c".NOTA_CONTABLE,'
      '  "c".FECHA_DESEMBOLSO,'
      '  "c".VALOR_DESEMBOLSO,'
      '  "c".PLAZO_COLOCACION,'
      '  "c".AMORTIZA_INTERES,'
      '  "d".SALDO AS SALDO_ANTERIOR,'
      '  "d".CAPITAL,'
      '  "d".INTERES,'
      '  "d".DESCUENTO,'
      '  ("d".SALDO - "d".CAPITAL) AS SALDO_SIGUIENTE,'
      '  "d".FECHA_CORTE,'
      '  "l".DESCRIPCION_LINEA,'
      '  "p".DESCRIPCION'
      'FROM'
      ' "col$colocacion" "c"'
      
        ' INNER JOIN GEN$DESCUENTOCARTERA "d" ON ("c".ID_COLOCACION="d".I' +
        'D_COLOCACION)'
      ' INNER JOIN "col$lineas" "l" ON ("c".ID_LINEA="l".ID_LINEA)'
      
        ' LEFT OUTER JOIN GEN$COLOCACIONPROVEEDOR "cp" ON ("c".ID_COLOCAC' +
        'ION="cp".ID_COLOCACION)'
      
        ' LEFT OUTER JOIN GEN$PROVEEDOR "p" ON ("cp".ID_PROVEEDOR="p".ID_' +
        'PROVEEDOR)'
      'WHERE'
      '  ("c".ID_PERSONA = :ID_PERSONA) AND '
      '  ("d".FECHA_CORTE = :FECHA_CORTE) AND'
      ' ("c".ID_ESTADO_COLOCACION IN (0,1,2) )'
      'ORDER BY'
      '  "l".ID_LINEA,'
      '  "c".ID_COLOCACION')
    Left = 216
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_CORTE'
        ParamType = ptUnknown
      end>
  end
  object IBQdeposito: TIBQuery
    SQL.Strings = (
      
        'select m.*, t.DESCRIPCION,t.ID_FORMA from "cap$maestrotitular" m' +
        ' INNER JOIN "cap$tipocaptacion" t ON m.ID_TIPO_CAPTACION = t.ID_' +
        'TIPO_CAPTACION'
      'WHERE m.ID_PERSONA = :ID_PERSONA '
      'ORDER BY m.ID_TIPO_CAPTACION ASC')
    Left = 248
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQmovimiento: TIBQuery
    SQL.Strings = (
      'SELECT '
      't.ABREVIATURA, '
      'm.COMPROBANTE, '
      'm.FECHA, '
      'm.DEBITO,'
      'm.CREDITO '
      'FROM GEN$PERSONAMOVIMIENTO m'
      'INNER JOIN "con$tipocomprobante" t ON t.ID = m.TIPO_COMPROBANTE'
      'WHERE m.ID_PERSONA = :ID_PERSONA and'
      'm.FECHA BETWEEN :FECHA_INICIAL and :FECHA_FINAL and'
      'm.CREDITO > 0')
    Left = 280
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object DSgridextracto: TDataSource
    DataSet = CDSextracto
    Left = 32
    Top = 136
  end
  object IBQdepositosaldomovimiento: TIBQuery
    SQL.Strings = (
      
        'select MOVIMIENTO FROM P_CAP_0010(:"ID_AGENCIA",:"ID_TIPO_CAPTAC' +
        'ION",:"NUMERO_CUENTA",:"DIGITO_CUENTA",:"FECHA_INICIAL" ,:"FECHA' +
        '_FINAL" )')
    Left = 376
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object IBQdepositomovimiento: TIBQuery
    SQL.Strings = (
      'select MOVIMIENTO from P_CAP_0010'
      '('
      ':"ID_AGENCIA",'
      ':"ID_TIPO_CAPTACION",'
      ':"NUMERO_CUENTA",'
      ':"DIGITO_CUENTA",'
      ':"FECHA_INICIAL",'
      ':"FECHA_FINAL"'
      ')')
    Left = 376
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_INICIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA_FINAL'
        ParamType = ptUnknown
      end>
  end
  object IBQdepositosaldoinicial: TIBQuery
    SQL.Strings = (
      
        'SELECT SALDOAHORROS FROM P_CAP_0012(:ID_AGENCIA,:ID_TIPO_CAPTACI' +
        'ON,:NUMERO_CUENTA,:DIGITO_CUENTA,:ANO)')
    Left = 376
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TIPO_CAPTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIGITO_CUENTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ANO'
        ParamType = ptUnknown
      end>
  end
  object IBQcargomes: TIBQuery
    Left = 168
    Top = 248
  end
  object IBQcodigopuc: TIBQuery
    Left = 208
    Top = 248
  end
  object prReport1: TprReport
    Values = <>
    Variables = <>
    PrinterName = 'HP LaserJet p1505'
    PreviewParams.Options = []
    PreviewParams.ShowToolbars = [prptPreviewCommon]
    Left = 96
    Top = 336
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    LOGPIXELSX = 96
    LOGPIXELSY = 96
  end
  object prTxReport1: TprTxReport
    Values = <>
    Variables = <
      item
        Name = 'EMPRESA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'DESCRIPCION_EMPRESA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'TELEFONO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CELULAR'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'ASOCIADO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CUENTA'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'DIRECCION'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'TELASOCIADO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'PERIODO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'ANYO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CXCSALDOANTERIOR'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CXCCARGOMES'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CXCPAGOS'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'CXCAPAGAR'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'SUELDO'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'ALMACEN'
        ValueType = 'prvvtString'
        Value = ''
      end
      item
        Name = 'MERCADO'
        ValueType = 'prvvtString'
        Value = ''
      end>
    Left = 128
    Top = 336
    SystemInfo = (
      'OS: WIN32_NT 5.1.2600 Service Pack 3'
      ''
      'PageSize: 4096'
      'ActiveProcessorMask: $1000'
      'NumberOfProcessors: 1'
      'ProcessorType: 586'
      ''
      'Compiler version: Delphi6'
      'PReport version: 1.9.4')
    object prTxPage1: TprTxPage
      PageType = tptPage
      LineNum = 30
      ColNum = 160
      object prTxHTitleBand1: TprTxHTitleBand
        Height = 8
        UseVerticalBands = False
        object prTxMemoObj1: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[EMPRESA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 80
          dRec.Bottom = 1
          Visible = False
        end
        object prTxCommandObj1: TprTxCommandObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              TxCommands = (
                txc12cpiOn
                txcCondensedOn)
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 1
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj2: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[DESCRIPCION_EMPRESA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 80
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj3: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'TELEFONO: [TELEFONO] - CELULAR: [CELULAR] ')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 80
          dRec.Bottom = 3
          Visible = False
        end
        object prTxMemoObj4: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Direcci'#162'n: [DIRECCION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 4
          dRec.Right = 33
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj5: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Tel:[TELASOCIADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 34
          dRec.Top = 4
          dRec.Right = 51
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj6: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Concepto: [PERIODO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 52
          dRec.Top = 4
          dRec.Right = 74
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj7: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Asociado: [ASOCIADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 0
          dRec.Top = 3
          dRec.Right = 38
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj8: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Cta No.:[CUENTA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 39
          dRec.Top = 3
          dRec.Right = 55
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj9: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'Pag.[Page]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 71
          dRec.Top = 3
          dRec.Right = 80
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj10: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[ANYO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold
                tfoWide)
            end>
          dRec.Left = 75
          dRec.Top = 4
          dRec.Right = 79
          dRec.Bottom = 5
          Visible = False
        end
        object prTxHLineObj1: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              MainChar = '='
            end>
          dRec.Left = 0
          dRec.Top = 5
          dRec.Right = 160
          dRec.Bottom = 6
          Visible = False
        end
        object prTxHLineObj2: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              MainChar = '='
            end>
          dRec.Left = 0
          dRec.Top = 7
          dRec.Right = 160
          dRec.Bottom = 8
          Visible = False
        end
        object prTxMemoObj11: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'NOTA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 6
          dRec.Right = 7
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj12: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'FECHA')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 8
          dRec.Top = 6
          dRec.Right = 18
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj13: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CONCEPTO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 6
          dRec.Right = 45
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj14: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'No.CRE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 46
          dRec.Top = 6
          dRec.Right = 57
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj15: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'VALOR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 58
          dRec.Top = 6
          dRec.Right = 73
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj16: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'C.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 6
          dRec.Right = 76
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj17: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'T.')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 77
          dRec.Top = 6
          dRec.Right = 79
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj18: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'S.ANTERIOR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 80
          dRec.Top = 6
          dRec.Right = 95
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj19: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MOVIMI.MES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 6
          dRec.Right = 110
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj20: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'A PAGAR')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 111
          dRec.Top = 6
          dRec.Right = 122
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj21: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'INTERES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 6
          dRec.Right = 134
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj22: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SEGURO')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 135
          dRec.Top = 6
          dRec.Right = 144
          dRec.Bottom = 7
          Visible = False
        end
        object prTxMemoObj23: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'S.SIGUIENTE')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 145
          dRec.Top = 6
          dRec.Right = 160
          dRec.Bottom = 7
          Visible = False
        end
      end
      object prTxHDetailBand1: TprTxHDetailBand
        Height = 1
        UseVerticalBands = False
        DataSetName = 'CDSextracto'
        ColCount = 0
        ColDirection = prcdTopBottomLeftRight
        object prTxMemoObj24: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<0000>CDSextracto.CBTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 7
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj25: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<YYYY/MM/DD>CDSextracto.FECHA]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 8
          dRec.Top = 0
          dRec.Right = 18
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj26: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSextracto.CONCEPTO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 19
          dRec.Top = 0
          dRec.Right = 45
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj27: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSextracto.ID_COLOCACION]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 46
          dRec.Top = 0
          dRec.Right = 57
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj28: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.VALOR_DESEMBOLSO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 58
          dRec.Top = 0
          dRec.Right = 73
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj29: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSextracto.CUOTA_PERIODO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 74
          dRec.Top = 0
          dRec.Right = 76
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj30: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[CDSextracto.TOTAL_CUOTAS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhCenter
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 77
          dRec.Top = 0
          dRec.Right = 79
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj31: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.SALDO_ANTERIOR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 80
          dRec.Top = 0
          dRec.Right = 95
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj32: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.PAGOS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 96
          dRec.Top = 0
          dRec.Right = 110
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj33: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.CAPITAL]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 111
          dRec.Top = 0
          dRec.Right = 122
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj34: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.SEGURO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 135
          dRec.Top = 0
          dRec.Right = 144
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj35: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.SALDO_SIGUIENTE]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 145
          dRec.Top = 0
          dRec.Right = 160
          dRec.Bottom = 1
          Visible = False
        end
        object prTxMemoObj36: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CDSextracto.INTERES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 123
          dRec.Top = 0
          dRec.Right = 134
          dRec.Bottom = 1
          Visible = False
        end
      end
      object prTxHSummaryBand1: TprTxHSummaryBand
        Height = 6
        UseVerticalBands = False
        object prTxHLineObj3: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 0
          dRec.Right = 160
          dRec.Bottom = 1
          Visible = False
        end
        object prTxHLineObj4: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 2
          dRec.Right = 160
          dRec.Bottom = 3
          Visible = False
        end
        object prTxHLineObj5: TprTxHLineObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
            end>
          dRec.Left = 0
          dRec.Top = 4
          dRec.Right = 160
          dRec.Bottom = 5
          Visible = False
        end
        object prTxMemoObj37: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CTAS X COBRAR:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 1
          dRec.Right = 14
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj38: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SALDO ANT:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 15
          dRec.Top = 1
          dRec.Right = 25
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj39: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CXCSALDOANTERIOR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 25
          dRec.Top = 1
          dRec.Right = 40
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj40: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CARGOS:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 42
          dRec.Top = 1
          dRec.Right = 49
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj41: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CXCCARGOMES]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 49
          dRec.Top = 1
          dRec.Right = 64
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj42: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'PAGOS:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 65
          dRec.Top = 1
          dRec.Right = 71
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj43: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CXCPAGOS]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 71
          dRec.Top = 1
          dRec.Right = 86
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj44: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'A PAGAR:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 87
          dRec.Top = 1
          dRec.Right = 95
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj45: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>CXCAPAGAR]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 95
          dRec.Top = 1
          dRec.Right = 110
          dRec.Bottom = 2
          Visible = False
        end
        object prTxMemoObj46: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'SUELDO:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 0
          dRec.Top = 3
          dRec.Right = 9
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj47: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>SUELDO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 9
          dRec.Top = 3
          dRec.Right = 24
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj48: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'CUPOS:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 28
          dRec.Top = 3
          dRec.Right = 35
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj49: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'ALMACEN:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 36
          dRec.Top = 3
          dRec.Right = 44
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj50: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>ALMACEN]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 44
          dRec.Top = 3
          dRec.Right = 59
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj51: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'MERCADO:')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 61
          dRec.Top = 3
          dRec.Right = 69
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj52: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                '[:<#,##0;(#,##0)>MERCADO]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhRight
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 69
          dRec.Top = 3
          dRec.Right = 84
          dRec.Bottom = 4
          Visible = False
        end
        object prTxMemoObj53: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                
                  'POR FAVOR CONTROLE QUE SU CUPO DISPONIBLE NO SEA NEGATIVO, EVITE' +
                  'SE SANCIONES')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
              TxFontOptionsEx = (
                tfoBold)
            end>
          dRec.Left = 0
          dRec.Top = 5
          dRec.Right = 76
          dRec.Bottom = 6
          Visible = False
        end
        object prTxMemoObj54: TprTxMemoObj
          dRec.DefVersion = 0
          dRec.Versions = <
            item
              Visible = True
              Memo.Strings = (
                'F.I[:<YYYY/MM/DD HH:MM:SS>StartDateTime]')
              DeleteEmptyLinesAtEnd = False
              DeleteEmptyLines = False
              CanResizeX = False
              CanResizeY = False
              hAlign = prhLeft
              vAlign = prvTop
              DefaultFont = False
              WordWrap = False
            end>
          dRec.Left = 115
          dRec.Top = 5
          dRec.Right = 140
          dRec.Bottom = 6
          Visible = False
        end
      end
    end
  end
  object IBQgenminimos: TIBQuery
    Left = 200
    Top = 168
  end
  object IBQproceso: TIBQuery
    Left = 304
    Top = 248
  end
  object IBQrevalorizacion: TIBQuery
    SQL.Strings = (
      
        'select m.*, t.DESCRIPCION,t.ID_FORMA from "cap$maestrotitular" m' +
        ' INNER JOIN "cap$tipocaptacion" t ON m.ID_TIPO_CAPTACION = t.ID_' +
        'TIPO_CAPTACION'
      'WHERE m.ID_PERSONA = :ID_PERSONA and t.ID_TIPO_CAPTACION  = 1'
      'ORDER BY m.ID_TIPO_CAPTACION ASC')
    Left = 264
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PERSONA'
        ParamType = ptUnknown
      end>
  end
  object IBQrevalorizacionmov: TIBQuery
    Left = 264
    Top = 152
  end
  object IBExtract1: TIBExtract
    Left = 536
    Top = 208
  end
end