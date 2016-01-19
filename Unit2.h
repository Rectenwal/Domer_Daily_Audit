//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <System.Actions.hpp>
#include <System.ImageList.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Dialogs.hpp>
//#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TForm2 : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TDBText *DBText1;
    TDBText *DBText2;
    TLabel *Label1;
    TDBGrid *DBGrid0;
    TDBText *DBText3;
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TTabSheet *TabSheet3;
    TTabSheet *TabSheet4;
    TDBGrid *DBGrid1;
    TDBGrid *DBGrid2;
    TStatusBar *sb1;
    TStatusBar *sb3;
    TStatusBar *sb2;
    TStatusBar *sb4;
    TDBGrid *DBGrid3;
    TDBGrid *DBGrid4;
    TTabSheet *TabSheet5;
    TDBGrid *DBGrid5;
    TStatusBar *sb5;
	TActionList *ActionList1;
	TAction *SwipesCSV;
	TImageList *ImageList1;
	TButton *Button1;
	TSaveDialog *SaveDlg;
    void __fastcall DBGrid0CellClick(TColumn *Column);
    void __fastcall FormActivate(TObject *Sender);
	void __fastcall SwipesCSVExecute(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TForm2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm2 *Form2;
//---------------------------------------------------------------------------
#endif
