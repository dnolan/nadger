unit srcGlobal;

interface

uses
	Windows;

implementation

function DesktopScreenShot() : TBitmap;
var
   tmpBmp: TBitmap;
   DC: HDC;
begin
	tmpBmp:= TBitmap.Create;
  DC := GetDC(GetDesktopWindow);
  with tmpBmp do
  try
  	Width := Screen.Width;
    Height := Screen.Height;
    BitBlt(Canvas.Handle, 0, 0, Width, Height, DC, 0, 0, SRCCOPY);
    DesktopScreenShot := tmpBmp;
  finally
 		ReleaseDC(GetDesktopWindow, DC);
	end;
end;

end.
