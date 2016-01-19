object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 469
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 679
    Height = 469
    TabStop = False
    Align = alClient
    Color = clWhite
    DataSource = DM.s_t_swipes
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
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
        Visible = True
      end>
  end
end
