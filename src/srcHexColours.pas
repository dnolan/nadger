unit srcHexColours;

interface

uses
	Windows, Sysutils;

type
	THexColours = class

   private
   	rgbR, rgbG, rgbB, rgbRGB, rgbSR, rgbSG, rgbSB : Integer;
      hexR, hexG, hexB, hexRGB, hexSR, hexSB, hexSG : String;
      
      procedure SetRGB_R(Colour:Integer);
      procedure SetRGB_G(Colour:Integer);
      procedure SetRGB_B(Colour:Integer);
      procedure SetRGB();
      procedure SetRGBFromValue(Colour:Integer);
      procedure SetHex_R(Colour:String);
      procedure SetHex_G(Colour:String);
      procedure SetHex_B(Colour:String);
   	procedure SetHex();
      procedure SetHexFromValue(Colour:String);

      function HexToInt (s: string): Integer;

   public
		property RGBRed: Integer read rgbR write SetRGB_R;
      property RGBGreen: Integer read rgbG write SetRGB_G;
      property RGBBlue: Integer read rgbB write SetRGB_B;
      property RGBFull: Integer read rgbRGB write SetRGBFromValue;
      property HexRed: String read hexR write SetHex_R;
      property HexGreen: String read hexG write SetHex_G;
      property HexBlue: String read hexB write SetHex_B;
      property HexFull: String read hexRGB write SetHexFromValue;

      procedure Reset();
end;

implementation

procedure THexColours.SetRGB_R(Colour:Integer);
begin
  	rgbR := Colour;
   hexR := IntToHex(Colour, 2);
   SetHex; SetRGB;
end;

procedure THexColours.SetRGB_G(Colour:Integer);
begin
  	rgbG := Colour;
   hexG := IntToHex(Colour, 2);
   SetHex; SetRGB;
end;

procedure THexColours.SetRGB_B(Colour:Integer);
begin
  	rgbB := Colour;
   hexB := IntToHex(Colour, 2);
   SetHex; SetRGB;
end;

procedure THexColours.SetRGB();
begin
   rgbRGB := RGB(rgbR, rgbG, rgbB);
end;

procedure THexColours.SetRGBFromValue(Colour:Integer);
begin
	rgbRGB := Colour;
	rgbR := GetRValue(Colour);
	rgbG := GetGValue(Colour);
	rgbB := GetBValue(Colour);
	hexR := IntToHex(GetRValue(Colour), 2);
	hexG := IntToHex(GetGValue(Colour), 2);
	hexB := IntToHex(GetBValue(Colour), 2);
	SetHex;
end;

procedure THexColours.SetHex_R(Colour:String);
begin
  	hexR := Colour;
   rgbR := HexToInt(Colour);
   SetHex; SetRGB;
end;

procedure THexColours.SetHex_G(Colour:String);
begin
  	hexG := Colour;
   rgbG := HexToInt(Colour);
   SetHex; SetRGB;
end;

procedure THexColours.SetHex_B(Colour:String);
begin
  	hexB := Colour;
   rgbB := HexToInt(Colour);
   SetHex; SetRGB;
end;

procedure THexColours.SetHex();
begin
   hexRGB := hexR+hexG+hexB;
end;

procedure THexColours.SetHexFromValue(Colour:String);
begin
	hexRGB := Colour;
	hexR := Copy(Colour, 1, 2);
	hexG := Copy(Colour, 3, 2);
	hexB := Copy(Colour, 5, 2);
	rgbR := HexToInt(Copy(Colour, 1, 2));
	rgbG := HexToInt(Copy(Colour, 3, 2));
	rgbB := HexToInt(Copy(Colour, 5, 2));
	SetRGB;
end;

procedure THexColours.Reset();
begin
	hexRGB := '000000';
   hexR := '00';
   hexG := '00';
   hexB := '00';
   rgbR := 0;
	rgbG := 0;
	rgbB := 0;
   rgbRGB := 0;
end;

function THexColours.HexToInt (s: string): Integer;
const
	Hex : array ['A'..'F'] of Integer = (10,11,12,13,14,15);
var
	i : Integer;
begin
  Result := 0;
  s := UpperCase(s);
  for i := 1 to Length(s) do begin
    if (s[i] < 'A') then
    	Result := Result * 16 + Ord(s[i]) - 48
    else
      Result := Result * 16 + Hex[s[i]];
  end;
  HexToInt := Result;
end;

end.
