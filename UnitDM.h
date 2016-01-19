//---------------------------------------------------------------------------

#ifndef UnitDMH
#define UnitDMH
//---------------------------------------------------------------------------

#include "ipscore.h"
#include "ipssmtps.h"
#include "ipworksssl.h"
#include <Data.Win.ADODB.hpp>
//#include <Bde.DBTables.hpp>
#include <Data.DB.hpp>
#include <System.Classes.hpp>
//---------------------------------------------------------------------------
class TDM : public TDataModule
{
__published:	// IDE-managed Components
	TDataSource *s_T05_max;
    TDataSource *s_calendar;
    TDataSource *s_dates;
    TDataSource *s_tender05;
	TADOQuery *calendar;
	TADOConnection *DB_Oracle;
	TADOQuery *dates;
	TIntegerField *calendarFS_YEAR;
	TIntegerField *calendarFS_MONTH;
	TStringField *calendarDESCRIPTION;
	TDateTimeField *calendarMONTH_START_DATE;
	TDateTimeField *calendarMONTH_END_DATE;
	TStringField *calendarCURRENT_MONTH;
	TDateTimeField *datesINCOME_DATE;
	TFMTBCDField *datesODYSSEY_ADDS;
	TFMTBCDField *datesPOS_ADDS;
	TFMTBCDField *datesOVER_SHORT;
	TFMTBCDField *calendarOVER_SHORT;
	TADOQuery *tender05;
	TDateTimeField *tender05INCOME_DATE;
	TIntegerField *tender05TERMINAL_ID;
	TStringField *tender05TERMINAL_NAME;
	TBCDField *tender05ODYSSEY_ADDS;
	TBCDField *tender05MICROS_ADDS;
	TBCDField *tender05DOMER_JE_ADDS;
	TBCDField *tender05DOMER_CASH_ADDS;
	TBCDField *tender05WEB_ADDS;
	TBCDField *tender05POS_ADDS;
	TBCDField *tender05OVER_SHORT;
	TStringField *tender05NOTES;
	TBCDField *tender05MISC_ADDS;
	TStringField *tender05Note;
	TADOQuery *T05_max;
	TADOQuery *web_deposit;
	TADOQuery *domer_cash;
	TADOQuery *domer_JE;
	TADOQuery *del_T05;
	TADOQuery *T05;
	TADOConnection *DB_Odyssey;
	TADOQuery *swipes;
	TADOQuery *term_list;
	TDataSource *s_t_swipes;
	TADOQuery *t_swipes;
	TDataSource *sPatron;
	TADOQuery *patron;
	TStringField *patronPlan;
	TSmallintField *patronPlan_ID;
	TStringField *patronPlan_Name;
	TStringField *patronFirst_Name;
	TStringField *patronMiddle_Name;
	TStringField *patronLast_Name;
	TStringField *patronID_Number;
	TStringField *patronCard_Number;
	TStringField *patronBuilding_ID;
	TStringField *patronBuilding_Name;
	TIntegerField *patronPlan_SK_FK;
	TAutoIncField *patronPatron_SK;
	TStringField *t_swipesTerminal;
	TSmallintField *t_swipesTerminal_ID;
	TIntegerField *t_swipesTransaction_Number;
	TSmallintField *t_swipesTransaction_Sequence;
	TDateTimeField *t_swipesDate_Time;
	TStringField *t_swipesSource;
	TStringField *t_swipesSource_Code;
	TStringField *t_swipesID_Number;
	TStringField *t_swipesCard_Number;
	TSmallintField *t_swipesPlan_ID;
	TStringField *t_swipesTender_Name;
	TStringField *t_swipesTender_Abbreviation;
	TSmallintField *t_swipesTender_ID;
	TStringField *t_swipesFunction_Name;
	TSmallintField *t_swipesFunction_ID;
	TBCDField *t_swipesResulting_Balance;
	TDateTimeField *t_swipesProcess_Date_Time;
	TBCDField *t_swipesPrevious_Balance;
	TBCDField *t_swipesTransaction_Amount;
	TStringField *t_swipesEntryMode;
	TStringField *t_swipesEntryMode_Code;
	TSmallintField *t_swipesService_Category_ID;
	TSmallintField *t_swipesPeriod_Number;
	TStringField *t_swipesCharge_Code;
	TBCDField *t_swipesNon_Taxable_Amount;
	TBCDField *t_swipesTaxable_Amount;
	TBCDField *t_swipesTax_Amount;
	TIntegerField *t_swipesFunction_SK_FK;
	TIntegerField *t_swipesPatron_SK_FK;
	TIntegerField *t_swipesPlan_SK_FK;
	TIntegerField *t_swipesTender_SK_FK;
	TIntegerField *t_swipesTerminal_SK_FK;
	TIntegerField *t_swipesTransactionEntryMode_SK_FK;
	TIntegerField *t_swipesTransactionSource_SK_FK;
	TDataSource *s_t_Domer_JE;
	TADOQuery *t_Domer_JE;
	TADOQuery *t_Domer_Cash;
	TDataSource *s_t_Domer_Cash;
	TADOQuery *t_Domer_Web;
	TDataSource *s_t_Domer_Web;
	TDateTimeField *t_Domer_WebTRANSACTION_DATETIME;
	TStringField *t_Domer_WebTRANSACTION_ID;
	TBCDField *t_Domer_WebTERMINAL_NUMBER;
	TBCDField *t_Domer_WebNDID;
	TStringField *t_Domer_WebNETID;
	TBCDField *t_Domer_WebAMOUNT;
	TBCDField *t_Domer_CashDC_UNIQUE;
	TStringField *t_Domer_CashDC_ID;
	TStringField *t_Domer_CashDC_CARD;
	TStringField *t_Domer_CashDC_NETID;
	TStringField *t_Domer_CashDC_USER;
	TDateTimeField *t_Domer_CashDC_STAMP;
	TBCDField *t_Domer_CashDC_AMOUNT;
	TStringField *t_Domer_CashDC_PATRON;
	TStringField *t_Domer_CashDC_TYPE;
	TBCDField *t_Domer_CashDC_NET_AMOUNT;
	TStringField *t_Domer_CashDC_PROGRAM;
	TBCDField *t_Domer_CashDC_TERMINAL;
	TBCDField *t_Domer_JEDJ_CONTROL;
	TBCDField *t_Domer_JEDJ_UNIQUE;
	TStringField *t_Domer_JEDJ_ID;
	TStringField *t_Domer_JEDJ_CARD;
	TStringField *t_Domer_JEDJ_NETID;
	TStringField *t_Domer_JEDJ_DESC;
	TStringField *t_Domer_JEDJ_USER;
	TDateTimeField *t_Domer_JEDJ_STAMP;
	TBCDField *t_Domer_JEDJ_AMOUNT;
	TStringField *t_Domer_JEDJ_PATRON;
	TStringField *t_Domer_JEDJ_STATUS;
	TStringField *t_Domer_JEDJ_ADD_OR_DEL;
	TBCDField *t_Domer_JEDJ_NET_AMOUNT;
	TStringField *t_Domer_JEDJ_PROG_NAME;
	TBCDField *t_Domer_JEDJ_TERMINAL;
	TSmallintField *swipesTerminal_ID;
	TStringField *swipesTerminal;
	TSmallintField *swipesFunction_ID;
	TBCDField *swipesTransaction_Amount;
	TADOQuery *terminal;
	TStringField *t_swipesAlternate_ID_Number;
	TStringField *t_swipesFirst_Name;
	TStringField *t_swipesMiddle_Name;
	TStringField *t_swipesLast_Name;
	void __fastcall calendarAfterScroll(TDataSet *DataSet);
	void __fastcall tender05CalcFields(TDataSet *DataSet);
	void __fastcall t_swipesAfterScroll(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
    __fastcall TDM(TComponent* Owner);
	void CSVStuff(TDataSet* qry);
};
//---------------------------------------------------------------------------
extern PACKAGE TDM *DM;
//---------------------------------------------------------------------------
#endif
