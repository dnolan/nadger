unit srcAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmAbout = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    butClose: TButton;
    Label3: TLabel;
    procedure butCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}

procedure TfrmAbout.butCloseClick(Sender: TObject);
begin
	Hide;
end;

end.
