unit srcMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, ShellApi, Menus, ImgList, Registry, Clipbrd,
  Math, srcHexColours, ToolWin, ActnList;

const
	WM_MYTRAYICONCALLBACK = WM_USER + 1000;
  APP_VERSION = '0.6';
  APP_NAME = 'Nadger';
  FName = 'store.dat';

  KEY_HEXCOLOURS = 'Software\\Nadger';
  KEY_CLIPBOARD = 'SaveToClipboard';
  KEY_SAVEONEXIT = 'SaveOnExit';
  KEY_LASTVALUE = 'LastValue';
  KEY_ZOOMRATIO = 'ZoomRatio';
  KEY_CLIPBOARD_HASH = 'SaveToClipboardHash';

  DEFAULT_GROUP = '(Default)';

type
  	TSettings = record
   bolCopyHexToClipboard : Boolean;
   bolCopyHexToClipboardHash : Boolean;
   bolSaveOnExit : Boolean;
   intZoomRatio : Integer;
end;

type
	PHexNode = ^THexNode;
	THexNode = packed record
   Name: String[100];
   HexValue: String[7];
   Index, Level: Integer;
end;

  
type
  TfrmMain = class(TForm)
    pixelTimer: TTimer;
    menuTray: TPopupMenu;
    mnuTrayCPick: TMenuItem;
    mnuTrayExit: TMenuItem;
    menuMain: TMainMenu;
    mnuMainFile: TMenuItem;
    mnuMainCPick: TMenuItem;
    mnuMainExit: TMenuItem;
    mnuMainEdit: TMenuItem;
    mnuMainOptions: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    mnuTrayOpen: TMenuItem;
    N3: TMenuItem;
    panAll: TPanel;
    panScrolls: TPanel;
    scrollB: TScrollBar;
    colorB: TStaticText;
    scrollG: TScrollBar;
    scrollR: TScrollBar;
    colorG: TStaticText;
    colorR: TStaticText;
    panValues: TPanel;
    lblHex: TLabel;
    lblRGB: TLabel;
    txtRGB: TEdit;
    imgDesktop: TImage;
    dlgColour: TColorDialog;
    mnuFunc: TMenuItem;
    mnuFuncNegative: TMenuItem;
    mnuFuncNegativeR: TMenuItem;
    mnuFuncNegativeG: TMenuItem;
    mnuFuncNegativeB: TMenuItem;
    lblHexSafe: TLabel;
    txtHexSafe: TEdit;
    panView: TPanel;
    colorRGB: TStaticText;
    colorSafe: TStaticText;
    lockR: TCheckBox;
    lockG: TCheckBox;
    lockB: TCheckBox;
    mnuFuncLock: TMenuItem;
    N4: TMenuItem;
    mnuFuncLockRG: TMenuItem;
    mnuFuncLockGB: TMenuItem;
    mnuFuncLockRB: TMenuItem;
    N5: TMenuItem;
    mnuFuncLockAll: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHelpAbout: TMenuItem;
    mnuFuncGreyScale: TMenuItem;
    txtHex: TEdit;
    N6: TMenuItem;
    N7: TMenuItem;
    mnuFuncReset: TMenuItem;
    panFloat: TPanel;
    colorFloat: TStaticText;
    imgColour: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    colorShape: TShape;
    treeStore: TTreeView;
    menuTree: TPopupMenu;
    menuTreeAddGroup: TMenuItem;
    menuTreeDelete: TMenuItem;
    imglstTree: TImageList;
    imglstMain: TImageList;
    menuTreeAddCurrent: TMenuItem;
    N9: TMenuItem;
    menuTreeSave: TMenuItem;
    menuTreeRevert: TMenuItem;
    menuTreeSort: TMenuItem;
    tbarMain: TToolBar;
    tbarMainNetscape: TToolButton;
    tbarMainColourDlg: TToolButton;
    tbarMainSaveList: TToolButton;
    tbarMainDropper: TToolButton;
    tbarMainRevert: TToolButton;
    ToolButton2: TToolButton;
    menuTreeRename: TMenuItem;
    N10: TMenuItem;
    panSuggest: TPanel;
    imgSuggest: TImage;
    lstActions: TActionList;
    actExit: TAction;
    actPickColour: TAction;
    actColourDialog: TAction;
    actStoreSave: TAction;
    actStoreRevert: TAction;
    St1: TMenuItem;
    Save1: TMenuItem;
    RevertStore1: TMenuItem;
    ColourDialog1: TMenuItem;
    menuTreeCopy: TMenuItem;
    actLeftMerge: TAction;
    actRightMerge: TAction;
    N8: TMenuItem;
    SetLeftColourMerge1: TMenuItem;
    SetRightColourMerge1: TMenuItem;
    actSetMergeGlobal: TAction;
    actOptions: TAction;
    Panel1: TPanel;
    mergeLeft: TStaticText;
    merge1: TStaticText;
    merge2: TStaticText;
    merge3: TStaticText;
    merge4: TStaticText;
    merge5: TStaticText;
    merge6: TStaticText;
    merge7: TStaticText;
    merge8: TStaticText;
    merge9: TStaticText;
    merge10: TStaticText;
    merge11: TStaticText;
    mergeRight: TStaticText;
    Label1: TLabel;
    butBlendLeft: TBitBtn;
    butBlendRight: TBitBtn;
    lblCoords: TLabel;
    function GetNegativeColour(intColor : Integer) : Integer;
    procedure SetFormValues(bolScrollbars: Boolean; bolTxtRGB: Boolean; bolTxtHex: Boolean);
    procedure SuggestColours();
    procedure MergeColours();
    procedure SetSafeValues();
    procedure SetColorLocks(R, G, B:Boolean);
    procedure SaveTextToClipboard(ClipData : PChar);
    function GetCurrentPixelColour() : Integer;
    function HexToInt (s: string): Integer;
    procedure ToggleFullScreen();
    procedure ToggleTrayIcon(Sender: TObject);
    procedure SetFloatPosition();
    function DesktopScreenShot() : TBitmap;
    
    function CreateStoreGroup(Name :String = '') : TTreeNode;
    function CreateStoreHex(TargetNode:TTreeNode; Name:String='') : Boolean;
    procedure SaveStore();
    procedure LoadStore();
    procedure pixelTimerTimer(Sender: TObject);
    procedure butEyeDropClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuMainExitClick(Sender: TObject);
    procedure mnuTrayExitClick(Sender: TObject);
    procedure mnuTrayOpenClick(Sender: TObject);
    procedure mnuTrayCPickClick(Sender: TObject);
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImageClick(Sender: TObject);
    procedure colorFloatMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mnuMainCPickClick(Sender: TObject);
    procedure mnuFuncNegativeClick(Sender: TObject);
    procedure mnuFuncNegativeRClick(Sender: TObject);
    procedure mnuFuncNegativeGClick(Sender: TObject);
    procedure mnuFuncNegativeBClick(Sender: TObject);
    procedure mnuFuncLockRGClick(Sender: TObject);
    procedure mnuFuncLockGBClick(Sender: TObject);
    procedure mnuFuncLockRBClick(Sender: TObject);
    procedure mnuFuncLockAllClick(Sender: TObject);
    procedure mnuHelpAboutClick(Sender: TObject);
    procedure mnuFuncGreyScaleClick(Sender: TObject);
    procedure mnuFuncResetClick(Sender: TObject);
    procedure txtHexKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure panFloatMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure ImgColourMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure menuTreeAddGroupClick(Sender: TObject);
    procedure menuTreeDeleteClick(Sender: TObject);
    procedure treeStoreMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure treeStoreDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure txtHexMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure treeStoreDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure treeStoreDblClick(Sender: TObject);
    procedure treeStoreExpand(Sender: TObject; Node: TTreeNode);
    procedure treeStoreCollapsed(Sender: TObject; Node: TTreeNode);
    procedure menuTreeAddCurrentClick(Sender: TObject);
    procedure menuTreeSaveClick(Sender: TObject);
    procedure menuTreeRevertClick(Sender: TObject);
    procedure menuTreeSortClick(Sender: TObject);
    procedure tbarMainNetscapeClick(Sender: TObject);
    procedure tbarMainDropperClick(Sender: TObject);
    procedure menuTreeRenameClick(Sender: TObject);
    procedure treeStoreEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure ImgSuggestClick(Sender: TObject);
    procedure scrolRScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure scrollGScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure scrollBScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure tbarMainRevertClick(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actPickColourExecute(Sender: TObject);
    procedure actColourDialogExecute(Sender: TObject);
    procedure actStoreSaveExecute(Sender: TObject);
    procedure actStoreRevertExecute(Sender: TObject);
    procedure menuTreeCopyClick(Sender: TObject);
    procedure actRightMergeExecute(Sender: TObject);
    procedure actLeftMergeExecute(Sender: TObject);
    procedure actSetMergeGlobalExecute(Sender: TObject);
    procedure actOptionsExecute(Sender: TObject);

  private
		intSR, intSB, intSG : Integer;
		hexSR, hexSB, hexSG : String;
		formVisible  : Boolean;
		MyTrayIcon: TNotifyIconData;

		procedure WMMyTrayIconCallback(var Msg:TMessage); message WM_MYTRAYICONCALLBACK;
		procedure WMGetMinMaxInfo(Var msg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    
  public
		AppOptions : TSettings;
      Hex : THexColours;
end;

var
	frmMain: TfrmMain;
	bolStoreSaved : Boolean;
	DragStoreHex : TTreeNode;

implementation

uses srcOptions, srcAbout, srcNamedColours;

{$R *.DFM}

procedure TfrmMain.ToggleTrayIcon(Sender: TObject);
begin
    if (formVisible) then
    begin
    	{ Setup tray icon }
    	MyTrayIcon.cbSize := SizeOf(TNotifyIconData);
    	MyTrayIcon.Wnd    := Handle;
    	MyTrayIcon.uId    := 1;
      MyTrayIcon.uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
      MyTrayIcon.uCallBackMessage := WM_MYTRAYICONCALLBACK;
      MyTrayIcon.hIcon  := Application.Icon.Handle;
      MyTrayIcon.szTip  := APP_NAME;
      Shell_NotifyIcon(NIM_ADD, @MyTrayIcon);
			ShowWindow(Application.Handle, SW_HIDE);
	 end
    else begin
    	ShowWindow(Application.Handle, SW_SHOW);
		SetForegroundWindow(Application.Handle);
		Shell_NotifyIcon(NIM_DELETE, @MyTrayIcon); // Clear tray icon
		Application.Restore;
    end;
    formVisible := NOT formVisible;
end;

procedure TfrmMain.ToggleFullScreen();
Const
  Rect: TRect = (Left:0; Top:0; Right:0; Bottom:0);
begin
	if Left > 0 then begin
    colorFloat.Visible := True;
    panAll.Hide;
    Rect := BoundsRect;
	SetBounds(Left - ClientOrigin.X, Top - ClientOrigin.Y,
    	GetDeviceCaps( Canvas.handle, HORZRES ) + (Width - ClientWidth),
      	GetDeviceCaps( Canvas.handle, VERTRES ) + (Height - ClientHeight));
   end
   else begin
   		colorFloat.Visible := False;
      	BoundsRect := Rect;
      	panAll.Show;
   end;
end;

function TfrmMain.GetNegativeColour(intColor : Integer) : Integer;
begin
	GetNegativeColour := 255 - intColor;
end;

procedure TfrmMain.SetFormValues(bolScrollbars, bolTxtRGB, bolTxtHex: Boolean);
begin
   with Hex do
   begin
      SetSafeValues();

      colorRGB.Color := RGB(RGBRed, RGBGreen, RGBBlue);
      colorFloat.Color := colorRGB.Color;

      if ((RGBRed * RGBGreen * RGBBlue) > 8290687) then
      	colorFloat.Font.Color := RGB(0, 0, 0)
      else
      	colorFloat.Font.Color := RGB(255, 255, 255);

      if bolScrollbars then
      begin
         scrollR.Position := RGBRed;
         scrollG.Position := RGBGreen;
         scrollB.Position := RGBBlue;
      end;

      colorR.Color := RGB(RGBRed,0,0);
      colorG.Color := RGB(0,RGBGreen,0);
      colorB.Color := RGB(0,0,RGBBlue);

      if bolTxtRGB then
         txtRGB.Text := IntToStr(RGBRed) + ' ' + IntToStr(RGBGreen) + ' ' + IntToStr(RGBBlue);

      if bolTxtHex then
         txtHex.Text := '#' + HexFull;

      colorFloat.Caption :=  txtHex.Text;

      { Assign hex value to clipboard automatically }
      if AppOptions.bolCopyHexToClipboard then
         if AppOptions.bolCopyHexToClipboardHash then
         		SaveTextToClipboard(PChar('#'+HexFull))
         else
         		SaveTextToClipboard(PChar(HexFull));

      txtHexSafe.Text := '#' + hexSR + hexSG + hexSB;
      colorSafe.Color := RGB(intSR, intSG, intSB);

      //SuggestColours();
   end;
end;

procedure TfrmMain.SuggestColours();
var
   tmpRect : TRect;
   Top, Size, Gap, I, Grey : Integer;
   Suggested: array[1..7] of Integer;

begin
	Top := 0;
	Size := 16;
	Gap := 2;

	tmpRect := Rect(0, 0, imgSuggest.Width, imgSuggest.Height);
	imgSuggest.Canvas.Brush.Color := clBlack;
	imgSuggest.Canvas.FillRect(tmpRect);

   Suggested[1] := Hex.RGBFull;
   Suggested[2] := RGB(Min(Hex.RGBRed+99, 255),Min(Hex.RGBGreen+99, 255), Min(Hex.RGBBlue+99, 255));
   Suggested[3] := RGB(Min(Hex.RGBRed+204, 255),Min(Hex.RGBGreen+204, 255), Min(Hex.RGBBlue+204, 255));
   Suggested[4] := RGB(255-Hex.RGBRed,255-Hex.RGBGreen, 255-Hex.RGBBlue);
   Suggested[5] := RGB(Max(255-Hex.RGBRed, 99),Max(255-Hex.RGBGreen, 99), Max(255-Hex.RGBBlue, 99));
   Suggested[6] := RGB(Max(255-Hex.RGBRed, 204),Max(255-Hex.RGBGreen, 204), Max(255-Hex.RGBBlue, 204));
   Grey := (Hex.RGBRed + Hex.RGBGreen + Hex.RGBBlue) div 3;
   Suggested[7] := RGB(Grey, Grey, Grey);

   Top := Gap;
   for I := 1 to 7 do
   begin
  		tmpRect := Rect(Gap, Top, Size+Gap, Size+Top);
			imgSuggest.Canvas.Brush.Color := Suggested[I];
			imgSuggest.Canvas.FillRect(tmpRect);
      Top := Top+Size+Gap;
   end;
end;

procedure TfrmMain.MergeColours();
const
	COUNT = 11;
  
var
	r, g, b, r2, g2, b2, mr, mg, mb, I : Integer;
  merge : TStaticText;

	function NextRGB() : Integer;
  begin
    r := r + (mr div COUNT);
    g := g + (mg div COUNT);
		b := b + (mb div COUNT);

    NextRGB := RGB(r, g, b);
  end;
  
begin
		r := GetRValue(mergeLeft.Color);
    g := GetGValue(mergeLeft.Color);
    b := GetBValue(mergeLeft.Color);

    r2 := GetRValue(mergeRight.Color);
    g2 := GetGValue(mergeRight.Color);
    b2 := GetBValue(mergeRight.Color);

    mr := r2 - r;
    mg := g2 - g;
		mb := b2 - b;

   	for I := 1 To COUNT do begin
	    merge := (FindComponent('merge'+IntToStr(I)) as TStaticText);
      merge.Color := NextRGB();
    end;
end;

procedure TfrmMain.SetSafeValues();

   function GetClosestSafeHex(I:integer):string;
   var
   	match : string;
   begin
   	case I of
   			0..25: 		match := '00';
      	26..76: 	match := '33';
      	77..127: 	match := '66';
      	128..178: match := '99';
      	179..229: match := 'CC';
      	230..255: match := 'FF';
      else
      	match := '00';
   	end;

      GetClosestSafeHex := match;
   end;

   function GetClosestSafeInt(I:integer):Integer;
   var
   	match : Integer;
   begin
   	case I of
   			0..25: 		match := 0;
      	26..76: 	match := 55;
      	77..127: 	match := 102;
      	128..178: match := 153;
      	179..229: match := 204;
      	230..255: match := 255;
      else
      	match := 0;
   	end;
      GetClosestSafeInt := match;
   end;

begin
	with Hex do
   begin
		hexSR := GetClosestSafeHex(RGBRed);
   	hexSG := GetClosestSafeHex(RGBGreen);
   	hexSB := GetClosestSafeHex(RGBBlue);

   	intSR := GetClosestSafeInt(RGBRed);
   	intSG := GetClosestSafeInt(RGBGreen);
   	intSB := GetClosestSafeInt(RGBBlue);
   end;
end;

procedure TfrmMain.SetColorLocks(R, G, B:Boolean);
begin
	lockR.Checked := R;
   lockG.Checked := G;
   lockB.Checked := B;
end;


procedure TfrmMain.SaveTextToClipboard(ClipData : PChar);
var
	MemHandle : THandle;
begin
	MemHandle := GlobalAlloc(GMEM_MOVEABLE, StrLen(ClipData)+1); // create a mem space
	if MemHandle <> 0 then begin
		StrCopy(GlobalLock(MemHandle), ClipData); // copy string into memspace
		GlobalUnlock(MemHandle); // unlock the memory
      with Clipboard do begin
			Open; // open the clipboard
			try
         	// assign the mem location to clipboard
            // the clipboard will now deal with freeing this mem
         	SetAsHandle(CF_TEXT, MemHandle);
			finally
         	Close; // close clipboard
         end;
      end;
	end;
end;

function TfrmMain.GetCurrentPixelColour() : Integer;
var
   DCHandle : Integer;
   ScreenPos : TPoint;
begin
   DCHandle := GetWindowDC(GetDesktopWindow);
   GetCursorPos(ScreenPos);
   GetCurrentPixelColour := GetPixel(DCHandle, ScreenPos.X, ScreenPos.Y);
   ReleaseDC(Application.Handle, DCHandle);	
end;


function TfrmMain.HexToInt (s: string): Integer;
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

procedure TfrmMain.WMMyTrayIconCallback(var Msg:TMessage);
var
   Pos : TPoint;
   Sender: TObject;
begin
	case Msg.lParam of
		WM_RBUTTONUP:
      begin
        	getCursorPos(Pos);
         menuTray.Popup(Pos.X, Pos.Y);
      end;
		WM_LBUTTONDBLCLK:
      begin
      	ImageClick(Sender);
			ToggleTrayIcon(Sender);
      end;
	end;
end;

{ This func sets fullscreen over taskbar too }
procedure TfrmMain.WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
begin
	inherited;
   with msg.MinMaxInfo^.ptMaxTrackSize do begin
      X := GetDeviceCaps( Canvas.handle, HORZRES ) + (Width - ClientWidth);
      Y := GetDeviceCaps( Canvas.handle, VERTRES ) + (Height - ClientHeight );
   end;
end;

procedure TfrmMain.SetFloatPosition();
var
   L, T : Integer;
   X, Y : Integer;
begin
	X := Mouse.CursorPos.X;
  Y := Mouse.CursorPos.Y;
   
	if X > (Screen.Width - panFloat.Width)
   then L := X - 5 - panFloat.Width
   else L := X+5;

   if Y > (Screen.Height - panFloat.Height)
   then T := Y - 5 - panFloat.Height
   else T := Y+5;

   panFloat.SetBounds(L, T, panFloat.Width, panFloat.Height);   
end;

function TfrmMain.DesktopScreenShot() : TBitmap;
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

function TfrmMain.CreateStoreHex(TargetNode:TTreeNode; Name:String='') : Boolean;
var
	tmpBMP : TBitmap;
   tmpRect : TRect;
   imageIndex : Integer;
   tmpNode : TTreeNode;
   PHexRec : PHexNode;
begin
	tmpBMP:= TBitmap.Create;
   with tmpBMP do
   begin
   	Width := 16;
	   Height := 16;
      tmpRect := Rect(3, 3, 13, 13);
      Canvas.Brush.Color := Hex.RGBFull;
      Canvas.FillRect(tmpRect);
   end;

   New(PHexRec);

   if Length(Name) > 0 then
      PHexRec^.Name := Name
	else
   	PHexRec^.Name := '#'+Hex.HexFull;
      
   PHexRec^.HexValue := Hex.HexFull;

   imageIndex := treeStore.Images.Add(tmpBMP, nil);
   tmpBMP.Free;

   with treeStore.Items do
   begin
   	if TargetNode.Level = 0 then
      	tmpNode := AddChildObject(TargetNode, PHexRec^.Name, PHexRec)
      else if TargetNode.Level = 1 then
      	tmpNode := InsertObject(TargetNode, PHexRec^.Name, PHexRec);

   	tmpNode.ImageIndex := imageIndex;
   	tmpNode.SelectedIndex := imageIndex;
      
      PHexNode(tmpNode.Data)^.Index :=  tmpNode.Index;
      PHexNode(tmpNode.Data)^.Level :=  tmpNode.Level;
      
      TargetNode.Expand(True);
   end;
end;

function TfrmMain.CreateStoreGroup(Name :String = '') : TTreeNode;
var
	strGroupName : String;
   tmpNode : TTreeNode;
   PHexRec : PHexNode;
begin
	New(PHexRec);

	if Length(Name) > 0 then
      strGroupName := Name
   else
		strGroupName := InputBox('Group', 'Enter a Group Name', '');
   
   if (Length(strGroupName) > 0) then
   begin
   	PHexRec^.Name := strGroupName;
   	tmpNode := treeStore.Items.AddObject(nil, strGroupName, PHexRec); // Create a root node
   	tmpNode.ImageIndex := 0;
   	tmpNode.SelectedIndex := 0;

      PHexNode(tmpNode.Data)^.Index :=  tmpNode.Index;
      PHexNode(tmpNode.Data)^.Level :=  tmpNode.Level;
      
      CreateStoreGroup := tmpNode;
   end
	else begin
      CreateStoreGroup := treeStore.Items.GetFirstNode;
   end;   
end;

procedure TfrmMain.SaveStore();
var
	FS : TFileStream;
   Node : THexNode;
   I : Integer;
   CNode : PHexNode;
begin

 	FS := TFileStream.Create(FName, fmCreate);

   for I := 0 to treeStore.Items.Count - 1 do
   begin
   	CNode := treeStore.Items.Item[I].Data;
      Node.Name := treeStore.Items.Item[I].Text;
      Node.HexValue := CNode^.HexValue;
      Node.Level := CNode^.Level;
      Node.Index := CNode^.Index;

      FS.Write(Node, SizeOf(Node));
   end;

   FS.Free;
end;

procedure TfrmMain.LoadStore();
var
	FS : TFileStream;
   Node : THexNode;
   CNode : TTreeNode;
   strTemp : String;
begin
   if FileExists(FName) then
		FS := TFileStream.Create(FName, fmOpenRead)
   else
      FS := TFileStream.Create(FName, fmCreate);

   FS.Position := 0;

   treeStore.Items.Clear;
   CreateStoreGroup('(Default)');

	while FS.Position < FS.Size do
   begin
   	FS.Read(Node, Sizeof(Node));

      if Node.Level = 0 then
      	if Node.Index = 0 then
         	CNode := treeStore.Items.GetFirstNode
         else
		      CNode := CreateStoreGroup(Node.Name)
      else begin
      	strTemp := Hex.HexFull;

         if Copy(Node.HexValue, 1, 1) = '#' then
             Node.HexValue := Copy(Node.HexValue, 2, 6);

      	Hex.HexFull := Node.HexValue;
      	CreateStoreHex(CNode, Node.Name);
         Hex.HexFull := strTemp;
      end;

   end;

   FS.Free;
end;

{
 FORM FUNCS
}

procedure TfrmMain.FormCreate(Sender: TObject);
var
	CurrentTime : Integer;
begin
	CurrentTime := GetTickCount div 1000;
  // while ((GetTickCount div 1000) < (CurrentTime + 2)) do
  //  ; 
    
	Hex := THexColours.Create;
   Hex.Reset;

   AppOptions.intZoomRatio := 2;

   pixelTimer.Interval := 10;
   pixelTimer.Enabled := False;
   Application.OnMinimize := ToggleTrayIcon;
   formVisible := True;
   frmMain.Caption := APP_NAME + ' v' + APP_VERSION;

   with TRegistry.Create do
   try

   	if OpenKey(KEY_HEXCOLOURS, false) then
      begin
      	if ValueExists(KEY_CLIPBOARD) then
         		AppOptions.bolCopyHexToClipboard := BOOL(ReadInteger(KEY_CLIPBOARD))
         else
            AppOptions.bolCopyHexToClipboard := False;

        if ValueExists(KEY_CLIPBOARD_HASH) then
         		AppOptions.bolCopyHexToClipboardHash := BOOL(ReadInteger(KEY_CLIPBOARD_HASH))
         else
            AppOptions.bolCopyHexToClipboardHash := False;
            
      	if ValueExists(KEY_SAVEONEXIT) then
	         	AppOptions.bolSaveOnExit := BOOL(ReadInteger(KEY_SAVEONEXIT))
         else
            AppOptions.bolSaveOnExit := False;

         if ValueExists(KEY_LASTVALUE) then
            Hex.RGBFull := ReadInteger(KEY_LASTVALUE)
         else
            Hex.RGBFull := 0;

         if ValueExists(KEY_ZOOMRATIO) then
            AppOptions.intZoomRatio := ReadInteger(KEY_ZOOMRATIO)
         else
            AppOptions.intZoomRatio := 2;         	
      end;

   finally
   	free;
   end;

   treeStore.Items.Add(nil, DEFAULT_GROUP);
   LoadStore;

   treeStore.FullCollapse;

   SetFormValues(True, True, True);
	 MergeColours();	
   frmMain.Show;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
	if bolStoreSaved = False then
   	if MessageDlg('You have not saved your colour store, do you wish to now?', mtWarning, [mbYes, mbNo], 0) = mrYes then
      	SaveStore;

	 if AppOptions.bolSaveOnExit then
	   with TRegistry.Create do
     try
     if OpenKey(KEY_HEXCOLOURS, true) then
      	 WriteInteger(KEY_LASTVALUE, Hex.RGBFull);
   finally
   	free;
   end;

	 Hex.Free;
   pixelTimer.Enabled := False;
   Shell_NotifyIcon(NIM_DELETE, @MyTrayIcon); // Clear tray icon
end;

procedure TfrmMain.pixelTimerTimer(Sender: TObject);
var
	ScreenPos : TPoint;
begin
   Hex.RGBFull := GetCurrentPixelColour();
   SetFormValues(False, True, True);
   GetCursorPos(ScreenPos);
   lblCoords.Caption := ('(' + IntToStr(ScreenPos.X) + ' / ' + IntToStr(ScreenPos.Y) + ')');
end;

procedure TfrmMain.butEyeDropClick(Sender: TObject);
begin
	ImageClick(Sender);
end;

procedure TfrmMain.ImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	RectSrc, RectDest : TRect;
   Size : Integer;		

begin
	 SetFloatPosition();
   Size := (imgColour.Width div 2) div AppOptions.intZoomRatio;
   RectSrc := Rect(X - Size, Y - Size, X + Size, Y + Size);
   RectDest := Rect(0, 0, imgColour.Width, imgColour.Width);
   imgColour.Canvas.Brush.Color := clBlack;
   imgColour.Canvas.FillRect(RectDest);
   imgColour.Canvas.CopyRect(RectDest, imgDesktop.Canvas, RectSrc);
end;

procedure TfrmMain.ImageClick(Sender: TObject);

begin
   if pixelTimer.Enabled then
   begin
      imgDesktop.Hide;
      panFloat.Hide;
      tbarMain.Show;
      pixelTimer.Enabled := False;
      Screen.Cursor := crDefault;
      SetColorLocks(False, False, False);
      SetFormValues(True, True, True);
   end
   else
   begin
     	imgDesktop.Picture.Assign(DesktopScreenShot);
      imgDesktop.Show;
      SetFloatPosition();
      panFloat.Show;
   		tbarMain.Hide;	

      Screen.Cursor := crCross;
      pixelTimer.Enabled := True;
   end;

   ToggleFullScreen;
end;

procedure TfrmMain.colorFloatMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
	SetFloatPosition();
end;

procedure TfrmMain.mnuMainExitClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmMain.mnuMainCPickClick(Sender: TObject);
begin
	//ImageClick(Sender);
end;

procedure TfrmMain.mnuTrayExitClick(Sender: TObject);
begin
   //Application.Terminate;
end;

procedure TfrmMain.mnuTrayOpenClick(Sender: TObject);
begin
	ToggleTrayIcon(Sender);
end;

procedure TfrmMain.mnuTrayCPickClick(Sender: TObject);
begin
	ImageClick(Sender);
	ToggleTrayIcon(Sender);
end;

procedure TfrmMain.mnuFuncNegativeClick(Sender: TObject);
begin
	with Hex do
   begin
		RGBRed := GetNegativeColour(RGBRed);
      RGBGreen := GetNegativeColour(RGBGreen);
      RGBBlue := GetNegativeColour(RGBBlue);
   end;
	SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuFuncNegativeRClick(Sender: TObject);
begin
   Hex.RGBRed := GetNegativeColour(Hex.RGBRed);
	SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuFuncNegativeGClick(Sender: TObject);
begin
	Hex.RGBGreen := GetNegativeColour(Hex.RGBGreen);
	SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuFuncNegativeBClick(Sender: TObject);
begin
	Hex.RGBBlue := GetNegativeColour(Hex.RGBBlue);
	SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuFuncLockRGClick(Sender: TObject);
begin
	SetColorLocks(True, True, False);
end;

procedure TfrmMain.mnuFuncLockGBClick(Sender: TObject);
begin
	SetColorLocks(False, True, True);
end;

procedure TfrmMain.mnuFuncLockRBClick(Sender: TObject);
begin
	SetColorLocks(True, False, True);
end;

procedure TfrmMain.mnuFuncLockAllClick(Sender: TObject);
begin
	SetColorLocks(True, True, True);
end;

procedure TfrmMain.mnuFuncGreyScaleClick(Sender: TObject);
var
	intGrey : Integer;
begin
	with Hex do
   begin
  		intGrey := (RGBRed + RGBGreen + RGBBlue) div 3;
  		RGBRed := intGrey;
   	RGBGreen := intGrey;
   	RGBBlue := intGrey;
   end;
   SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuFuncResetClick(Sender: TObject);
begin
	Hex.Reset;
   SetFormValues(True, True, True);
end;

procedure TfrmMain.mnuHelpAboutClick(Sender: TObject);
begin
	frmAbout.Show;
end;

procedure TfrmMain.panFloatMouseMove(Sender: TObject; Shift: TShiftState;  X, Y: Integer);
begin
	SetFloatPosition();
end;

procedure TfrmMain.ImgColourMouseMove(Sender: TObject; Shift: TShiftState;  X, Y: Integer);
begin
	SetFloatPosition();
end;

procedure TfrmMain.txtHexMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	if (Button = mbLeft) AND (ssShift in Shift) then
   	txtHex.BeginDrag(False);
end;

procedure TfrmMain.txtHexKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	strTemp : String;
begin
   strTemp := StringReplace(txtHex.Text, '#', '', []);
   if Length(strTemp) = 6 then
   begin
   	  Hex.HexFull := strTemp;
      SetFormValues(True, True, False);
   end;
end;

procedure TfrmMain.treeStoreDragDrop(Sender, Source: TObject; X, Y: Integer);
var
	tmpNode : TTreeNode;
begin
	if (Source = txtHex) or (Sender = txtHex) then
   begin
		if treeStore.DropTarget.Index > -1 then
			CreateStoreHex(treeStore.DropTarget)
	   else begin
			  tmpNode := CreateStoreGroup;
      	CreateStoreHex(tmpNode)
	   end;
   end
   else if (Source = treeStore) or (Sender = treeStore) then
   begin
   	tmpNode := treeStore.GetNodeAt(X,Y);
      if (tmpNode <> nil) then
      	if tmpNode.Level = 1 then
	      	DragStoreHex.MoveTo(tmpNode, naInsert)
         else if tmpNode.Level = 0 then
            DragStoreHex.MoveTo(tmpNode, naAddChildFirst);
   end;
end;

procedure TfrmMain.treeStoreDblClick(Sender: TObject);
begin
	if (treeStore.Selected.Index > -1) AND (treeStore.Selected.Level = 1) then
   begin
   	Hex.HexFull := PHexNode(treeStore.Selected.Data)^.HexValue;
      SetFormValues(True, True, True);
   end;
end;

procedure TfrmMain.treeStoreExpand(Sender: TObject; Node: TTreeNode);
begin
	if Node.Level = 0 then
   begin
		Node.ImageIndex := 1;
    	Node.SelectedIndex := 1;
   end;
end;

procedure TfrmMain.treeStoreCollapsed(Sender: TObject; Node: TTreeNode);
begin
	if Node.Level = 0 then
   begin
		Node.ImageIndex := 0;
  		Node.SelectedIndex := 0;
   end;
end;

procedure TfrmMain.treeStoreMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	tmpNode : TTreeNode;
begin
	if Button = mbRight then
   begin
   	tmpNode := treeStore.GetNodeAt(X, Y);
      if tmpNode <> nil then
      	tmpNode.Selected := True;
         
   	if treeStore.Selected.Index = -1
      then menuTreeDelete.Enabled := False
      else menuTreeDelete.Enabled := True;

      if (treeStore.Selected.Index = 0) AND (treeStore.Selected.Level = 0)
      then menuTreeDelete.Enabled := False
      else menuTreeDelete.Enabled := True;

      if (treeStore.Selected.Text = DEFAULT_GROUP)
      then menuTreeRename.Enabled := False
      else menuTreeRename.Enabled := True;
      
   	menuTree.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
   end
   else if (Button = mbLeft) AND (ssShift in Shift) then begin
   	DragStoreHex := treeStore.GetNodeAt(X, Y);
      if (DragStoreHex <> nil) AND (DragStoreHex.Level = 1) then
      	treeStore.BeginDrag(False);
   end;
end;

procedure TfrmMain.treeStoreDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source = txtHex) or (Source = treeStore) then
    Accept := True;
end;



procedure TfrmMain.menuTreeSaveClick(Sender: TObject);
begin
	SaveStore;
end;

procedure TfrmMain.menuTreeRevertClick(Sender: TObject);
begin
	LoadStore;
end;

procedure TfrmMain.menuTreeSortClick(Sender: TObject);
begin
	treeStore.AlphaSort();
end;

procedure TfrmMain.menuTreeRenameClick(Sender: TObject);
var
	tmpNode : TTreeNode;
begin
	tmpNode := treeStore.Selected;
   if tmpNode <> nil then
   	if tmpNode.Text <> DEFAULT_GROUP then
	   tmpNode.EditText;
end;

procedure TfrmMain.menuTreeCopyClick(Sender: TObject);
var
	tmpNode : TTreeNode;
  tmpStr : String;
begin
   tmpNode := treeStore.Selected;
   if tmpNode <> nil then
      if tmpNode.Level <> 0 then
      begin
        tmpStr := '#'+PHexNode(tmpNode.Data)^.HexValue;
        SaveTextToClipboard(PChar(tmpStr));
      end;
end;

procedure TfrmMain.menuTreeAddGroupClick(Sender: TObject);
begin
	CreateStoreGroup;
end;

procedure TfrmMain.menuTreeDeleteClick(Sender: TObject);
begin
	with treeStore.Selected do
   begin
		if Index > -1 then
   		if Level = 1 then
         begin
				if (MessageDlg('Are you sure you want to delete '+ Text+' ?', mtWarning, [mbYes, mbNo], 0) = mrYes)then
					Delete;
         end
         else
         	if (MessageDlg('Are you sure you want to delete '+ Text+' and all subitems?', mtWarning, [mbYes, mbNo], 0) = mrYes)then
					Delete;
   end;
end;

procedure TfrmMain.menuTreeAddCurrentClick(Sender: TObject);
begin
	if (treeStore.Selected <> nil) then
	begin
   	CreateStoreHex(treeStore.Selected);
   end;
end;

procedure TfrmMain.tbarMainNetscapeClick(Sender: TObject);
begin
	if frmNamedColours.Visible = True then
   	frmNamedColours.Hide
   else
		frmNamedColours.Show;
      
   frmNamedColours.Left := Mouse.CursorPos.X + 5;
   frmNamedColours.Top := Mouse.CursorPos.Y + 5;
end;

procedure TfrmMain.tbarMainDropperClick(Sender: TObject);
begin
	ImageClick(Sender);
end;

procedure TfrmMain.treeStoreEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
	if Length(S) > 100 then
   	S := Copy(S, 1, 100);
	PHexNode(Node.Data)^.Name := S;
end;

procedure TfrmMain.ImgSuggestClick(Sender: TObject);
begin
   Hex.RGBFull := GetCurrentPixelColour;
   SetFormValues(True, True, True);
end;

procedure TfrmMain.scrolRScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
	Diff : Integer;
begin
	Diff := scrollR.Position - ScrollPos;
   
   Hex.RGBRed := ScrollPos;
   scrollR.Hint := IntToStr(Hex.RGBRed);
   SetFormValues(False, True, True);

   if lockB.Checked then begin
   	scrollB.Position := scrollB.Position - Diff;
      Hex.RGBBlue := scrollB.Position;
   end;

   if lockG.Checked then begin
   	scrollG.Position := scrollG.Position - Diff;
      Hex.RGBGreen := scrollG.Position;
   end;
end;

procedure TfrmMain.scrollGScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);

var
	Diff : Integer;
begin
	Diff := scrollG.Position - ScrollPos;

   Hex.RGBGreen := ScrollPos;
   scrollG.Hint := IntToStr(Hex.RGBGreen);
   SetFormValues(False, True, True);

   if lockR.Checked then begin
   	scrollR.Position := scrollR.Position - Diff;
      Hex.RGBRed := scrollR.Position;
   end;

   if lockB.Checked then begin
   	scrollB.Position := scrollB.Position - Diff;
      Hex.RGBBlue := scrollB.Position;
   end;
end;

procedure TfrmMain.scrollBScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);

var
	Diff : Integer;
   
begin
   Diff := scrollB.Position - ScrollPos;
   
   Hex.RGBBlue := ScrollPos;
   scrollB.Hint := IntToStr(Hex.RGBBlue);
   SetFormValues(False, True, True);

   if lockR.Checked then begin
   	scrollR.Position := scrollR.Position - Diff;
      Hex.RGBRed := scrollR.Position;
   end;

   if lockG.Checked then begin
   	scrollG.Position := scrollG.Position - Diff;
      Hex.RGBGreen := scrollG.Position;
   end;
end;

procedure TfrmMain.tbarMainRevertClick(Sender: TObject);
begin
	LoadStore;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfrmMain.actPickColourExecute(Sender: TObject);
begin
     ImageClick(Sender);
end;

procedure TfrmMain.actColourDialogExecute(Sender: TObject);
begin
     dlgColour.Color := colorRGB.Color;
   if dlgColour.Execute then begin
   	Hex.RGBFull := ColorToRGB(dlgColour.Color);
      SetColorLocks(False, False, False);
      SetFormValues(True, True, True);
   end;
end;

procedure TfrmMain.actStoreSaveExecute(Sender: TObject);
begin
     SaveStore;
end;

procedure TfrmMain.actStoreRevertExecute(Sender: TObject);
begin
     LoadStore;
end;

procedure TfrmMain.actRightMergeExecute(Sender: TObject);
begin
	mergeRight.Color := Hex.RGBFull;
  MergeColours();
end;

procedure TfrmMain.actLeftMergeExecute(Sender: TObject);
begin
	mergeLeft.Color := Hex.RGBFull;
  MergeColours();
end;

procedure TfrmMain.actSetMergeGlobalExecute(Sender: TObject);
begin
	if Sender is TStaticText then
  begin
	  Hex.RGBFull := ColorToRGB((Sender as TStaticText).Color);
  	SetFormValues(True, True, True);
  end;
end;

procedure TfrmMain.actOptionsExecute(Sender: TObject);
begin
	frmOptions.Show;
end;

end.
