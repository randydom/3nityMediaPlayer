unit UfrmSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, VssDockForm, mplayer;

type

  TfrmSettings = class(TVssDockForm)
    btnMReset: TSpeedButton;
    btnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure PropertyInc(prop: integer; value : integer);
    procedure ScrollBarChange(Sender: TObject);
    procedure ResetbuttonClick(Sender: TObject);
    procedure btnMResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
  private
    type
    TsettingsEntry = record
      scr: TScrollBar;
      lblCaption: TLabel;
      lblValue : Tlabel;
      btnReset : TspeedButton;
    end;
    { Private declarations }
  private
    settingsCtl : array[0..MAX_PROP_ENTRYS] of TsettingsEntry;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormWmNcHittest(var msg: TWMNCHitMessage); message WM_NCHITTEST;
  public
    { Public declarations }
    procedure EnableSetting(setting : integer; value : boolean);
    procedure DoLocalize ; override;
  end;


var
  frmSettings: TfrmSettings;


implementation
uses locale, UfrmMain;
{$R *.dfm}



procedure TfrmSettings.EnableSetting(setting: integer; value: boolean);
begin
  if setting <= high(settingsCtl) then begin
    with settingsctl[setting] do begin
      scr.enabled := value;
      btnReset.enabled  := value;
    end;
  end;
end;

procedure TfrmSettings.FormCreate(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to high(settingsCtl) do begin
    with settingsCtl[i] do begin
        lblcaption := Tlabel.Create(self);
        lblcaption.Parent := self;
        lblcaption.Caption := propertyEntrys[i].name;

        scr := Tscrollbar.Create(self);
        scr.Parent := self;
        scr.SetBounds(80,i* 22+5 + btnClose.Top + btnClose.Height,200,20 );
        scr.Min := propertyEntrys[i].min;
        scr.Max := propertyEntrys[i].max;
        scr.Position := 0;

        lblcaption.SetBounds(6,scr.Top + (scr.Height - lblcaption.Height) div 2,
                             scr.Left , lblcaption.Height );


        lblValue := Tlabel.Create(self);
        lblValue.Parent := self;
        lblValue.SetBounds(scr.Left + scr.Width, lblcaption.Top,30, scr.Height );
        lblvalue.Alignment := tarightjustify;

        btnReset := Tspeedbutton.Create(self);
        btnReset.Parent := self;
        btnReset.SetBounds(lblvalue.Left + lblvalue.Width+2,scr.Top ,88,scr.Height );
        btnReset.Transparent := true;
        btnreset.Flat := true;
        btnReset.Caption := 'Reset';
        btnreset.Font.Style := btnreset.Font.Style +[fsBOld];
        btnreset.Font.Color:=clblack;//clbtntext;

        lblcaption.tag := i;
        scr.Tag := i;
        lblvalue.Tag := i;
        btnreset.Tag := i;

        scr.Position := frmMain.mpo.propertyvalues[i].Value;
        scr.OnChange := ScrollBarChange;
        btnreset.OnClick := ResetbuttonClick;
        lblValue.Caption := inttostr(scr.Position );

    end;
  end;
  //btnMReset.Top :=    settingsctl[high(settingsCtl)].scr.Top +
  //                      settingsctl[high(settingsCtl)].scr.Height *2;

  btnMreset.Font.Style := btnMreset.Font.Style +[fsBOld];

  btnMReset.Left := settingsctl[high(settingsCtl)].scr.Left +
                    settingsctl[high(settingsCtl)].scr.Width div 2 -
                    btnMReset.Width div 2; 

  //self.ClientHeight  := btnMReset.Top + btnMReset.Height;
  self.ClientHeight := settingsctl[high(settingsCtl)].btnReset.Top +
                       settingsctl[high(settingsCtl)].btnReset.Height +
                       5;

  self.Clientwidth := settingsctl[high(settingsCtl)].btnReset.left +
                        settingsctl[high(settingsCtl)].btnReset.Width + 4;

  btnClose.Left := Self.ClientWidth - btnClose.Width - 4;
end;


procedure TfrmSettings.FormHide(Sender: TObject);
begin
  frmMain.MSettings.Checked:=False;
  frmMain.BSettings.Down:=False;
  popupparent := frmMain;
  popupmode := pmExplicit;
end;

procedure TfrmSettings.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, SC_MOVE+2, 0);
end;

procedure TfrmSettings.FormShow(Sender: TObject);
begin
  frmMain.MSettings.Checked:=true;
  frmMain.BSettings.Down:=true;
end;

procedure TfrmSettings.FormWmNcHittest(var msg: TWMNCHitMessage);
begin
  inherited;
  if (msg.Result = HTLEFT) or (msg.Result = HTRIGHT) or
     (msg.Result = HTTOP) or (msg.Result = HTBOTTOM) or
     (msg.Result = HTBOTTOMLEFT) or (msg.Result = HTBOTTOMRIGHT) or
     (msg.Result = HTTOPLEFT) or (msg.Result = HTTOPRIGHT) then
     msg.Result := HTNOWHERE;
end;

procedure TfrmSettings.CreateParams(var Params: TCreateParams);
begin
  inherited;
  WITH Params DO
    Style := (Style OR WS_POPUP) AND (NOT WS_DLGFRAME);
end;

procedure TfrmSettings.DoLocalize;
var i : integer;
begin
  inherited;
  for i := 0 to high(settingsCtl) do begin

    case i of
      0: settingsCtl[0].lblCaption.Caption := LOCstr.Brightness;
      1: settingsCtl[1].lblCaption.Caption := LOCstr.Contrast;
      2: settingsCtl[2].lblCaption.Caption := LOCstr.Saturation;
      3: settingsCtl[3].lblCaption.Caption := LOCstr.Hue;
      4: settingsCtl[4].lblCaption.Caption := LOCstr.Gamma;
      5: settingsCtl[5].lblCaption.Caption := LOCstr.SubScale;
    end;

   settingsCtl[i].btnReset.Caption := LOCstr.ResetSetting;

  end;
  btnMReset.Caption := LOCstr.MResetSetting;
  Caption := LOCstr.SettingsformCaption;
end;

procedure TfrmSettings.ResetbuttonClick(Sender: TObject);
var
 i: integer;
begin
     if sender <> nil  then begin
        i := (sender as TSpeedButton).Tag;
        if (sender as TSpeedButton).Enabled  then begin
          with settingsCtl[i] do begin
            scr.Position  := propertyEntrys[i].def;
          end;
        end;
     end;
end;

procedure TfrmSettings.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSettings.btnMResetClick(Sender: TObject);
var
 i: integer;
begin
     for i := 0 to high(settingsCtl) do begin
       ResetbuttonClick (settingsCtl[i].btnReset);
     end;

end;

procedure TfrmSettings.ScrollBarChange(Sender: TObject);
var
 i: integer;
begin
     if sender <> nil  then begin
        i := (sender as Tscrollbar).Tag;
        with settingsCtl[i] do begin
          frmMain.mpo.setproperty(i,scr.Position);
          lblValue.Caption := inttostr(frmMain.mpo.Propertyvalues[i].value);
        end;
     end;
end;

procedure TfrmSettings.PropertyInc(prop: integer; value : integer);
var
  newvalue : integer;
begin

  with settingsCtl[prop].scr do begin
    newvalue := Position + value;
    if newvalue < propertyEntrys[prop].min  then
      newvalue := propertyEntrys[prop].min;
    if newvalue > propertyEntrys[prop].max   then
      newvalue := propertyEntrys[prop].max;

    if Position <> newvalue then
      Position := newvalue
    else
      frmMain.mpo.setproperty(prop,newvalue);
  end;

end;

end.

