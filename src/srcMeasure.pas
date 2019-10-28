unit srcMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, srcMain;

type
  TfrmMeasure = class(TForm)
    tbrMain: TToolBar;
    ToolButton1: TToolButton;
    ScrollBox: TScrollBox;
    imgMeasure: TImage;
    procedure FormShow(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmMeasure: TfrmMeasure;

implementation

{$R *.dfm}

procedure TfrmMeasure.FormShow(Sender: TObject);
var
	tmpBMP : TBitmap;
begin
	imgDrag := False;
	tmpBMP := frmMain.DesktopScreenShot;
  imgMeasure.Width := tmpBMP.Width;
  imgMeasure.Height := tmpBMP.Height;
	imgMeasure.Picture.Assign(tmpBMP);
end;

end.
