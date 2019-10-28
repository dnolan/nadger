program Nadger;

uses
  Forms,
  srcMain in 'srcMain.pas' {frmMain},
  srcOptions in 'srcOptions.pas' {frmOptions},
  srcAbout in 'srcAbout.pas' {frmAbout},
  srcHexColours in 'srcHexColours.pas',
  srcNamedColours in 'srcNamedColours.pas'; {frmNamedColours}
  //srcSplash in 'srcSplash.pas' {frmSplash};
  //srcMeasure in 'srcMeasure.pas' {frmMeasure};

{$R *.RES}

begin
  Application.Initialize;
  //FrmSplash := TfrmSplash.Create(Application);
  //FrmSplash.Show;
  //FrmSplash.Update; //force update
  Application.Title := 'Nadger';
  Application.CreateForm(TfrmMain, frmMain);
  //Application.CreateForm(TfrmMeasure, frmMeasure);
  //FrmSplash.Free;

  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmNamedColours, frmNamedColours);
  Application.Run;
end.
