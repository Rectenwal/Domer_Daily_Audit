object DM: TDM
  OldCreateOrder = False
  Height = 469
  Width = 968
  object s_T05_max: TDataSource
    DataSet = T05_max
    Left = 256
    Top = 152
  end
  object s_calendar: TDataSource
    DataSet = calendar
    Left = 168
    Top = 136
  end
  object s_dates: TDataSource
    DataSet = dates
    Left = 168
    Top = 256
  end
  object s_tender05: TDataSource
    DataSet = tender05
    Left = 152
    Top = 384
  end
  object calendar: TADOQuery
    Active = True
    Connection = DB_Oracle
    CursorType = ctStatic
    AfterScroll = calendarAfterScroll
    Parameters = <
      item
        Name = 'term1'
        DataType = ftInteger
        Direction = pdInputOutput
        Size = 6
        Value = 0
      end
      item
        Name = 'term2'
        DataType = ftInteger
        Direction = pdInputOutput
        Size = 6
        Value = 999999
      end>
    SQL.Strings = (
      'SELECT distinct c.FS_YEAR,'
      '       c.FS_MONTH,'
      '       c.DESCRIPTION,'
      '       c.MONTH_START_DATE,'
      '       c.MONTH_END_DATE,'
      '       c.CURRENT_MONTH,'
      '       SUM (t05.OVER_SHORT) as OVER_SHORT'
      '  FROM CALENDAR c, TENDER05 t05'
      ' WHERE     (c.FS_YEAR >= 2007)'
      
        '       AND (t05.INCOME_DATE BETWEEN c.MONTH_START_DATE AND c.MON' +
        'TH_END_DATE)'
      '       AND (t05.TERMINAL_ID BETWEEN :term1 AND :term2)'
      'GROUP BY c.FS_YEAR,'
      '         c.FS_MONTH,'
      '         c.DESCRIPTION,'
      '         c.MONTH_START_DATE,'
      '         c.MONTH_END_DATE,'
      '         c.CURRENT_MONTH'
      'ORDER BY c.FS_YEAR ASC, c.FS_MONTH ASC')
    Left = 184
    Top = 80
    object calendarFS_YEAR: TIntegerField
      FieldName = 'FS_YEAR'
    end
    object calendarFS_MONTH: TIntegerField
      FieldName = 'FS_MONTH'
    end
    object calendarDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 64
    end
    object calendarMONTH_START_DATE: TDateTimeField
      DisplayWidth = 1
      FieldName = 'MONTH_START_DATE'
    end
    object calendarMONTH_END_DATE: TDateTimeField
      DisplayWidth = 1
      FieldName = 'MONTH_END_DATE'
    end
    object calendarCURRENT_MONTH: TStringField
      FieldName = 'CURRENT_MONTH'
      Size = 1
    end
    object calendarOVER_SHORT: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'OVER_SHORT'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 0
    end
  end
  object DB_Oracle: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=accting;Persist Security Info=True;U' +
      'ser ID=pos;Data Source=NDFSDB'
    LoginPrompt = False
    Left = 192
    Top = 24
  end
  object dates: TADOQuery
    Active = True
    Connection = DB_Oracle
    CursorType = ctStatic
    DataSource = s_calendar
    Parameters = <
      item
        Name = 'month_start_date'
        DataType = ftDateTime
        Value = 39067d
      end
      item
        Name = 'month_end_date'
        DataType = ftDateTime
        Value = 39101d
      end
      item
        Name = 'term1'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'term2'
        DataType = ftInteger
        Size = -1
        Value = 999999
      end>
    SQL.Strings = (
      'select'
      'distinct income_date,'
      'sum(odyssey_adds) as odyssey_adds,'
      'sum(pos_adds) as pos_adds,'
      'sum(over_short) as over_short'
      'from tender05'
      'where'
      'income_date between :month_start_date and :month_end_date'
      'and'
      'Terminal_ID between :term1 and :term2'
      'group by income_date'
      'order by income_date')
    Left = 168
    Top = 200
    object datesINCOME_DATE: TDateTimeField
      DisplayWidth = 1
      FieldName = 'INCOME_DATE'
    end
    object datesODYSSEY_ADDS: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'ODYSSEY_ADDS'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 0
    end
    object datesPOS_ADDS: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'POS_ADDS'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 0
    end
    object datesOVER_SHORT: TFMTBCDField
      DisplayWidth = 1
      FieldName = 'OVER_SHORT'
      ReadOnly = True
      currency = True
      Precision = 38
      Size = 0
    end
  end
  object tender05: TADOQuery
    Active = True
    Connection = DB_Oracle
    CursorType = ctStatic
    OnCalcFields = tender05CalcFields
    DataSource = s_dates
    Parameters = <
      item
        Name = 'INCOME_DATE'
        DataType = ftDateTime
        Value = 39082d
      end
      item
        Name = 'term1'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'term2'
        DataType = ftInteger
        Size = -1
        Value = 999999
      end>
    SQL.Strings = (
      'select T.*'
      'from tender05 T'
      'where'
      'T.INCOME_DATE=:INCOME_DATE'
      'and'
      'Terminal_ID between :term1 and :term2'
      'order by T.terminal_id')
    Left = 160
    Top = 328
    object tender05INCOME_DATE: TDateTimeField
      DisplayWidth = 1
      FieldName = 'INCOME_DATE'
    end
    object tender05TERMINAL_ID: TIntegerField
      DisplayWidth = 1
      FieldName = 'TERMINAL_ID'
    end
    object tender05TERMINAL_NAME: TStringField
      DisplayWidth = 1
      FieldName = 'TERMINAL_NAME'
      Size = 32
    end
    object tender05ODYSSEY_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'ODYSSEY_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05MICROS_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'MICROS_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05DOMER_JE_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'DOMER_JE_ADDS'
      currency = True
      Precision = 14
      Size = 2
    end
    object tender05DOMER_CASH_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'DOMER_CASH_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05WEB_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'WEB_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05POS_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'POS_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05OVER_SHORT: TBCDField
      DisplayWidth = 1
      FieldName = 'OVER_SHORT'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05MISC_ADDS: TBCDField
      DisplayWidth = 1
      FieldName = 'MISC_ADDS'
      currency = True
      Precision = 12
      Size = 2
    end
    object tender05NOTES: TStringField
      DisplayWidth = 1
      FieldName = 'NOTES'
      Size = 255
    end
    object tender05Note: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Note'
      Calculated = True
    end
  end
  object T05_max: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(income_date) as max_date from tender05')
    Left = 264
    Top = 88
  end
  object web_deposit: TADOQuery
    Connection = DB_Oracle
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      'select'
      'distinct'
      'TERMINAL_NUMBER,SUM(AMOUNT) AS TOTAL_AMOUNT'
      'from CSO.deposit_log'
      'where'
      'TRANSACTION_DATETIME>:dttm1 and TRANSACTION_DATETIME<=:dttm2'
      'group by TERMINAL_NUMBER'
      'order by TERMINAL_NUMBER'
      '')
    Left = 256
    Top = 208
  end
  object domer_cash: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      
        'select distinct dc_terminal,sum(dc_net_amount) as total_amount f' +
        'rom'
      'domer_adds_cash'
      'where'
      'dc_stamp>:dttm1 and dc_stamp<=:dttm2'
      'group by dc_terminal'
      'order by dc_terminal')
    Left = 248
    Top = 272
  end
  object domer_JE: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      
        'select distinct dj_terminal,sum(dj_net_amount) as total_amount f' +
        'rom'
      'domer_adds_je'
      'where'
      'dj_stamp between :dttm1 and :dttm2'
      'group by dj_terminal'
      'order by dj_terminal')
    Left = 248
    Top = 328
  end
  object del_T05: TADOQuery
    Connection = DB_Oracle
    Parameters = <
      item
        Name = 'del_date'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      'delete tender05 where INCOME_DATE=:del_date')
    Left = 328
    Top = 96
  end
  object T05: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dt'
        DataType = ftDateTime
        Size = -1
        Value = 40847d
      end>
    SQL.Strings = (
      'select * from tender05'
      'where income_date = :dt'
      'order by income_date,TERMINAL_ID')
    Left = 264
    Top = 24
  end
  object DB_Odyssey: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=7j2e49;Persist Security Info=True;Us' +
      'er ID=legacy_raw_tables;Data Source=Odyssey'
    LoginPrompt = False
    Left = 576
    Top = 24
  end
  object swipes: TADOQuery
    Connection = DB_Odyssey
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dttm1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 32767
        Value = '12:00:00 AM'
      end
      item
        Name = 'dttm2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 32767
        Value = '12:00:00 AM'
      end>
    SQL.Strings = (
      'select distinct'
      
        'S.Terminal_ID,T.Terminal,S.Function_ID,sum(S.Transaction_Amount)' +
        ' as Transaction_Amount'
      ''
      'from'
      'av_pcs_rpt_TransactionListing S'
      ',av_pcs_rpt_TerminalListSummary T'
      'where'
      '   (S.Process_Date_Time>:dttm1)'
      'and'
      '    (S.Process_Date_Time<=:dttm2)'
      '/*'
      'and'
      '    (S.Terminal_ID<500)'
      '*/'
      'and'
      '    ((S.Function_ID=1) or (S.Function_ID=10))'
      'and'
      '    (S.Tender_ID=3)'
      ''
      'and'
      '    (S.Terminal_ID = T.Terminal_ID)'
      ''
      'group by S.Terminal_ID,T.Terminal,S.Function_ID'
      'order by S.Terminal_ID,T.Terminal,S.Function_ID')
    Left = 872
    Top = 232
    object swipesTerminal_ID: TSmallintField
      FieldName = 'Terminal_ID'
      ReadOnly = True
    end
    object swipesTerminal: TStringField
      FieldName = 'Terminal'
      ReadOnly = True
      Size = 250
    end
    object swipesFunction_ID: TSmallintField
      FieldName = 'Function_ID'
      ReadOnly = True
    end
    object swipesTransaction_Amount: TBCDField
      FieldName = 'Transaction_Amount'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object term_list: TADOQuery
    Connection = DB_Odyssey
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Terminal_ID,Terminal from'
      'av_pcs_rpt_TerminalListSummary'
      'order by Terminal_ID'
      ' ')
    Left = 864
    Top = 296
  end
  object s_t_swipes: TDataSource
    DataSet = t_swipes
    Left = 768
    Top = 152
  end
  object t_swipes: TADOQuery
    Connection = DB_Odyssey
    CursorType = ctStatic
    AfterScroll = t_swipesAfterScroll
    Parameters = <
      item
        Name = 'term'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 32767
        Value = Null
      end
      item
        Name = 'dttm1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 32767
        Value = Null
      end
      item
        Name = 'dttm2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 32767
        Value = Null
      end>
    SQL.Strings = (
      
        'select P.Alternate_ID_Number,P.First_Name,P.Middle_Name,P.Last_N' +
        'ame,T.* from av_pcs_rpt_TransactionListing T'
      'left outer join  CSDp_Patron P on T.ID_Number = P.ID_Number'
      'where ((Function_ID=1) or (Function_ID=10)) and(Tender_ID=3)'
      
        'and (Terminal_ID=:term) and Process_Date_Time between :dttm1 and' +
        ' :dttm2'
      'order by Process_Date_Time'
      '')
    Left = 688
    Top = 96
    object t_swipesTerminal: TStringField
      FieldName = 'Terminal'
      ReadOnly = True
      Size = 250
    end
    object t_swipesTerminal_ID: TSmallintField
      FieldName = 'Terminal_ID'
      ReadOnly = True
    end
    object t_swipesTransaction_Number: TIntegerField
      FieldName = 'Transaction_Number'
      ReadOnly = True
    end
    object t_swipesTransaction_Sequence: TSmallintField
      FieldName = 'Transaction_Sequence'
      ReadOnly = True
    end
    object t_swipesDate_Time: TDateTimeField
      FieldName = 'Date_Time'
      ReadOnly = True
    end
    object t_swipesSource: TStringField
      FieldName = 'Source'
      ReadOnly = True
      Size = 250
    end
    object t_swipesSource_Code: TStringField
      FieldName = 'Source_Code'
      ReadOnly = True
      Size = 250
    end
    object t_swipesID_Number: TStringField
      FieldName = 'ID_Number'
      ReadOnly = True
      Size = 250
    end
    object t_swipesCard_Number: TStringField
      FieldName = 'Card_Number'
      ReadOnly = True
      Size = 250
    end
    object t_swipesPlan_ID: TSmallintField
      FieldName = 'Plan_ID'
      ReadOnly = True
    end
    object t_swipesTender_Name: TStringField
      FieldName = 'Tender_Name'
      ReadOnly = True
      Size = 250
    end
    object t_swipesTender_Abbreviation: TStringField
      FieldName = 'Tender_Abbreviation'
      ReadOnly = True
      Size = 250
    end
    object t_swipesTender_ID: TSmallintField
      FieldName = 'Tender_ID'
      ReadOnly = True
    end
    object t_swipesFunction_Name: TStringField
      FieldName = 'Function_Name'
      ReadOnly = True
      Size = 250
    end
    object t_swipesFunction_ID: TSmallintField
      FieldName = 'Function_ID'
      ReadOnly = True
    end
    object t_swipesResulting_Balance: TBCDField
      FieldName = 'Resulting_Balance'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesProcess_Date_Time: TDateTimeField
      FieldName = 'Process_Date_Time'
      ReadOnly = True
    end
    object t_swipesPrevious_Balance: TBCDField
      FieldName = 'Previous_Balance'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesTransaction_Amount: TBCDField
      FieldName = 'Transaction_Amount'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesEntryMode: TStringField
      FieldName = 'EntryMode'
      ReadOnly = True
      Size = 250
    end
    object t_swipesEntryMode_Code: TStringField
      FieldName = 'EntryMode_Code'
      ReadOnly = True
      Size = 250
    end
    object t_swipesService_Category_ID: TSmallintField
      FieldName = 'Service_Category_ID'
      ReadOnly = True
    end
    object t_swipesPeriod_Number: TSmallintField
      FieldName = 'Period_Number'
      ReadOnly = True
    end
    object t_swipesCharge_Code: TStringField
      FieldName = 'Charge_Code'
      ReadOnly = True
      Size = 250
    end
    object t_swipesNon_Taxable_Amount: TBCDField
      FieldName = 'Non_Taxable_Amount'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesTaxable_Amount: TBCDField
      FieldName = 'Taxable_Amount'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesTax_Amount: TBCDField
      FieldName = 'Tax_Amount'
      ReadOnly = True
      currency = True
      Precision = 10
      Size = 2
    end
    object t_swipesFunction_SK_FK: TIntegerField
      FieldName = 'Function_SK_FK'
      ReadOnly = True
    end
    object t_swipesPatron_SK_FK: TIntegerField
      FieldName = 'Patron_SK_FK'
      ReadOnly = True
    end
    object t_swipesPlan_SK_FK: TIntegerField
      FieldName = 'Plan_SK_FK'
      ReadOnly = True
    end
    object t_swipesTender_SK_FK: TIntegerField
      FieldName = 'Tender_SK_FK'
      ReadOnly = True
    end
    object t_swipesTerminal_SK_FK: TIntegerField
      FieldName = 'Terminal_SK_FK'
      ReadOnly = True
    end
    object t_swipesTransactionEntryMode_SK_FK: TIntegerField
      FieldName = 'TransactionEntryMode_SK_FK'
      ReadOnly = True
    end
    object t_swipesTransactionSource_SK_FK: TIntegerField
      FieldName = 'TransactionSource_SK_FK'
      ReadOnly = True
    end
    object t_swipesAlternate_ID_Number: TStringField
      FieldName = 'Alternate_ID_Number'
      Size = 250
    end
    object t_swipesFirst_Name: TStringField
      FieldName = 'First_Name'
      Size = 250
    end
    object t_swipesMiddle_Name: TStringField
      FieldName = 'Middle_Name'
      Size = 250
    end
    object t_swipesLast_Name: TStringField
      FieldName = 'Last_Name'
      Size = 250
    end
  end
  object sPatron: TDataSource
    DataSet = patron
    Left = 856
    Top = 144
  end
  object patron: TADOQuery
    Connection = DB_Odyssey
    CursorType = ctStatic
    DataSource = s_t_swipes
    Parameters = <
      item
        Name = 'Patron_SK_FK'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 255
        Size = 32767
        Value = 0
      end>
    SQL.Strings = (
      'select * from av_pcs_rpt_Patron'
      'where'
      'Patron_SK = :Patron_SK_FK')
    Left = 856
    Top = 96
    object patronPlan: TStringField
      FieldName = 'Plan'
      Size = 250
    end
    object patronPlan_ID: TSmallintField
      FieldName = 'Plan_ID'
    end
    object patronPlan_Name: TStringField
      FieldName = 'Plan_Name'
      Size = 250
    end
    object patronFirst_Name: TStringField
      FieldName = 'First_Name'
      Size = 250
    end
    object patronMiddle_Name: TStringField
      FieldName = 'Middle_Name'
      Size = 250
    end
    object patronLast_Name: TStringField
      FieldName = 'Last_Name'
      Size = 250
    end
    object patronID_Number: TStringField
      FieldName = 'ID_Number'
      Size = 250
    end
    object patronCard_Number: TStringField
      FieldName = 'Card_Number'
      Size = 250
    end
    object patronBuilding_ID: TStringField
      FieldName = 'Building_ID'
      ReadOnly = True
      Size = 1
    end
    object patronBuilding_Name: TStringField
      FieldName = 'Building_Name'
      ReadOnly = True
      Size = 1
    end
    object patronPlan_SK_FK: TIntegerField
      FieldName = 'Plan_SK_FK'
    end
    object patronPatron_SK: TAutoIncField
      FieldName = 'Patron_SK'
      ReadOnly = True
    end
  end
  object s_t_Domer_JE: TDataSource
    DataSet = t_Domer_JE
    Left = 456
    Top = 256
  end
  object t_Domer_JE: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    DataSource = s_tender05
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Size = -1
        Value = 40858d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Size = -1
        Value = 40877d
      end
      item
        Name = 'terminal_id'
        DataType = ftInteger
        Value = 0
      end>
    SQL.Strings = (
      'select * from'
      'domer_adds_je'
      'where'
      'dj_stamp between :dttm1 and :dttm2'
      'and dj_terminal=:terminal_id'
      'order by dj_stamp')
    Left = 360
    Top = 264
    object t_Domer_JEDJ_CONTROL: TBCDField
      FieldName = 'DJ_CONTROL'
      Precision = 10
      Size = 0
    end
    object t_Domer_JEDJ_UNIQUE: TBCDField
      FieldName = 'DJ_UNIQUE'
      Precision = 10
      Size = 0
    end
    object t_Domer_JEDJ_ID: TStringField
      FieldName = 'DJ_ID'
      Size = 9
    end
    object t_Domer_JEDJ_CARD: TStringField
      FieldName = 'DJ_CARD'
      Size = 10
    end
    object t_Domer_JEDJ_NETID: TStringField
      FieldName = 'DJ_NETID'
      Size = 10
    end
    object t_Domer_JEDJ_DESC: TStringField
      FieldName = 'DJ_DESC'
      Size = 32
    end
    object t_Domer_JEDJ_USER: TStringField
      FieldName = 'DJ_USER'
      Size = 10
    end
    object t_Domer_JEDJ_STAMP: TDateTimeField
      FieldName = 'DJ_STAMP'
    end
    object t_Domer_JEDJ_AMOUNT: TBCDField
      FieldName = 'DJ_AMOUNT'
      currency = True
      Precision = 10
      Size = 2
    end
    object t_Domer_JEDJ_PATRON: TStringField
      FieldName = 'DJ_PATRON'
      Size = 10
    end
    object t_Domer_JEDJ_STATUS: TStringField
      FieldName = 'DJ_STATUS'
      Size = 10
    end
    object t_Domer_JEDJ_ADD_OR_DEL: TStringField
      FieldName = 'DJ_ADD_OR_DEL'
      Size = 1
    end
    object t_Domer_JEDJ_NET_AMOUNT: TBCDField
      FieldName = 'DJ_NET_AMOUNT'
      currency = True
      Precision = 12
      Size = 2
    end
    object t_Domer_JEDJ_PROG_NAME: TStringField
      FieldName = 'DJ_PROG_NAME'
      Size = 24
    end
    object t_Domer_JEDJ_TERMINAL: TBCDField
      FieldName = 'DJ_TERMINAL'
      Precision = 10
      Size = 0
    end
  end
  object t_Domer_Cash: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    DataSource = s_tender05
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end
      item
        Name = 'TERMINAL_ID'
        DataType = ftInteger
        Value = 0
      end>
    SQL.Strings = (
      'select * from domer_adds_cash'
      'where'
      '   DC_STAMP>:dttm1'
      'and'
      '    DC_STAMP<=:dttm2'
      'and'
      '    (DC_Terminal=:TERMINAL_ID)'
      'order by DC_STAMP'
      '')
    Left = 360
    Top = 376
    object t_Domer_CashDC_UNIQUE: TBCDField
      FieldName = 'DC_UNIQUE'
      Precision = 10
      Size = 0
    end
    object t_Domer_CashDC_ID: TStringField
      FieldName = 'DC_ID'
      Size = 9
    end
    object t_Domer_CashDC_CARD: TStringField
      FieldName = 'DC_CARD'
      Size = 10
    end
    object t_Domer_CashDC_NETID: TStringField
      FieldName = 'DC_NETID'
      Size = 10
    end
    object t_Domer_CashDC_USER: TStringField
      FieldName = 'DC_USER'
      Size = 10
    end
    object t_Domer_CashDC_STAMP: TDateTimeField
      FieldName = 'DC_STAMP'
    end
    object t_Domer_CashDC_AMOUNT: TBCDField
      FieldName = 'DC_AMOUNT'
      currency = True
      Precision = 10
      Size = 2
    end
    object t_Domer_CashDC_PATRON: TStringField
      FieldName = 'DC_PATRON'
      Size = 10
    end
    object t_Domer_CashDC_TYPE: TStringField
      FieldName = 'DC_TYPE'
      Size = 10
    end
    object t_Domer_CashDC_NET_AMOUNT: TBCDField
      FieldName = 'DC_NET_AMOUNT'
      currency = True
      Precision = 12
      Size = 2
    end
    object t_Domer_CashDC_PROGRAM: TStringField
      FieldName = 'DC_PROGRAM'
      Size = 24
    end
    object t_Domer_CashDC_TERMINAL: TBCDField
      FieldName = 'DC_TERMINAL'
      Precision = 10
      Size = 0
    end
  end
  object s_t_Domer_Cash: TDataSource
    DataSet = t_Domer_Cash
    Left = 448
    Top = 376
  end
  object t_Domer_Web: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    DataSource = s_tender05
    Parameters = <
      item
        Name = 'dttm1'
        DataType = ftDateTime
        Direction = pdInputOutput
        Size = -1
        Value = 40847d
      end
      item
        Name = 'dttm2'
        DataType = ftDateTime
        Direction = pdInputOutput
        Size = -1
        Value = 40847d
      end
      item
        Name = 'TERMINAL_ID'
        DataType = ftInteger
        Value = 0
      end>
    SQL.Strings = (
      'select * from cso.deposit_log'
      'where'
      '   TRANSACTION_DATETIME>:dttm1'
      'and'
      '    TRANSACTION_DATETIME<=:dttm2'
      'and'
      '   TERMINAL_NUMBER=:TERMINAL_ID'
      'order by TERMINAL_NUMBER,TRANSACTION_DATETIME'
      '')
    Left = 352
    Top = 312
    object t_Domer_WebTRANSACTION_DATETIME: TDateTimeField
      FieldName = 'TRANSACTION_DATETIME'
    end
    object t_Domer_WebTRANSACTION_ID: TStringField
      FieldName = 'TRANSACTION_ID'
      Size = 50
    end
    object t_Domer_WebTERMINAL_NUMBER: TBCDField
      FieldName = 'TERMINAL_NUMBER'
      Precision = 10
      Size = 0
    end
    object t_Domer_WebNDID: TBCDField
      FieldName = 'NDID'
      Precision = 10
      Size = 0
    end
    object t_Domer_WebNETID: TStringField
      FieldName = 'NETID'
      Size = 10
    end
    object t_Domer_WebAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object s_t_Domer_Web: TDataSource
    DataSet = t_Domer_Web
    Left = 432
    Top = 320
  end
  object terminal: TADOQuery
    Connection = DB_Oracle
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from terminal'
      'order by odyssey_term')
    Left = 400
    Top = 96
  end
end
