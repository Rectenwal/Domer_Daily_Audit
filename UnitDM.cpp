//---------------------------------------------------------------------------

#include <vcl.h>
#include <inifiles.hpp>
#pragma hdrstop

#include "UnitDM.h"
#include "Unit2.h"
#include <stdio.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ipscore"
#pragma link "ipssmtps"
#pragma link "ipworksssl"
#pragma resource "*.dfm"
TDM *DM;
//---------------------------------------------------------------------------
__fastcall TDM::TDM(TComponent* Owner)
    : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TDM::calendarAfterScroll(TDataSet *DataSet)
{
if (dates->Active==true)
	dates->Last();
}
//---------------------------------------------------------------------------

void __fastcall TDM::tender05CalcFields(TDataSet *DataSet)
{
AnsiString s = this->tender05NOTES->AsString;
while ((s.Length()>0) && (s[1] == ' ')) s.Delete(1,1);
if (s.Length()>0) s = "X";
this->tender05Note->AsString = s;

}
//---------------------------------------------------------------------------

void __fastcall TDM::t_swipesAfterScroll(TDataSet *DataSet)
{
AnsiString s = patronFirst_Name->AsString;
s += " " + patronMiddle_Name->AsString;
s += " " + patronLast_Name->AsString;
Form2->sb1->SimpleText = s;
}
//---------------------------------------------------------------------------
void TDM::CSVStuff(TDataSet* qry)
{
qry->Active = true;
int field_count = qry->FieldCount;
AnsiString fn = Form2->SaveDlg->FileName;
FILE* fo = fopen(fn.c_str(),(char*)"w");
AnsiString s = "";
for(int i=1;i<=field_count;i++)
	{
	AnsiString colname = qry->Fields->FieldByNumber(i)->FullName;
	if(i<field_count)
		s += colname+",";
	else
		s += colname+"\r";
	}
fputs(s.c_str(),fo);

qry->First();
while(qry->Eof == false)
	{
	s = "";
	for(int j=1;j<=field_count;j++)
		{
		AnsiString fld = qry->Fields->FieldByNumber(j)->FullName;
		AnsiString data_type = qry->Fields->FieldByNumber(j)->DataType;
		AnsiString val = qry->Fields->FieldByNumber(j)->AsAnsiString;
		if(data_type=="1")
			{
			AnsiString temp = "";
			for(int k=1;k<=val.Length();k++)
				{
				temp+=val[k];
				if(val[k]=='"') temp+='"';
				}
			val = temp;
			val = "\""+val+"\"";
			}
		if(j<field_count)
			s += val+",";
		else
			s += val;
		}
	s += "\r";
	fputs(s.c_str(),fo);
	qry->Next();
	}
fclose(fo);
//qry->Active = false;
}
//---------------------------------------------------------------------------


