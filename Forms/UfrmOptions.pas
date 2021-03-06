{

	3nity Media Player, an MPlayer frontend for Windows

	Copyright (C) 2010-2019 Nicolas DEOUX  < nicolas.deoux@gmail.com >
									<http://3nitysoftwares.com>

    Original source code 2008-2010 Visenri  <http://sourceforge.net/projects/mpui-ve/>
    Original source code (2005) by Martin J. Fiedler <martin.fiedler@gmx.net>>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
{Special Note for Developers:

    This code can be compiled using Embarcadero Delphi XE2 -> to Delphi 10.3 Rio( i'm using XE7 )
    You will need to install Alphaskin and OmniThreadLibrary components.
    For special questions or if you want to hire a delphi developer you can contact me:  nicolas.deoux@gmail.com
}

unit UfrmOptions;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, FormLocal,
  StdCtrls, ShellAPI, Menus, ExtCtrls, ComCtrls,ActiveX ,ShlObj, ImgList, Config, mplayer, AutoselectEdits,
  UVssColorPicker, sPageControl, sPanel, sEdit, sConst, sTrackBar, sComboBoxes, acntUtils,
  sComboBox, sFontCtrls, Dialogs, Buttons, sBitBtn, Registry, sListBox,
  sCheckListBox;

type


  TfrmOptions = class(TFormLocal)
    BOK: TButton;
    BApply: TButton;
    BSave: TButton;
    BClose: TButton;
    EParams: TEdit;
    LHelp: TLabel;
    Pc: TsPageControl;
    TabGeneral: TsTabSheet;
    TabAudio: TsTabSheet;
    TabVideo: TsTabSheet;
    LAudioOut: TLabel;
    CAudioOut: TComboBox;
    CAudioDev: TComboBox;
    LAudioDev: TLabel;
    CPostproc: TComboBox;
    LPostproc: TLabel;
    LAspect: TLabel;
    LDeinterlaceAlg: TLabel;
    CDeinterlaceAlg: TComboBox;
    LDeinterlace: TLabel;
    CDeinterlace: TComboBox;
    lblOverlay: TLabel;
    CAspect: TComboBox;
    LLanguage: TLabel;
    CLanguage: TComboBox;
    CIndex: TCheckBox;
    CPriorityBoost: TCheckBox;
    lblVideoOut: TLabel;
    CVideoOut: TComboBox;
    CvideoEq: TComboBox;
    lblVideoeq: TLabel;
    CSoftVol: TCheckBox;
    imgLOpt: TImageList;
    chkUseVolcmd: TCheckBox;
    LParams: TLabel;
    chkDirectRender: TCheckBox;
    chkDrawSlices: TCheckBox;
    chkDoubleBuffer: TCheckBox;
    Shape4: TShape;
    Shape5: TShape;
    lblVideoScaler: TLabel;
    CvideoScaler: TComboBox;
    chkTryScaler: TCheckBox;
    Shape6: TShape;
    trkAc3Comp: TsTrackBar;
    lblAc3Comp: TLabel;
    lblAc3CompVal: TLabel;
    TabCaching: TsTabSheet;
    imgListDrive: TImageList;
    lblFullScreenMonitor: TLabel;
    TabOSDSub: TsTabSheet;
    lblFontPath: TLabel;
    TabDvd: TsTabSheet;
    chkUseDvdNav: TCheckBox;
    Shape1: TShape;
    Shape2: TShape;
    lblAutosync: TLabel;
    LblAVsyncperframe: TLabel;
    chkDeinterlaceDVD: TCheckBox;
    lblFontEncoding: TLabel;
    cFontEncoding: TComboBox;
    lblAudioDecodeChannels: TLabel;
    lblAudiofilterchannels: TLabel;
    Shape3: TShape;
    chkUseliba52: TCheckBox;
    chkForceEvenWidth: TCheckBox;
    cpkOverlay: TVssColorPicker;
    chkAssSubs: TCheckBox;
    chkFontConfig: TCheckBox;
    chkAutoLoadSubs: TCheckBox;
    cpkSubAssColor: TVssColorPicker;
    cpkSubAssBorderColor: TVssColorPicker;
    cpkSubBgColor: TVssColorPicker;
    lblSubAssBorderColor: TLabel;
    lblSubAssColor: TLabel;
    lblSubBgColor: TLabel;
    Shape7: TShape;
    Label1: TLabel;
    skinComboBox: TsComboBoxEx;
    txtFontPath: TsFontComboBox;
    TabFileAssoxp7: TsTabSheet;
    sBitBtnRegAss: TsBitBtn;
    TFass: TsCheckListBox;
    sBitBtnSelAll: TsBitBtn;
    sBitBtnSelNone: TsBitBtn;
    Label2: TLabel;

    procedure FormHide(Sender: TObject);
    procedure trkAc3CompChange(Sender: TObject);
    procedure PcChange(Sender: TObject);
    procedure EParamsKeyPress(Sender: TObject; var Key: Char);
    procedure BCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LHelpClick(Sender: TObject);
    procedure BApplyClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);
    procedure SomethingChanged(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CAudioOutChange(Sender: TObject);
    procedure CVideoOutChange(Sender: TObject);
    procedure PcDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure Timer1Timer(Sender: TObject);
        procedure changeskin(Sender: TObject; var Done: Boolean);
    procedure skinComboBoxChange(Sender: TObject);
    procedure CLanguageDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure sBitBtnRegAssClick(Sender: TObject);
    procedure sBitBtnSelNoneClick(Sender: TObject);
    procedure sBitBtnSelAllClick(Sender: TObject);
    procedure txtFontPathChange(Sender: TObject);
    procedure TabFileAssoxp7Show(Sender: TObject);
    //procedure CVideoEqChange(Sender: TObject);
  private
    { Private declarations }
    HelpFile:string;

    txtvideoout : TEditAutoselect;
    //txtFontPath : TEditAutoselect;

    txtCache : array[0..MAX_CACHE_ENTRYS] of TEditNumeric;
    lblCache : array[0..MAX_CACHE_ENTRYS] of Tlabel;
    txtFullScreenMonitor : TEditNumeric;
    txtAutoSync : TEditNumeric;
    txtAVsyncPerFrame : TEditNumeric;
    txtAudioDecodeChannels : TEditNumeric;
    txtAudioFilterChannels : TEditNumeric;
    procedure SetFass;
    procedure GetFass;
  protected

  public
    { Public declarations }
    Changed:boolean;
    procedure ApplyValues;
    procedure LoadValues;
    procedure LoadAudiooutValue;
    procedure DoLocalize(); override;
    procedure GenerateSkinsList;
  end;


  ASSOCIATIONLEVEL = (AL_MACHINE, AL_EFFECTIVE, AL_USER);

  ASSOCIATIONTYPE = (AT_FILEEXTENSION, AT_URLPROTOCOL, AT_STARTMENUCLIENT, AT_MIMETYPE);

  IApplicationAssociationRegistration = interface(IUnknown)
    ['{4e530b0a-e611-4c77-a3ac-9031d022281b}']
    function QueryCurrentDefault(pszQuery: PWChar; atQueryType: ASSOCIATIONTYPE; alQueryLevel: ASSOCIATIONLEVEL; out ppszAssociation: PPWideChar): HRESULT; stdcall;
    function QueryAppIsDefault(pszQuery: PWChar; atQueryType: ASSOCIATIONTYPE; alQueryLevel: ASSOCIATIONLEVEL; pszAppRegistryName: PWChar; out pfDefault: PBool): HRESULT; stdcall;
    function QueryAppIsDefaultAll(alQueryLevel: ASSOCIATIONLEVEL; pszAppRegistryName: PWChar; out pfDefault: PBool): HRESULT; stdcall;
    function SetAppAsDefault(pszAppRegistryName: PWChar; pszSet: PWChar; atSetType: ASSOCIATIONTYPE): HRESULT; stdcall;
    function SetAppAsDefaultAll(pszAppRegistryName: PWChar): HRESULT; stdcall;
    function ClearUserAssociations: HRESULT; stdcall;
  end;


  IApplicationAssociationRegistrationUI = interface(IUnknown)
  ['{1f76a169-f994-40ac-8fc8-0959e8874710}']
     function LaunchAdvancedAssociationUI(pszAppRegName: PWideChar): HRESULT;  stdcall;
  end;

const CLSID_ApplicationAssociationRegistration: TGUID = '{591209c7-767b-42b2-9fba-44ee4615f2c7}';
  IID_IApplicationAssociationRegistration: TGUID = '{4e530b0a-e611-4c77-a3ac-9031d022281b}';


    CLSID_ApplicationAssociationRegistrationUI: TGUID = '{1968106d-f3b5-44cf-890e-116fcb9ecef1}';
  IID_IApplicationAssociationRegistrationUI: TGUID = '{1f76a169-f994-40ac-8fc8-0959e8874710}';

 //source: http://coding.indvikleren.dk/file-associations-in-windows

const DefaultFass='1264,126l,13g2,13ga,13gp,13gp2,13gpp,13gpp2,1aac,1ac3,1aif,1aifc,1aiff,1amr,1ape,'
        + '1asf,1au,1avi,1awb,1bdm,1bdmv,1bik,1bin,1cdg,1clpi,1cpi,1cpk,1dat,1divx,1dv,1f4a,'
        + '1f4b,1f4v,1flac,1flc,1fli,1flv,1jsv,1m1v,1m2t,1m2ts,1m2v,1m3u,1m4a,1m4b,1m4v,1mjpg,'
        + '1mka,1mkv,1moov,1mov,1mp1,1mp2,1mp2,1mp3,1mp4,1mpa,1mpc,1mpe,1mpeg,1mpg,1mpga,1mpl,'
        + '1mpls,1mpp,1mpv,1mts,1mxf,1nsa,1nsv,1nuv,1oga,1ogg,1ogg,1ogm,1ogv,1ogx,1pcm,1pls,'
        + '1pva,1qcp,1qt,1qtvr,1ra,1ram,1rec,1rm,1rmvb,1roq,1rv,1smk,1snd,1spl,1spx,1str,1swf,'
        + '1tak,1trp,1ts,1ty,1vdr,1viv,1vivo,1vob,1voc,1vqf,1w64,1wav,1webm,1wma,1wmv,1wv,1wvp,1y4m';
procedure regAss();
procedure regAssWindows8();

var
  frmOptions: TfrmOptions;
  fass: string;

implementation
uses  UfrmMain, Locale;

type PDSEnumCallback=function(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;
//function DirectSoundEnumerate(lpDSEnumCallback:PDSEnumCallback; lpContext:pointer):HRESULT;
//         stdcall; external 'dsound.dll' name 'DirectSoundEnumerateA';
function DirectSoundEnumerate(lpDSEnumCallback:PDSEnumCallback; lpContext:pointer):HRESULT;
         stdcall; external 'dsound.dll' name 'DirectSoundEnumerateW';

{$R *.dfm}



procedure TfrmOptions.BCloseClick(Sender: TObject);
begin
  Close;
  application.OnIdle := frmmain.DoIdle;
  
end;

procedure TfrmOptions.DoLocalize;
var i : integer;
begin
  inherited;
  Font.Charset:=CurrentLocaleCharset;
  LHelp.Font.Charset:=CurrentLocaleCharset;

  //form texts
  Caption:=LOCstr.OptionsFormCaption;
  BOK.Caption:=LOCstr.OptionsFormOK;
  BApply.Caption:=LOCstr.OptionsFormApply;
  //implémenter ici les traduc
    sBitBtnRegass.Caption:=LOCstr.OptionsFormAssociate;
    sBitBtnSelAll.Caption:=LOCstr.OptionsFormSelectAll;
    sBitBtnSelNone.Caption:=LOCstr.OptionsFormSelectNone;

  BSave.Caption:=LOCstr.OptionsFormSave;
  BClose.Caption:=LOCstr.OptionsFormClose;
  LHelp.Caption:=LOCstr.OptionsFormHelp;
  LParams.Caption:=LOCstr.OptionsFormParams;

  //general tab
  lblFullScreenMonitor.Caption := LOCstr.FullScreenMonitor;
  LLanguage.Caption:=LOCstr.Language;
  CIndex.Caption:=LOCstr.OptionsFormIndex;
  CPriorityBoost.Caption:=LOCstr.OptionsFormPriorityBoost;

  lblAutosync.Caption := LOCstr.Autosync;
  LblAVsyncperframe.caption := LOCstr.AVsyncperframe;

  //audio tab
  LAudioOut.Caption:=LOCstr.OptionsFormAudioOut;
  LAudioDev.Caption:=LOCstr.OptionsFormAudioDev;
  lblAudiofilterchannels.Caption := LOCstr.OptionsFormAudioFilterChannels;
  CSoftVol.Caption:=LOCstr.OptionsFormSoftVol;
  chkUseVolcmd.Caption := LOCstr.OptionsFormUseVolcmd;
  lblAudioDecodeChannels.Caption := LOCstr.OptionsFormAudioDecodeChannels;
  lblAc3Comp.Caption := LOCstr.OptionsFormAc3Comp;
  chkUseliba52.Caption := LOCstr.OptionsFormUseliba52;

  //video tab
  lblVideoOut.Caption := LOCstr.OptionsFormVideoOut;
  lblOverlay.Caption := LOCstr.OptionsFormOverlay;

  chkForceEvenWidth.Caption := LOCstr.ForceEvenWidth;
  chkDirectRender.Caption  := LOCstr.DirectRender;
  chkDoubleBuffer.Caption := LOCstr.DoubleBuffer;
  chkDrawSlices.Caption := LOCstr.DrawSlices;

  lblVideoeq.Caption  := LOCstr.OptionsFormVideoeq;
  lblVideoScaler.Caption := LOCstr.VideoScaler;
  chkTryScaler.Caption := LOCstr.TryScaler;

  LAspect.Caption:=LOCstr.Aspect;
  LDeinterlace.Caption:=LOCstr.Deinterlace;
  LDeinterlaceAlg.Caption := LOCstr.DeinterlaceAlg ;
  LPostproc.Caption:=LOCstr.OptionsFormPostproc;


  if Clanguage.Items.Count = 0 then begin
    CLanguage.Clear;
    CLanguage.Items.Add(LOCstr.AutoLocale);
    for i:=0 to High(Locales) do
      CLanguage.Items.Add(Locales[i].Name);
  end else begin
//    CLanguage.Items[0]:= LOCstr.AutoLocale;
    changeComboTstring(Clanguage,0, LOCstr.AutoLocale);
  end;

  if CAspect.items.Count =0 then begin // combos that don't do localize, only first time
    BuildOptCombo(VideoOutMap ,cVideoOut);
    BuildOptCombo(Videoeqmap ,cVideoEq);
  end;

  changeComboTstring(cVideoOut,cVideoOut.Items.Count-1,LOCstr.VideoOutUser);
  changecomboTstring(cVideoEq,0, LOCstr.VideoeqOff);

  if caudioout.Items.Count = 0 then
    BuildOptCombo(AudioOutMap,cAudioOut);

  BuildOptCombo(LOCstr.AspectMap,CAspect);
  BuildOptCombo(LOCstr.DeinterlaceAlgMap,CDeinterlaceAlg);
  BuildOptCombo(LOCstr.OffOnAuto,CDeinterlace);

  BuildOptCombo(LOCstr.Postproc, cPostProc);
  BuildOptCombo(LOCstr.AudioOut, cAudioOut);
  BuildOptCombo(LOCstr.OffOnAUto, CVideoScaler);

  Tabgeneral.Caption := LOCstr.OptionsFormGeneral;
  Tabaudio.Caption := LOCstr.OptionsFormAudio;
  Tabvideo.Caption := LOCstr.OptionsFormVideo;
  Tabcaching.Caption := LOCstr.OptionsFormCaching;
  TabOsdSub.Caption := LOCstr.OptionsFormOSDSub;

  if cFontEncoding.Items.Count =0 then begin
      cFontEncoding.Clear;
      BuildOptCombo(mplayerfontEncodingsMap, cFontEncoding);
  end;
  BuildOptCombo(LOCstr.FontEncodings, cFontEncoding);
  lblFontEncoding.Caption := LOCstr.FontEncoding;
  lblFontPath.Caption :=  LOCstr.FontPath;

  chkFontConfig.Caption := LOCstr.FontConfig;
  chkAssSubs.Caption := LOCstr.SubAss;
  chkAutoLoadSubs.Caption := LOCstr.SubAutoLoad;

  lblSubAssColor.Caption := LOCstr.SubAssColor;
  lblSubAssBorderColor.Caption := LOCstr.SubAssBorderColor;
  lblSubBgColor.Caption := locstr.SubBgColor;


  lblcache[CACHE_TYPE_DEFAULT].Caption  := LOCstr.MediaDefault;
  lblcache[CACHE_TYPE_FIXED].Caption := LOCstr.MediaFixed;
  lblcache[CACHE_TYPE_RAMDISK].Caption := LOCstr.MediaRamdisk;
  lblcache[CACHE_TYPE_CDROM].Caption := LOCstr.MediaCdrom;
  lblcache[CACHE_TYPE_REMOVABLE].Caption := LOCstr.MediaRemovable;
  lblcache[CACHE_TYPE_NETWORK].Caption := LOCstr.mediaNetwork;
  lblcache[CACHE_TYPE_INTERNET].Caption := LOCstr.MediaInternet;
  lblcache[CACHE_TYPE_DVD].Caption := LOCstr.MediaDvd;

  //dvd tab
  chkUseDvdNav.Caption := LOCstr.UseDvdNav;
  chkDeinterlaceDVD.Caption := LOCstr.DeinterlaceDVD;
end;


procedure TfrmOptions.FormShow(Sender: TObject);
begin
  GenerateSkinsList;
  frmMain.MOptions.Checked := true;
  LoadValues;
  Changed:=false;

  HelpFile:=frmMain.mpo.Mplayerpath +'man_page.html';
  if not FileExists(HelpFile) then begin
    HelpFile:=frmMain.mpo.Mplayerpath+'MPlayer.html';
    if not FileExists(HelpFile) then
      HelpFile:='';
  end;
  if length(HelpFile)>0 then begin
    LHelp.Visible:=true;
    HelpFile:=#34+HelpFile+#34;
  end else
    LHelp.Visible:=false;
end;
procedure TfrmOptions.FormHide(Sender: TObject);
begin
  frmMain.MOptions.Checked := false;
end;



procedure TfrmOptions.LHelpClick(Sender: TObject);
begin
  if length(HelpFile)>0 then
    ShellExecute(Handle,'open',PChar(HelpFile),nil,nil,SW_SHOW);
end;

procedure TfrmOptions.LoadAudiooutValue;
begin
  if (cAudiodev.Tag <> 0) and
     (frmMain.mpo.AudioDev < cAudiodev.Items.Count ) then // if enumerated
    CAudioDev.ItemIndex:=frmMain.mpo.AudioDev;
end;

procedure TfrmOptions.LoadValues;
var i : integer;
begin
 with frmMain.mpo do begin
  CAudioOut.ItemIndex:=AudioOut;
  LoadAudioOutValue;
  txtAudioFilterChannels.Text := AudioFilterChannels;
  CPostproc.ItemIndex:=Postproc;
  CAspect.ItemIndex:=Aspect;
  CDeinterlaceAlg.ItemIndex:=DeinterlaceAlg;
  Cdeinterlace.ItemIndex := Deinterlace ;
  CLanguage.ItemIndex:=opt.DefaultLocale+1;
  CIndex.Checked:=ReIndex;
  CSoftVol.Checked:=SoftVol;
  CPriorityBoost.Checked:=PriorityBoost;

  txtAutosync.Text := inttostr(Autosync);
  txtAVsyncPerFrame.Text := inttostr(AVsyncPerFrame);

  EParams.Text:=Params;
  cpkOverlay.SolidColor := overlaycolor;
  //cpkOverlay.HasAlpha := True;

  chkForceEvenWidth.Checked := Opt.ForceEvenWidth;

  chkDirectrender.Checked := DirectRender;
  chkDoublebuffer.Checked := DoubleBuffer;
  chkDrawslices.Checked := DrawSlices;

  chkTryscaler.Checked := TryScaler;
  CVideoScaler.ItemIndex := VideoScaler;

  CAudioOutChange(nil);
  chkUseVolcmd.Checked := UseVolCmd;

  txtAudioDecodechannels.Text := inttostr(AudioDecodechannels);
  trkAc3Comp.Position := Ac3Comp;
  chkUseliba52.Checked := Useliba52;

  checkComboOptStr(VideoOutMap , cVideoOut , videoout);
  txtvideoout.Text := videoout;
  CVideoOutChange(nil);

  checkComboOptStr(VideoeqMap , cVideoEq , videoeq);


  for i := 0 to MAX_CACHE_ENTRYS do begin
       txtcache[i].Text := inttostr(Cachesize[i]);
  end;

  checkComboOptStr(mplayerfontEncodingsMap,CFontEncoding,FontEncoding);
  txtFontPath.ItemIndex := txtFontPath.Items.IndexOf(FontPath);


  chkFontConfig.Checked := FontConfig;
  chkAssSubs.Checked := SubAss;
  chkAutoLoadSubs.Checked := SubAutoLoad;

  cpkSubAssColor.AlphaColor := SubAssColor;
  cpkSubAssBorderColor.AlphaColor := SubAssBorderColor;
  cpkSubBgColor.AlphaColor := SubBgColor;

  chkUseDvdNav.Checked := UseDvdNav;
  chkDeinterlaceDVD.Checked := DeinterlaceDVD;
 end;
 txtFullScreenMonitor.Text := inttostr(opt.FullScreenMonitor);

end;

function EnumFunc(lpGuid:PGUID; lpcstrDescription,lpcstrModule:PChar; lpContext:pointer):LongBool; stdcall;
begin
  TComboBox(lpContext^).Items.Add(lpcstrDescription);
  Result:=True;
end;
procedure TfrmOptions.PcChange(Sender: TObject);
begin
  if tabaudio.Visible then //enumerate devices only if tabaudio is clicked
    if cAudiodev.Tag = 0 then begin // only if not already enumerated
        DirectSoundEnumerate(EnumFunc,@CAudioDev);
        cAudiodev.Tag := 1;
        LoadAudiooutValue;
    end;



end;

procedure TfrmOptions.PcDrawTab(Control: TCustomTabControl; TabIndex: Integer;
  const Rect: TRect; Active: Boolean);
var txtName : string;
  rectT : Trect;
  iconSize : integer;
begin
exit;
  rectT := rect;
  if active  then begin
    control.Canvas.Brush.Color := clhighlight;
    control.Canvas.font.Color := clHighlightText;
    control.Canvas.Pen.Color := control.Canvas.Brush.Color;
    control.Canvas.Rectangle(rect);
  end;

  iconsize := imglOpt.Width;
  imglOpt.Draw(control.Canvas,Rect.Left +1,Rect.Top + (Rect.Bottom - Rect.Top -16) div 2 ,
       TabIndex, dsNormal,itImage);

  txtname := ((control as tpagecontrol).Pages[TabIndex] as Ttabsheet).Caption;
  control.Canvas.Brush.Style := bsclear;
  Rectt.Left  := Rectt.Left + iconsize;
  Control.canvas.TextRect(Rectt,txtName,[tfVerticalCenter, tfSingleLine, tfCenter]);
end;

procedure TfrmOptions.changeskin(Sender: TObject; var Done: Boolean);
begin

  //Loading := True;

  //Done:=true;
  //Application.OnIdle:=nil;
end;

procedure TfrmOptions.skinComboBoxChange(Sender: TObject);
begin
 //Application.OnIdle:=changeskin;

end;

procedure TfrmOptions.ApplyValues;
var i : integer;
begin
  with frmMain.mpo do begin
    StartPropertyChange;

    AudioOut:=CAudioOut.ItemIndex;
    if (cAudiodev.Tag <> 0) and
       (CAudioDev.ItemIndex >= 0) then // if enumerated
      AudioDev:=CAudioDev.ItemIndex;
    AudioFilterChannels :=txtAudioFilterChannels.Text;
    Postproc:=CPostproc.ItemIndex;
    Aspect:=CAspect.ItemIndex;
    DeinterlaceAlg:=CDeinterlaceAlg.ItemIndex;
    Deinterlace  := Cdeinterlace.ItemIndex;
    ReIndex:=CIndex.Checked;
    SoftVol:=CSoftVol.Checked;
    PriorityBoost:=CPriorityBoost.Checked;

    try Autosync :=  strtoint(txtAutosync.Text); except end;
    try AVsyncPerFrame :=  strtoint(txtAVsyncPerFrame.Text); except end;

    Params:=Trim(EParams.Text);
    overlaycolor := cpkOverlay.SolidColor;

    opt.ForceEvenWidth := chkForceEvenWidth.Checked;

    DirectRender := chkDirectRender.Checked;
    DoubleBuffer := chkDoubleBuffer.Checked;
    DrawSlices := chkDrawSlices.Checked;

    TryScaler := chkTryscaler.Checked;
    VideoScaler := CVideoScaler.ItemIndex;

    UseVolCmd := chkUseVolcmd.Checked;

    try AudioDecodechannels := strtoint(txtAudioDecodechannels.Text); except end;
    Ac3Comp := strtoint(lblAc3CompVal.Caption);
    Useliba52 := chkUseliba52.Checked;

    videoout := txtvideoout.Text;
    videoeq :=  VideoeqMap[Cvideoeq.itemindex];

    for i := 0 to MAX_CACHE_ENTRYS do begin
      try
        Cachesize[i] := strtoint(txtcache[i].Text);
      except
      end;
    end;
    if (CFontEncoding.ItemIndex >=0) and
       (CFontEncoding.ItemIndex <= high(mplayerfontEncodingsMap))  then
      FontEncoding := mplayerfontEncodingsMap[CFontEncoding.ItemIndex];
    FontPath := txtFontPath.Items[txtFontPath.ItemIndex];

    FontConfig := chkFontConfig.Checked;
    SubAss := chkAssSubs.Checked;
    SubAutoLoad := chkAutoLoadSubs.Checked;

    SubAssColor := cpkSubAssColor.AlphaColor;
    SubAssBorderColor := cpkSubAssBorderColor.AlphaColor;
    SubBgColor := cpkSubBgColor.AlphaColor;

    UseDvdNav := chkUseDvdNav.Checked;
    DeinterlaceDVD := chkDeinterlaceDVD.Checked;

    EndPropertyChange;
    frmMain.UpdateVolumeSlider;
  end;

  opt.FullScreenMonitor := strtoint(txtFullScreenMonitor.Text);

  if Changed then begin
    opt.DefaultLocale:=CLanguage.ItemIndex-1;
    ActivateLocale(opt.DefaultLocale);
    Changed:=false;
  end;
end;

procedure TfrmOptions.BApplyClick(Sender: TObject);
begin
  ApplyValues;
  Config.Save('');
  LoadValues;
  application.OnIdle := frmmain.DoIdle;

end;

procedure TfrmOptions.BOKClick(Sender: TObject);
begin
  ApplyValues;
  Close;
  application.OnIdle := frmmain.DoIdle;
end;
procedure TfrmOptions.BSaveClick(Sender: TObject);
begin
  ApplyValues;
  Config.Save('');
  LoadValues;
  application.OnIdle := frmmain.DoIdle;
end;

procedure TfrmOptions.SomethingChanged(Sender: TObject);
begin
  if sender <> nil then
    Changed:=true;
end;

procedure TfrmOptions.TabFileAssoxp7Show(Sender: TObject);
begin
  if (Win32MajorVersion >= 6)  then
    begin

        if (Win32MinorVersion >=2) then
        begin

         TFass.Enabled:=false;
         TFass.Visible:=false;
         sBitBtnSelAll.Enabled:=false;
         sBitBtnSelAll.Visible:=false;
         sBitBtnSelNone.Enabled:=false;
         sBitBtnSelNone.Visible:=false;
         Label2.Enabled:=true;
         Label2.Visible:=true;
        end
        else
        begin
          TFass.Enabled:=true;
         TFass.Visible:=true;
         sBitBtnSelAll.Enabled:=true;
         sBitBtnSelAll.Visible:=true;
         sBitBtnSelNone.Enabled:=true;
         sBitBtnSelNone.Visible:=true;
         Label2.Enabled:=false;
         Label2.Visible:=false;
        end;

    end;
end;

procedure TfrmOptions.Timer1Timer(Sender: TObject);
begin
//frmmain.sSkinManager1.RepaintForms() ;
end;

procedure TfrmOptions.trkAc3CompChange(Sender: TObject);
begin
  lblAc3CompVal.Caption  := inttostr(trkAc3Comp.Position);
  //SomethingChanged(Sender);
end;
procedure TfrmOptions.txtFontPathChange(Sender: TObject);
begin
//chkFontConfig.Checked :=true;
//chkAutoLoadSubs.Checked := true;
end;

procedure TfrmOptions.GenerateSkinsList;
var
  sl : TacStringList;
  i : integer;
//  mi : TMenuItem;
begin
  sl := TacStringList.Create;
  //frmmain.sSkinManager1.GetSkinNames(sl);
  skinComboBox.Items.BeginUpdate;
  skinComboBox.ItemsEx.Clear;
  for i := 0 to sl.Count - 1 do skinComboBox.Items.Add(sl[i]);
  skinComboBox.Items.EndUpdate;
  // If no available skins...
  if skinComboBox.Items.Count < 1 then skinComboBox.Items.Add('No skins available');
  FreeAndNil(sl);
  // Menu update
  //Buildinskins.Clear;
  // Build-in skins list
  {for i := 0 to sSkinManager1.InternalSkins.Count - 1 do begin
    mi := TMenuItem.Create(Application);
    mi.Caption := sSkinManager1.InternalSkins[i].Name;
    if mi.Caption = sSkinManager1.SkinName then mi.Checked := True;
    mi.OnClick := SkinMenuClick;
    mi.RadioItem := True;
    Buildinskins.Add(mi);
  end; }
  // External skins list
  //Externalskins.Clear;
  {sl := TacStringList.Create;
  sSkinManager1.GetExternalSkinNames(sl);
  if sl.Count > 0 then begin
    sl.Sort;
    for i := 0 to sl.Count - 1 do begin
      mi := TMenuItem.Create(Application);
      mi.Caption := sl[i];
      if mi.Caption = sSkinManager1.SkinName then mi.Checked := True;
      mi.OnClick := SkinMenuClick;
      mi.RadioItem := True;
      if (i <> 0) and (i mod 20 = 0) then mi.Break := mbBreak;
      Externalskins.Add(mi);
    end;
  end;  }
  //FreeAndNil(sl);
end;

procedure TfrmOptions.FormCreate(Sender: TObject);
  function GetControlTop(cntrl: Tcontrol; row: integer): integer;
  begin
    Result := 21 + (row - 1)*24 - (cntrl.Height div 2);
    if cntrl is tlabel then
      Result := result -1;    
  end;
  function GetControlLeft(cntrl: Tcontrol; col: integer): integer;
  begin
    case col of
      1:
        Result := 10;
      2:
        Result := 176;
      3:
        Result := 352;
      else
        Result := col;
    end;
  end;
  function AddControl(cntrlClass : TcontrolClass; Tab:TTabsheet;
                     row: integer; col: integer): Tcontrol;
  begin
    Result := cntrlClass.Create(Tab);
    Result.Parent := Tab;
    if (row > 0) and (col > 0) then
      Result.SetBounds(GetControlLeft(Result,col),GetControlTop(Result,row),
                      Result.Width, Result.Height)
    else begin
      if row > 0 then
        Result.top := GetControlTop(Result,row);
      if col > 0 then
        Result.Left := GetControlLeft(Result,col);
    end;
      
    if Result is Tedit then begin
      if (col >= 2) and (col <= 3) then
        Result.Width := cLanguage.Width;
    end;
  end;
var i: integer;
  newlabel : Tlabel;
  newimage : Timage;
  newedit : TEditNumeric;
begin

  GetFass;
  trkAc3CompChange(nil); //update text
  txtFullScreenMonitor := (AddControl(TEditNumeric,Tabgeneral,5,2) as  TEditNumeric);
  txtFullScreenMonitor.AutoSize := true;
  txtFullScreenMonitor.MaxLength := 2;
  with txtFullScreenMonitor do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;


  txtAutoSync :=  (AddControl(TEditNumeric,Tabgeneral,10,2) as TEditNumeric);
  txtAutoSync.MaxLength := 5;
  with txtAutoSync do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;
  txtAVsyncPerFrame := (AddControl(TEditNumeric,Tabgeneral,11,2) as TEditNumeric);
  txtAVsyncPerFrame.MaxLength := 5;
  with txtAVsyncPerFrame do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;

  txtAudioDecodeChannels := (AddControl(TEditNumeric,TabAudio,7,2) as  TEditNumeric);
  txtAudioDecodeChannels.AutoSize := true;
  txtAudioDecodeChannels.MaxLength := 2;
  txtAudioDecodeChannels.TabOrder := trkAc3Comp.TabOrder;

  with txtAudioDecodeChannels do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;

  txtAudioFilterChannels := (AddControl(TEditNumeric,TabAudio,10,2) as  TEditNumeric);
  txtAudioFilterChannels.AutoSize := true;
  txtaudiofilterchannels.Allowedchars := txtaudiofilterchannels.Allowedchars + ':';
  with txtaudiofilterchannels do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;

  txtvideoout := (AddControl(TEditAutoselect,Tabvideo,1,3) as TEditAutoselect);
  txtvideoout.TabOrder := cvideoout.taborder +1;
  with txtvideoout do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;

  {txtFontPath := (AddControl(TEditAutoselect,TabOSDSub,1,176) as TEditAutoselect);
  txtfontpath.Width := GetControlLeft(nil,3) + cLanguage.Width - txtFontPath.Left ;
  txtfontpath.TabOrder := 0;
  with txtvideoout do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;  }

  cpkSubAssColor.HasAlpha := True;
  cpkSubAssBorderColor.HasAlpha := True;
  cpkSubBgColor.OnlyGrayScale := True;
  cpkSubBgColor.HasAlpha := True;

  //SetControlPos(lblAutosync,9);

  //create cache tab controls
  for i := 0 to MAX_CACHE_ENTRYS do begin
    newlabel := Tlabel.Create(TabCaching);
    newlabel.Parent := TabCaching;
    newlabel.Caption := cacheEntrys[i] + ':';
    newlabel.SetBounds(GetControlLeft(newlabel,1) +32,GetControlTop(newlabel,i+1),
                       newlabel.Width, newlabel.Height);
    newlabel.AutoSize := true;

    lblCache[i]:= newlabel;

    newImage := Timage.Create(Tabcaching);
    newImage.Parent := TabCaching;
    newImage.SetBounds(llanguage.Left, newlabel.Top, 16, 16);
    newimage.Transparent := true;
    newimage.Tag := -1;
    UpdateImageFromImagery(newimage,imgListDrive,i);

    newedit :=  (AddControl(TEditNumeric,Tabcaching,i+1,2) as TEditNumeric);
    newedit.AutoSize := true;
    newedit.MaxLength := 5;
            with newedit do begin

    Color := clBlack;
    Font.Charset := ANSI_CHARSET;
    Font.Color := clSilver;
    Font.Height := -11;
    Font.Name := 'Tahoma';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 6;
    Text := '';
    SkinData.SkinSection := 'EDIT';
    BoundLabel.Indent := 0;
    BoundLabel.Font.Charset := DEFAULT_CHARSET;
    BoundLabel.Font.Color := clWindowText;
    BoundLabel.Font.Height := -11;
    BoundLabel.Font.Name := 'Tahoma';
    BoundLabel.Font.Style := [];
    BoundLabel.Layout := sclLeft;
    BoundLabel.MaxWidth := 0;
    BoundLabel.UseSkinColor := True;
    bidimode:=bdlefttoright;
  end;
    txtCache[i]:= newedit;
    //newedit.Align := taright;

    newlabel := Tlabel.Create(TabCaching);
    newlabel.Parent := TabCaching;
    newlabel.SetBounds(newedit.Left+ newedit.Width + 16, lblCache[i].top,
                           newlabel.Width, newlabel.Height);
    newlabel.Caption := 'Kbytes';
  end;

end;



procedure TfrmOptions.CAudioOutChange(Sender: TObject);
var e:boolean;
begin
  e:=(CAudioOut.ItemIndex=3);
  LAudioDev.Enabled:=e;
  CAudioDev.Enabled:=e;
  //SomethingChanged(Sender);
end;



procedure TfrmOptions.CLanguageDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
    var s:string;
begin

    s:=CLanguage.Items[Index];
    with CLanguage.Canvas do begin

          if(odSelected in state )  then begin
              //Brush.Color := frmmain.sSkinManager1.GetGlobalColor ;
              //Font.Color := frmmain.sSkinManager1.GetGlobalFontColor;

          end else begin

          end;
    FillRect(Rect);
    TextOut(Rect.Left+2, Rect.Top+1, s);

    end;
end;

(*procedure TOptionsForm.CVideoEqChange(Sender: TObject);
begin
  SomethingChanged(Sender);
end;*)

procedure TfrmOptions.CVideoOutChange(Sender: TObject);
var e:boolean;
begin
  e := (VideoOutMap[CVideoOut.itemindex]='#');
  if e then
    txtvideoout.Text := frmMain.mpo.videoout
  else
    txtvideoout.Text := VideoOutMap[CVideoOut.itemindex];

  Txtvideoout.Enabled := e;
  //SomethingChanged(Sender);
end;

procedure TfrmOptions.EParamsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=^M then begin
    self.BApplyClick(self);
    key := #0;
  end;
end;

{function IsAdmin():boolean;
begin
  Result:=false;
  LoadShell32Library;
  if IsShell32Loaded<>0 then Result:=IsUserAnAdmin();
end; }

procedure TfrmOptions.sBitBtnRegAssClick(Sender: TObject);
//var i: integer;
begin

SetFass;Save('');
  if (Win32MajorVersion >= 6) {and (not IsAdmin())} then
    ShellExecute(Handle, 'runas', PChar(ParamStr(0)), '/adminoption 0', nil, SW_SHOWDEFAULT)
  else
 regAss();

 BCloseClick(nil);
end;

procedure TfrmOptions.sBitBtnSelAllClick(Sender: TObject);
var i: integer;
begin
  if TFass.Count < 1 then exit;
  for i := 0 to TFass.Count - 1 do TFass.Checked[i] := true;
end;

procedure TfrmOptions.sBitBtnSelNoneClick(Sender: TObject);
var i: integer;
begin
  if TFass.Count < 1 then exit;
  for i := 0 to TFass.Count - 1 do TFass.Checked[i] := false;
end;

procedure TfrmOptions.SetFass;
var i: integer;
begin
  fass := '';
  for i := 0 to TFass.Count - 1 do begin
    if TFass.Checked[i] then fass := fass + ',1' + TFass.Items[i]
    else fass := fass + ',0' + TFass.Items[i];
  end;
  delete(fass, 1, 1);
end;
procedure TfrmOptions.GetFass;
var i: integer;
begin
  if fass = '' then fass := DefaultFass;
  TFass.Items.CommaText := fass;
  for i := 0 to TFass.Count - 1 do begin
    TFass.Checked[i] := TFass.Items[i][1] <> '0';
    TFass.Items[i] := Trim(LowerCase(copy(TFass.Items[i], 2, MaxInt)));
  end;
end;


procedure regAss();
var s: TStringList; reg: TRegistry; i: integer;
  hr: HRESULT; AppName, ext, AppPath: string;
  AAR: IApplicationAssociationRegistration;
  WantedLangID:integer;
begin

  if fass = '' then fass := DefaultFass;
  s := TStringList.Create;
  s.CommaText := FAss;
  if s.Count < 1 then begin
    s.Free; exit; end;
  reg := TRegistry.Create;
  hr := 1; AAR := nil; ext := ''; AppName := '3nityMediaPlayer';
  AppPath := ExpandFileName(ParamStr(0));
  with reg do begin
    try
      if (Win32MajorVersion >= 6) then begin
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey('\SOFTWARE\RegisteredApplications\', true) then
          WriteString(AppName, 'Software\Clients\Media\' + AppName + '\Capabilities');
        if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities', true) then begin
          WriteExpandString('ApplicationDescription', '3nity  Media Player');
          WriteExpandString('ApplicationName', AppName);
        end;
        hr := CoCreateInstance(CLSID_ApplicationAssociationRegistration, nil, CLSCTX_INPROC_SERVER, IID_IApplicationAssociationRegistration, AAR);
      end;
      //AAR.
      ////////////////////////////////////////////
      ///
      WantedLangID:=GetUserDefaultLCID() AND 1023;
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('\Directory\shell\PlayWith3nity', true) then

          Case WantedLangID of
                $0a : WriteString('', 'Reproducir con 3nity Media Player' );
                $0c : WriteString('', 'Lire avec 3nity Media Player'  );

                else WriteString('', 'Play with 3nity Media Player'  );
          end;

      if OpenKey('\Directory\shell\PlayWith3nity\command', true) then
         WriteString('', '"' + AppPath + '" "%1"');

      ///  ///////////////////////////////////////////

      for i := 0 to s.Count - 1 do begin
        ext := '.' + LowerCase(copy(s.Strings[i], 2, MaxInt));
        if s.Strings[i][1] = '1' then begin
          RootKey := HKEY_CLASSES_ROOT;
          if OpenKey('\' + AppName + ext, true) then
            WriteString('', 'MPlayer file (' + ext + ')');
          if OpenKey('\' + AppName + ext + '\DefaultIcon', true) then
            WriteString('', AppPath + ',0');
          if OpenKey('\' + AppName + ext + '\shell\open\command', true) then
            WriteString('', '"' + AppPath + '" "%1"');


          if OpenKey('\' + ext, true) then
            WriteString('', AppName + ext);
          if (Win32Platform = VER_PLATFORM_WIN32_NT) then begin   //unicode
            RootKey := HKEY_CURRENT_USER;
            if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\' + ext, true) then
              WriteString('Progid', AppName + ext);
            if (Win32MajorVersion >= 6) then begin
              RootKey := HKEY_LOCAL_MACHINE;
              if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities\FileAssociations', true) then
                WriteString(ext, AppName + ext);
              if hr = S_OK then
                AAR.SetAppAsDefault(PWChar(WideString(AppName)), PWChar(WideString(ext)), AT_FILEEXTENSION);
            end;
          end;

        end
        else begin
          RootKey := HKEY_CLASSES_ROOT;
          DeleteKey('\' + AppName + ext);
          if (Win32MajorVersion >= 6) then begin
            RootKey := HKEY_LOCAL_MACHINE;
            if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities\FileAssociations', true) then
              DeleteValue(ext);
          end;
        end;
      end;
      CloseKey;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
      Sleep(2000);
    finally
      Free;
    end;
    s.Free;
  end;

end;

procedure regAssWindows8();
var s: TStringList; reg: TRegistry; i: integer;
  hr: HRESULT;hrw8: HRESULT; AppName, ext, AppPath: string;
  AAR: IApplicationAssociationRegistration;
  AARW8:IApplicationAssociationRegistrationUI;
  WantedLangID:integer;
begin
  if fass = '' then fass := DefaultFass;
  s := TStringList.Create;
  s.CommaText := FAss;
  if s.Count < 1 then begin
    s.Free; exit; end;
  reg := TRegistry.Create;
  hr := 1; AAR := nil; ext := ''; AppName := '3nityMediaPlayer';
  AppPath := ExpandFileName(ParamStr(0));
  with reg do begin
    try
      if (Win32MajorVersion >= 6) then begin
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey('\SOFTWARE\RegisteredApplications\', true) then
          WriteString(AppName, 'Software\Clients\Media\' + AppName + '\Capabilities');
        if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities', true) then begin
          WriteExpandString('ApplicationDescription', '3nity  Media Player');
          WriteExpandString('ApplicationName', AppName);
        end;

        hr := CoCreateInstance(CLSID_ApplicationAssociationRegistration, nil, CLSCTX_INPROC_SERVER, IID_IApplicationAssociationRegistration, AAR);
        if (Win32MinorVersion >=2) then
        begin
           hrw8:= CoCreateInstance(CLSID_ApplicationAssociationRegistrationUI, nil, CLSCTX_ALL, IID_IApplicationAssociationRegistrationUI, AARW8);
        end;
      end;

      ////////////////////////////////////////////
      ///
      WantedLangID:=GetUserDefaultLCID() AND 1023;
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKey('\Directory\shell\PlayWith3nity', true) then

          Case WantedLangID of
                $0a : WriteString('', 'Reproducir con 3nity Media Player' );
                $0c : WriteString('', 'Lire avec 3nity Media Player'  );

                else WriteString('', 'Play with 3nity Media Player'  );
          end;

      if OpenKey('\Directory\shell\PlayWith3nity\command', true) then
         WriteString('', '"' + AppPath + '" "%1"');

      ///  ///////////////////////////////////////////

      for i := 0 to s.Count - 1 do begin
        ext := '.' + LowerCase(copy(s.Strings[i], 2, MaxInt));
        if s.Strings[i][1] = '1' then begin
          RootKey := HKEY_CLASSES_ROOT;
          if OpenKey('\' + AppName + ext, true) then
            WriteString('', 'MPlayer file (' + ext + ')');
          if OpenKey('\' + AppName + ext + '\DefaultIcon', true) then
            WriteString('', AppPath + ',0');
          if OpenKey('\' + AppName + ext + '\shell\open\command', true) then
            WriteString('', '"' + AppPath + '" "%1"');


          if OpenKey('\' + ext, true) then
            WriteString('', AppName + ext);
          if (Win32Platform = VER_PLATFORM_WIN32_NT) then begin   //unicode
            RootKey := HKEY_CURRENT_USER;
            if OpenKey('\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\' + ext, true) then
              WriteString('Progid', AppName + ext);
            if (Win32MajorVersion >= 6) then begin
              RootKey := HKEY_LOCAL_MACHINE;
              if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities\FileAssociations', true) then
                WriteString(ext, AppName + ext);
              if hr = S_OK then

                AAR.SetAppAsDefault(PWChar(WideString(AppName)), PWChar(WideString(ext)), AT_FILEEXTENSION);
                //AARW8.LaunchAdvancedAssociationUI(PWChar(WideString(AppName)));

            end;
          end;

        end
        else begin
          RootKey := HKEY_CLASSES_ROOT;
          DeleteKey('\' + AppName + ext);
          if (Win32MajorVersion >= 6) then begin
            RootKey := HKEY_LOCAL_MACHINE;
            if OpenKey('\Software\Clients\Media\' + AppName + '\Capabilities\FileAssociations', true) then
              DeleteValue(ext);
          end;
        end;
      end;

              if (Win32MinorVersion >=2) then
              begin

                    if hrw8 = S_OK then  AARW8.LaunchAdvancedAssociationUI(PWChar(WideString(AppName)));

              end;

      CloseKey;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
      Sleep(2000);
    finally
      Free;
    end;
    s.Free;
  end;

end;



end.
