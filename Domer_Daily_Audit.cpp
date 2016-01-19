//---------------------------------------------------------------------------

#include <vcl.h>
#include "Unit1.h"
#pragma hdrstop
//---------------------------------------------------------------------------



USEFORM("Unit3.cpp", Form3);
USEFORM("Unit2.cpp", Form2);
USEFORM("UnitDM.cpp", DM); /* TDataModule: File Type */
USEFORM("Unit4.cpp", Form4);
USEFORM("Unit1.cpp", Form1);
USEFORM("..\..\..\Standard_Units\Standard_Email\UnitEmail.cpp", EM); /* TDataModule: File Type */
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR ch, int)
{
AnsiString app_title = Application->Title;
AnsiString Mutex_title = "Mutex " + app_title;
try
    {
    ::CreateMutex(NULL,NULL,Mutex_title.c_str());
    if (GetLastError())
        {
        Application->Title = "Second Instance";
        HWND FirstWnd;
        FirstWnd = ::FindWindow("TApplication",app_title.c_str());
        if (::IsIconic(FirstWnd))
            {
            ::ShowWindow(FirstWnd, SW_SHOWDEFAULT);
            }
        ::SetForegroundWindow(FirstWnd);
        }
    else
        {
        Application->Initialize();
        Application->Title = app_title;
         Application->CreateForm(__classid(TForm1), &Form1);
		Application->CreateForm(__classid(TForm2), &Form2);
		Application->CreateForm(__classid(TDM), &DM);
		Application->CreateForm(__classid(TForm3), &Form3);
		Application->CreateForm(__classid(TForm4), &Form4);
		Application->CreateForm(__classid(TEM), &EM);
		Form1->pass = ch;
         Application->Run();
        }
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    catch (...)
    {
         try
         {
             throw Exception("");
         }
         catch (Exception &exception)
         {
             Application->ShowException(&exception);
         }
    }
    return 0;

/*
    try
    {
         Application->Initialize();
         Application->CreateForm(__classid(TForm1), &Form1);
         Application->CreateForm(__classid(TForm2), &Form2);
         Application->CreateForm(__classid(TDM), &DM);
         Application->Run();
    }
    catch (Exception &exception)
    {
         Application->ShowException(&exception);
    }
    catch (...)
    {
         try
         {
             throw Exception("");
         }
         catch (Exception &exception)
         {
             Application->ShowException(&exception);
         }
    }
    return 0;
*/
}
//---------------------------------------------------------------------------
