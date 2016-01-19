//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
//#include <DBTables.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ActnList.hpp>
#include <ImgList.hpp>
#include <ComCtrls.hpp>
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include "ipscore.h"
#include "ipssmtps.h"
#include <System.Actions.hpp>
#include <System.ImageList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TActionList *ActionList1;
    TAction *OverNight;
    TImageList *ImageList1;
    TStatusBar *SB;
    TPanel *Panel1;
    TSplitter *Splitter1;
    TPanel *Panel2;
    TDBGrid *DBGrid1;
    TDBGrid *DBGrid2;
    TDBGrid *DBGrid3;
    TPanel *Panel3;
    TRadioGroup *RadioGroup1;
    TRadioButton *RB1;
    TRadioButton *RB2;
    TRadioButton *RB3;
    TMainMenu *MainMenu1;
    TMenuItem *Action1;
    TMenuItem *OverNight1;
    TPanel *Panel4;
    TPanel *Panel5;
    TDBText *DBText1;
    TAction *ViewDetail;
    TAction *DeleteDate;
    TPopupMenu *PopupMenu2;
    TMenuItem *DeleteDate1;
    TMenuItem *DeleteDate2;
    void __fastcall OverNightExecute(TObject *Sender);
    void __fastcall FormActivate(TObject *Sender);
    void __fastcall RBClick(TObject *Sender);
    void __fastcall ViewDetailExecute(TObject *Sender);
    void __fastcall DeleteDateExecute(TObject *Sender);
    void __fastcall Panel5Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
    TDateTime dttm1;
    TDateTime dttm2;
    TLocateOptions Opts;
    void DoStuff();
    void DoOdyssey();
//    void DoMicros(int db_no);
	void DoDomerJEAdd();
    void DoDomerCashAdd();
    void T05_Init();
    TDateTime dt;
    int Term;
	AnsiString Name;
    void GetTermName();
    void DoOverShort();
    void DoWebAdd();
    void DoOverNight();
    void DoRBClick();
	AnsiString pass;
	AnsiString userID;
    bool hasOS;
    AnsiString msg;
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
