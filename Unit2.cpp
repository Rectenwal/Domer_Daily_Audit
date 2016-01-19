//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
#include "UnitDM.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::DBGrid0CellClick(TColumn *Column)
{

int sel = DBGrid0->SelectedIndex;
PageControl1->ActivePageIndex =sel;

}
//---------------------------------------------------------------------------


void __fastcall TForm2::FormActivate(TObject *Sender)
{
/*
DBGrid1->SetFocus();
DBGrid1->SelectedIndex = 0;
PageControl1->ActivePageIndex = 1;
*/

DBGrid0->SetFocus();
DBGrid0->SelectedIndex = 0;
PageControl1->ActivePageIndex = 0;

this->DBGrid1->Columns->Items[0]->Width=64;
this->DBGrid1->Columns->Items[1]->Width=148;
this->DBGrid1->Columns->Items[2]->Width=66;
this->DBGrid1->Columns->Items[3]->Width=64;
this->DBGrid1->Columns->Items[4]->Width=30;
this->DBGrid1->Columns->Items[5]->Width=84;
this->DBGrid1->Columns->Items[6]->Width=80;
this->DBGrid1->Columns->Items[7]->Width=80;
this->DBGrid1->Columns->Items[8]->Width=64;
}
//---------------------------------------------------------------------------

void __fastcall TForm2::SwipesCSVExecute(TObject *Sender)
{
if (SaveDlg->Execute())
	{
	DM->CSVStuff(DM->t_swipes);
	}
}
//---------------------------------------------------------------------------

