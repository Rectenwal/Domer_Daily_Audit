//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "UnitDM.h"
#include "Unit2.h"
#include "Unit3.h"
#include "Unit4.h"
#include "UnitEmail.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ipscore"
#pragma link "ipssmtps"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TForm1::GetTermName()
{
bool found = DM->term_list->Locate("Terminal_ID",Term,Opts);
if (found==true)
	Name = DM->term_list->FieldByName("Terminal")->AsString;
}
//---------------------------------------------------------------------------
void TForm1::T05_Init()
{
DM->T05->FieldByName("INCOME_DATE")->AsDateTime = dt;
DM->T05->FieldByName("TERMINAL_ID")->AsInteger = Term;
DM->T05->FieldByName("TERMINAL_NAME")->AsString = Name;
DM->T05->FieldByName("ODYSSEY_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("MICROS_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("DOMER_JE_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("DOMER_CASH_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("WEB_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("POS_ADDS")->AsFloat = 0.0;
DM->T05->FieldByName("OVER_SHORT")->AsFloat = 0.0;
DM->T05->FieldByName("MISC_ADDS")->AsFloat = 0.0;
}
//---------------------------------------------------------------------------
void TForm1::DoRBClick()
{
int term1 = 0;
int term2 = 999999;
if (RB2->Checked==true)
	{
	term1 = 0;
    term2 = 100;
	}
else if (RB3->Checked==true)
    {
	term1 = 30;
    term2 = 39;
    }
AnsiString desc = DM->calendar->FieldByName("Description")->AsString;
DM->calendar->Active = false;
DM->calendar->Parameters->ParamByName("term1")->Value = term1;
DM->calendar->Parameters->ParamByName("term2")->Value = term2;
DM->calendar->Active = true;
DM->calendar->Locate("DESCRIPTION",desc,Opts);
DM->tender05->Active = false;
DM->tender05->Parameters->ParamByName("term1")->Value = term1;
DM->tender05->Parameters->ParamByName("term2")->Value = term2;
DM->tender05->Active = true;
DM->dates->Active = false;
DM->dates->Parameters->ParamByName("term1")->Value = term1;
DM->dates->Parameters->ParamByName("term2")->Value = term2;
DM->dates->Active = true;
DM->dates->Last();
}
//---------------------------------------------------------------------------
void TForm1::DoOdyssey()
{
DM->swipes->Active = false;
DM->swipes->Parameters->ParamByName("dttm1")->Value = dttm1.FormatString("yyyy/mm/dd hh:nn:ss AMPM");
DM->swipes->Parameters->ParamByName("dttm2")->Value = dttm2.FormatString("yyyy/mm/dd hh:nn:ss AMPM");
//DM->swipes->Parameters->ParamByName("dttm1")->Value = dttm1;
//DM->swipes->Parameters->ParamByName("dttm2")->Value = dttm2;
DM->swipes->Active = true;
DM->swipes->First();
while (DM->swipes->Eof==false)
	{
	Term = DM->swipes->FieldByName("Terminal_ID")->AsInteger;
	GetTermName();
	bool found = DM->terminal->Locate("ODYSSEY_TERM",Term,Opts);
	int fs_unit = 0;
	if (found==true)
		fs_unit = DM->terminal->FieldByName("FS_UNIT")->AsInteger;
	int func = DM->swipes->FieldByName("Function_ID")->AsInteger;
	double am = DM->swipes->FieldByName("Transaction_Amount")->AsFloat;
	if (am!=0.0)
		{
		if (func==10) am = -am;
		Variant locvalues[2];
		locvalues[0] = Variant(dt);
		locvalues[1] = Variant(Term);
		bool found = DM->T05->Locate("INCOME_DATE;TERMINAL_ID", VarArrayOf(locvalues, 1), Opts);
		if (found==true)
			{
			double temp = DM->T05->FieldByName("ODYSSEY_ADDS")->AsFloat;
			am += temp;
			DM->T05->Edit();
			}
		else
			{
			DM->T05->Append();
			T05_Init();
			}
		if(fs_unit==25320)  // Morris Inn Gift Card Adds
			DM->T05->FieldByName("MISC_ADDS")->AsFloat = am;
		if(fs_unit==23700)  // CSO Gift Card Adds
			{
			if(Term==9019) // CSO -Green Plan Adds
				DM->T05->FieldByName("MISC_ADDS")->AsFloat = am;
			else
				DM->T05->FieldByName("MICROS_ADDS")->AsFloat = am;
			}
		DM->T05->FieldByName("ODYSSEY_ADDS")->AsFloat = am;
		DM->T05->Post();
		}
	DM->swipes->Next();
	}
DM->swipes->Active = false;
}
//---------------------------------------------------------------------------
/*
*/
//---------------------------------------------------------------------------
void TForm1::DoDomerJEAdd()
{
DM->domer_JE->Active = false;
DM->domer_JE->Parameters->ParamByName("dttm1")->Value = dttm1;
DM->domer_JE->Parameters->ParamByName("dttm2")->Value = dttm2;
DM->domer_JE->Active = true;
DM->domer_JE->First();
while (DM->domer_JE->Eof==false)
	{
	Term = DM->domer_JE->FieldByName("DJ_Terminal")->AsInteger;
	GetTermName();
	double am = DM->domer_JE->FieldByName("TOTAL_AMOUNT")->AsFloat;
	if (am!=0.0)
		{
		Variant locvalues[2];
		locvalues[0] = Variant(dt);
		locvalues[1] = Variant(Term);
		bool found = DM->T05->Locate("INCOME_DATE;TERMINAL_ID", VarArrayOf(locvalues, 1), Opts);
		if (found==true)
			{
			double temp = DM->T05->FieldByName("DOMER_JE_ADDS")->AsFloat;
			am += temp;
			DM->T05->Edit();
			}
		else
			{
			DM->T05->Append();
			T05_Init();
			}
		DM->T05->FieldByName("DOMER_JE_ADDS")->AsFloat = am;
		DM->T05->Post();
		}
	DM->domer_JE->Next();
	}
}
//---------------------------------------------------------------------------
void TForm1::DoDomerCashAdd()
{
DM->domer_cash->Active = false;
DM->domer_cash->Parameters->ParamByName("dttm1")->Value = dttm1;
DM->domer_cash->Parameters->ParamByName("dttm2")->Value = dttm2;
DM->domer_cash->Active = true;
DM->domer_cash->First();
while (DM->domer_cash->Eof==false)
	{
	Term = DM->domer_cash->FieldByName("DC_TERMINAL")->AsInteger;
	GetTermName();
	double am = DM->domer_cash->FieldByName("TOTAL_AMOUNT")->AsFloat;
	if (am!=0.0)
		{
		Variant locvalues[2];
		locvalues[0] = Variant(dt);
		locvalues[1] = Variant(Term);
		bool found = DM->T05->Locate("INCOME_DATE;TERMINAL_ID", VarArrayOf(locvalues, 1), Opts);
		if (found==true)
			{
			double temp = DM->T05->FieldByName("DOMER_CASH_ADDS")->AsFloat;
			am += temp;
			DM->T05->Edit();
			}
		else
			{
			DM->T05->Append();
			T05_Init();
			}
		DM->T05->FieldByName("DOMER_CASH_ADDS")->AsFloat = am;
		DM->T05->Post();
		}
	DM->domer_cash->Next();
	}
}
//---------------------------------------------------------------------------
void TForm1::DoWebAdd()
{
DM->web_deposit->Active = false;
DM->web_deposit->Parameters->ParamByName("dttm1")->Value = dttm1;
DM->web_deposit->Parameters->ParamByName("dttm2")->Value = dttm2;
DM->web_deposit->Active = true;
DM->web_deposit->First();
while (DM->web_deposit->Eof==false)
	{
	Term = DM->web_deposit->FieldByName("TERMINAL_NUMBER")->AsInteger;
	GetTermName();
	double am = DM->web_deposit->FieldByName("TOTAL_AMOUNT")->AsFloat;
	if (am!=0.0)
		{
		Variant locvalues[2];
		locvalues[0] = Variant(dt);
		locvalues[1] = Variant(Term);
		bool found = DM->T05->Locate("INCOME_DATE;TERMINAL_ID", VarArrayOf(locvalues, 1), Opts);
		if (found==true)
			{
			double temp = DM->T05->FieldByName("DOMER_CASH_ADDS")->AsFloat;
			am += temp;
			DM->T05->Edit();
			}
		else
			{
			DM->T05->Append();
			T05_Init();
			}
		DM->T05->FieldByName("WEB_ADDS")->AsFloat = am;
		DM->T05->Post();
		}
	DM->web_deposit->Next();
	}
}
//---------------------------------------------------------------------------
void TForm1::DoOverShort()
{
AnsiString s,AMT;
DM->T05->First();
while (DM->T05->Eof==false)
	{
	double odyssey_Adds = DM->T05->FieldByName("ODYSSEY_ADDS")->AsFloat;
	double pos_Adds = DM->T05->FieldByName("MICROS_ADDS")->AsFloat;
	pos_Adds += DM->T05->FieldByName("DOMER_JE_ADDS")->AsFloat;
	pos_Adds += DM->T05->FieldByName("DOMER_CASH_ADDS")->AsFloat;
	pos_Adds += DM->T05->FieldByName("WEB_ADDS")->AsFloat;
	pos_Adds += DM->T05->FieldByName("MISC_ADDS")->AsFloat;
	double over_short = odyssey_Adds - pos_Adds;
	DM->T05->Edit();
	DM->T05->FieldByName("POS_ADDS")->AsFloat = pos_Adds;
	DM->T05->FieldByName("OVER_SHORT")->AsFloat = over_short;
	DM->T05->Post();
	if (over_short!=0.0)
		{
		TDateTime osDT = DM->T05->FieldByName("INCOME_DATE")->AsDateTime;
		int term = DM->T05->FieldByName("TERMINAL_ID")->AsInteger;
		AnsiString TERM = DM->T05->FieldByName("TERMINAL_NAME")->AsString;
		AnsiString DATE = osDT.FormatString("mm/dd/yy");
		hasOS = true;
		AMT = CurrToStrF(over_short,ffCurrency,2);
		if (over_short>0.0) AMT = AMT + " ";
		s.sprintf("%-8s  %04i %-32s %12s\n",DATE,term,TERM,AMT);
		msg = msg + s;
		}
	DM->T05->Next();
	}
}
//---------------------------------------------------------------------------
void TForm1::DoStuff()
{
SB->SimpleText = dt.DateString();
AnsiString s;
s = dt.DateString();
AnsiString EOD = "4:30AM";
dttm1 = TDateTime(dt.DateString()+" "+EOD);
dttm2 = dttm1 + 1;
TCursor Save_Cursor = Screen->Cursor;
DoOdyssey(); // Must always run first
DoDomerJEAdd();
DoDomerCashAdd();
DoWebAdd();
DoOverShort();
Screen->Cursor = crHourGlass;
Screen->Cursor = Save_Cursor;
}
//---------------------------------------------------------------------------
void TForm1::DoOverNight()
{
TDateTime comp = TDateTime("12/15/2015");
TCursor Save_Cursor = Screen->Cursor;
Screen->Cursor = crHourGlass;
DM->dates->Active = false;
DM->tender05->Active = false;
DM->T05_max->Active = false;
DM->T05->Active = false;
DM->T05_max->Active = true;
TDateTime start = DM->T05_max->FieldByName("max_date")->AsDateTime;
start++;
TDateTime today = Date();
msg = "";
hasOS = false;

for (dt=start;dt<today;dt++)
	{
	DM->T05->Active = false;
	DM->T05->Parameters->ParamByName("dt")->Value = dt;
	DM->T05->Active = true;
	DoStuff();
	}
if ((hasOS==true)&&(today!=comp))
	{
	AnsiString ini_name = "c:\\data\\fsit_data\\encryption\\passphrase.ini";
//	AnsiString usr = "ndfood";
//	AnsiString psw = DM->GetNDFOODpsw(usr);

	AnsiString hdr0 = "Following dates are variant:\n\n";
	AnsiString hdr1 = "  Date    Terminal # and Name                    O/S Amount\n";
	AnsiString hdr2 = "  ====    ===================                    ==========\n";
	msg = hdr0 + hdr1 + hdr2 + msg;
	EM->smtps->ResetHeaders();
	EM->smtps->Subject = "Domer$ Daily Audit " + Date().DateString();
	EM->SetAOSEmail("Domer_Daily_Audit",1,userID);// must run after ResetHeaders()  and Subject =
	EM->smtps->MessageText = msg;
	EM->SendAOSEmail();
/*
	DM->smtps->MailServer = "smtp.nd.edu";
	DM->smtps->MailPort = 465;
	DM->smtps->User = "ndfood";
	DM->smtps->Password = psw;
	DM->smtps->From = "ndfood@nd.edu";
	DM->smtps->ReplyTo = "ndfood@nd.edu";
*/
//	DM->smtps->SendTo = "dboudrea@nd.edu";
//	DM->smtps->Cc = "rrectenw@nd.edu";
/*
	AnsiString excpt = " ";
	bool return_code = false;
	int email_count = 0;
	int max_count = 100;
	while((email_count<max_count)&&(return_code == false))
		{
		email_count++;
		return_code = true;
		try
			{
			DM->smtps->Connect();
			DM->smtps->Send();
			}
		catch (Exception &e)
			{
			return_code = false;
			excpt = excpt +"\n\n"+ e.Message;
			}
		DM->smtps->Disconnect();
		}
*/
	}
DM->T05->Active = false;

SB->SimpleText = "";
Screen->Cursor = Save_Cursor;
Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OverNightExecute(TObject *Sender)
{
DoOverNight();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormActivate(TObject *Sender)
{
this->DBGrid1->Columns->Items[0]->Width=80;
this->DBGrid1->Columns->Items[1]->Width=80;
this->DBGrid1->Columns->Items[2]->Width=80;

this->DBGrid2->Columns->Items[0]->Width=64;
this->DBGrid2->Columns->Items[1]->Width=80;
this->DBGrid2->Columns->Items[2]->Width=80;
this->DBGrid2->Columns->Items[3]->Width=80;

userID.sprintf("%s",getenv("USERNAME"));
DM->DB_Oracle->Connected = true;
DM->DB_Odyssey->Connected = true;
DM->terminal->Active = true;
DM->term_list->Active = true;
Opts.Clear();
DM->calendar->Locate("CURRENT_MONTH","*",Opts);
TDateTime today = Date();
TDateTime month_end = DM->calendar->FieldByName("MONTH_END_DATE")->AsDateTime;
DM->tender05->Active = false;
DM->dates->Active = false;
while ((DM->calendar->Eof==false)&&(today>month_end))
	{
	DM->calendar->Next();
    month_end = DM->calendar->FieldByName("MONTH_END_DATE")->AsDateTime;
    }
if (pass!="")
    {
    DoOverNight();
    }
else
    DoRBClick();
if (userID=="rrectenw")
    {
    this->DeleteDate->Enabled = true;
    this->OverNight->Enabled = true;
    }
else
    {
    this->DeleteDate->Enabled = false;
    this->OverNight->Enabled = false;
    }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::RBClick(TObject *Sender)
{
	DoRBClick();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ViewDetailExecute(TObject *Sender)
{
/*
DM->DB_Odyssey->Connected = false;
AnsiString s1 =  DTTM1.FormatString("yyyy/mm/dd hh:ss:ss AMPM");
AnsiString s2 =  DTTM2.FormatString("yyyy/mm/dd hh:ss:ss AMPM");
AnsiString s = "and Terminal_ID = "+TERM+" and Process_Date_Time between \'"+s1+"\' and \'"+s2+"\'";

AnsiString S1 = DM->t_swipes->SQL->Strings[1];
AnsiString S2 = DM->t_swipes->SQL->Strings[2];
AnsiString S3 = DM->t_swipes->SQL->Strings[3];
AnsiString S4 = DM->t_swipes->SQL->Strings[4];
DM->t_swipes->SQL->Strings[2] = s;
*/
DM->DB_Odyssey->Connected = true;
DM->patron->Active = true;
TDateTime DT = DM->tender05->FieldByName("INCOME_DATE")->AsDateTime;
AnsiString EOD = "4:30AM";
TDateTime DTTM1 = TDateTime(DT.DateString()+" "+EOD);
TDateTime DTTM2 = DTTM1 + 1;
AnsiString TERM = DM->tender05->FieldByName("Terminal_ID")->AsAnsiString;
DM->t_swipes->Active=false;
DM->t_swipes->Parameters->ParamByName("term")->Value = TERM;
DM->t_swipes->Parameters->ParamByName("DTTM1")->Value = DTTM1.FormatString("yyyy/mm/dd hh:ss:ss AMPM");
DM->t_swipes->Parameters->ParamByName("DTTM2")->Value = DTTM2.FormatString("yyyy/mm/dd hh:ss:ss AMPM");
DM->t_swipes->Active=true;

DM->t_Domer_JE->Active=false;
DM->t_Domer_JE->Parameters->ParamByName("DTTM1")->Value = DTTM1;
DM->t_Domer_JE->Parameters->ParamByName("DTTM2")->Value = DTTM2;
DM->t_Domer_JE->Active=true;
DM->t_Domer_Cash->Active=false;
DM->t_Domer_Cash->Parameters->ParamByName("DTTM1")->Value = DTTM1;
DM->t_Domer_Cash->Parameters->ParamByName("DTTM2")->Value = DTTM2;
DM->t_Domer_Cash->Active=true;
DM->t_Domer_Web->Active=false;
DM->t_Domer_Web->Parameters->ParamByName("DTTM1")->Value = DTTM1;
DM->t_Domer_Web->Parameters->ParamByName("DTTM2")->Value = DTTM2;
DM->t_Domer_Web->Active=true;

Form2->ShowModal();

DM->t_swipes->Active=false;
DM->t_Domer_JE->Active=false;
DM->t_Domer_Cash->Active=false;
DM->t_Domer_Web->Active=false;
DM->patron->Active = false;

}
//---------------------------------------------------------------------------

void __fastcall TForm1::DeleteDateExecute(TObject *Sender)
{
if (IDOK==Application->MessageBox(L"Okay to Delete?",L"Delete",MB_OKCANCEL))
	{
	TDateTime Del_Date = DM->dates->FieldByName("INCOME_DATE")->AsDateTime;
	DM->tender05->Active = false;
	DM->dates->Active = false;
	DM->del_T05->Active = false;
	DM->del_T05->Parameters->ParamByName("Del_Date")->Value = Del_Date;
	DM->del_T05->ExecSQL();
	this->DoRBClick();
	}
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Panel5Click(TObject *Sender)
{
DM->tender05->Edit();
if (Form3->ShowModal()==mrOk)
	{
	DM->tender05->Post();
	}
else
    DM->tender05->Cancel();

}
//---------------------------------------------------------------------------

