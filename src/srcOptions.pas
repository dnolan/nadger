unit srcOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Registry, srcMain, ComCtrls;

type
  TfrmOptions = class(TForm)
    GroupBox1: TGroupBox;
    chkClipboard: TCheckBox;
    butSave: TButton;
    butCancel: TButton;
    chkSaveOnExit: TCheckBox;
    chkClipboardHash: TCheckBox;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    lblZoom: TStaticText;
    tckZoom: TTrackBar;
    procedure butCancelClick(Sender: TObject);
    procedure butSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tckZoomChange(Sender: TObject);
    procedure chkClipboardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;



implementation

{$R *.DFM}

procedure TfrmOptions.butCancelClick(Sender: TObject);
begin
	Hide;
end;

procedure TfrmOptions.butSaveClick(Sender: TObject);
begin
	with TRegistry.Create do
   try
   	if OpenKey(KEY_HEXCOLOURS, true) then
      begin
      	 WriteInteger(KEY_CLIPBOARD, Integer(chkClipboard.Checked));
         WriteInteger(KEY_CLIPBOARD_HASH, Integer(chkClipboardHash.Checked));
         WriteInteger(KEY_SAVEONEXIT, Integer(chkSaveOnExit.Checked));
         WriteInteger(KEY_ZOOMRATIO, tckZoom.Position);
      end;
   finally
   	free;
   end;

   frmMain.AppOptions.bolCopyHexToClipboard := chkClipboard.Checked;
   frmMain.AppOptions.bolCopyHexToClipboardHash := chkClipboardHash.Checked;
   frmMain.AppOptions.bolSaveOnExit := chkSaveOnExit.Checked;
   frmMain.AppOptions.intZoomRatio := tckZoom.Position;
   
   Hide;
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
	chkClipboard.Checked := frmMain.AppOptions.bolCopyHexToClipboard;
  chkClipboardHash.Checked := frmMain.AppOptions.bolCopyHexToClipboardHash;
  chkSaveOnExit.Checked := frmMain.AppOptions.bolSaveOnExit;
  tckZoom.Position := frmMain.AppOptions.intZoomRatio;
end;

procedure TfrmOptions.tckZoomChange(Sender: TObject);
begin
	lblZoom.Caption := IntToStr(tckZoom.Position)+'/1';
end;

procedure TfrmOptions.chkClipboardClick(Sender: TObject);
begin
  if chkClipboard.Checked = True then
		chkClipboardHash.Enabled := True
  else begin
		chkClipboardHash.Enabled := False;
    chkClipboardHash.Checked := False;
  end;
end;

end.
