//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit3.h"
#include "UnitDM.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm3 *Form3;
//---------------------------------------------------------------------------
__fastcall TForm3::TForm3(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm3::FormActivate(TObject *Sender)
{
this->DBMemo1->SetFocus();
AnsiString s = this->DBMemo1->Text;
this->DBMemo1->SelStart = s.Length();
this->DBMemo1->SelLength = 0;
}
//---------------------------------------------------------------------------
