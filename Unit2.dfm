object Form2: TForm2
  Left = 274
  Top = 138
  Caption = 'Domer_Daily_Audit'
  ClientHeight = 377
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 676
    DesignSize = (
      730
      73)
    object DBText1: TDBText
      Left = 53
      Top = 9
      Width = 33
      Height = 17
      Alignment = taRightJustify
      DataField = 'TERMINAL_ID'
      DataSource = DM.s_tender05
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 95
      Top = 9
      Width = 29
      Height = 13
      AutoSize = True
      DataField = 'TERMINAL_NAME'
      DataSource = DM.s_tender05
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Terminal:'
    end
    object DBText3: TDBText
      Left = 669
      Top = 9
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = True
      DataField = 'INCOME_DATE'
      DataSource = DM.s_tender05
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 602
    end
    object DBGrid0: TDBGrid
      Left = 1
      Top = 32
      Width = 728
      Height = 40
      TabStop = False
      Align = alBottom
      Color = clWhite
      DataSource = DM.s_tender05
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGrid0CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ODYSSEY_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Odyssey Adds'
          Width = 64
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOMER_JE_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Via Jnl Entry'
          Width = 80
          Visible = True
        end
        item
          Color = clSkyBlue
          Expanded = False
          FieldName = 'DOMER_CASH_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Domer $ Cash'
          Width = 80
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'WEB_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Web Domer $'
          Width = 80
          Visible = True
        end
        item
          Color = clCream
          Expanded = False
          FieldName = 'MICROS_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Micros'
          Width = 80
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'MISC_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Misc'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POS_ADDS'
          Title.Alignment = taCenter
          Title.Caption = 'Total POS'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OVER_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'O/S'
          Width = 80
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 536
      Top = 3
      Width = 99
      Height = 25
      Action = SwipesCSV
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 730
    Height = 304
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 676
    object TabSheet1: TTabSheet
      Caption = 'Odyssey Adds'
      TabVisible = False
      ExplicitWidth = 668
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 275
        TabStop = False
        Align = alClient
        Color = clWhite
        DataSource = DM.s_t_swipes
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Transaction_Amount'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$Amount'
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Process_Date_Time'
            Title.Alignment = taCenter
            Title.Caption = 'Date/Time'
            Width = 148
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_Number'
            Title.Alignment = taCenter
            Title.Caption = 'ID Number'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Plan_ID'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Function_ID'
            Title.Alignment = taCenter
            Title.Caption = 'Func'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Function_Name'
            Title.Alignment = taCenter
            Title.Caption = 'Function Name'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Previous_Balance'
            Title.Alignment = taCenter
            Title.Caption = 'Prior Balance'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Resulting_Balance'
            Title.Alignment = taCenter
            Title.Caption = 'End Balance'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Alternate_ID_Number'
            Title.Caption = 'NetID'
            Width = 64
            Visible = True
          end>
      end
      object sb1: TStatusBar
        Left = 0
        Top = 275
        Width = 722
        Height = 19
        Panels = <>
        SimplePanel = True
        ExplicitWidth = 668
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' Via  Jnl  Entry '
      ImageIndex = 1
      TabVisible = False
      ExplicitWidth = 668
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 275
        TabStop = False
        Align = alClient
        Color = clInfoBk
        DataSource = DM.s_t_Domer_JE
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DJ_ID'
            Title.Alignment = taCenter
            Title.Caption = 'ID Number'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_NET_AMOUNT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Amount'
            Width = 81
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DJ_STAMP'
            Title.Alignment = taCenter
            Title.Caption = 'Date/Time'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DJ_CARD'
            Title.Alignment = taCenter
            Title.Caption = 'Card Number'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_DESC'
            Title.Caption = 'Description'
            Width = 111
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DJ_USER'
            Title.Alignment = taCenter
            Title.Caption = 'User'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DJ_PROG_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Program'
            Width = 120
            Visible = True
          end>
      end
      object sb2: TStatusBar
        Left = 0
        Top = 275
        Width = 722
        Height = 19
        Panels = <>
        SimplePanel = True
        ExplicitWidth = 668
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Domer $ Cash '
      ImageIndex = 2
      TabVisible = False
      ExplicitWidth = 668
      object sb3: TStatusBar
        Left = 0
        Top = 275
        Width = 722
        Height = 19
        Panels = <>
        SimplePanel = True
        ExplicitWidth = 668
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 275
        TabStop = False
        Align = alClient
        Color = clSkyBlue
        DataSource = DM.s_t_Domer_Cash
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_ID'
            Title.Alignment = taCenter
            Title.Caption = 'ID Number'
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_CARD'
            Title.Alignment = taCenter
            Title.Caption = 'Card Number'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DC_NET_AMOUNT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Trans Amount'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_NETID'
            Title.Alignment = taCenter
            Title.Caption = 'Net ID'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_USER'
            Title.Alignment = taCenter
            Title.Caption = 'User'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_STAMP'
            Title.Alignment = taCenter
            Title.Caption = 'Date/Time'
            Width = 108
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_PATRON'
            Title.Alignment = taCenter
            Title.Caption = 'Patron'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DC_TYPE'
            Title.Alignment = taCenter
            Title.Caption = 'Type'
            Width = 39
            Visible = True
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Web Domer $ '
      ImageIndex = 3
      TabVisible = False
      ExplicitWidth = 668
      object sb4: TStatusBar
        Left = 0
        Top = 275
        Width = 722
        Height = 19
        Panels = <>
        SimplePanel = True
        ExplicitWidth = 668
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 275
        TabStop = False
        Align = alClient
        Color = clMoneyGreen
        DataSource = DM.s_t_Domer_Web
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TRANSACTION_DATETIME'
            Title.Alignment = taCenter
            Title.Caption = 'Date/Time'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDID'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NETID'
            Title.Alignment = taCenter
            Title.Caption = 'Net ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AMOUNT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Tran Amount'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRANSACTION_ID'
            Title.Caption = 'Tran ID'
            Width = 262
            Visible = True
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Micros GC Adds'
      ImageIndex = 4
      TabVisible = False
      ExplicitWidth = 668
      object DBGrid5: TDBGrid
        Left = 0
        Top = 0
        Width = 722
        Height = 275
        TabStop = False
        Align = alClient
        Color = clCream
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object sb5: TStatusBar
        Left = 0
        Top = 275
        Width = 722
        Height = 19
        Panels = <>
        SimplePanel = True
        ExplicitWidth = 668
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 452
    Top = 167
    object SwipesCSV: TAction
      Caption = 'SwipesCSV'
      ImageIndex = 1
      OnExecute = SwipesCSVExecute
    end
  end
  object ImageList1: TImageList
    Left = 608
    Top = 176
    Bitmap = {
      494C0101030004005C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000007F7F7F0000000000000000000000
      FF000000FF000000FF00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000FFFF0000FFFF00000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000000000000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC1FFFFFFFFF0000F007000001620000
      E0030000FFE30000C0010000FE63000080010000FC03000081F00000F8030000
      03F80000F003000007FD0000F003000007FF0000E003000007FF0000C0030000
      07FF00008003000087FF00000003000083FF000000030000C1FF000001E30000
      E0FFFFFF83F70000F9FFFFFFC7F7000000000000000000000000000000000000
      000000000000}
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV|*.csv'
    Left = 224
    Top = 184
  end
end
