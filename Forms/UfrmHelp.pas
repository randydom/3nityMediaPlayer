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

unit UfrmHelp;

interface

uses
  Windows, Classes, Graphics, Controls,VssDockForm, UVssProgressForm, Forms, FormLocal,
  StdCtrls, Locale;

type
  TfrmHelp = class(TFormLocal)//class(TVssDockForm)//class(TFormLocal)
    HelpText: TMemo;
    BClose: TButton;
    RefLabel: TLabel;
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected

  public
    { Public declarations }
    Firstshow:boolean;
    procedure DoLocalize(); override;
  end;

var
  frmHelp: TfrmHelp;

implementation

uses UfrmMain;

{$R *.dfm}

procedure TfrmHelp.BCloseClick(Sender: TObject);
begin
  Close;
end;
procedure TfrmHelp.DoLocalize;
var NeededHeight:integer;
begin
  inherited;
  Font.Charset:=CurrentLocaleCharset;

  Caption:=LOCstr.HelpFormCaption;
  HelpText.Text:=LOCstr.HelpFormHelpText;
  BClose.Caption:=LOCstr.HelpFormClose;

  NeededHeight:=RefLabel.Height*HelpText.Lines.Count;
  Height:=Height-HelpText.Height+NeededHeight;

end;

procedure TfrmHelp.FormCreate(Sender: TObject);
begin
//inherited;
Firstshow:=true;
end;

procedure TfrmHelp.FormHide(Sender: TObject);
begin
  frmMain.MKeyHelp.Checked := false;
end;

procedure TfrmHelp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var todo:boolean;handled : boolean;
begin
  todo:=false;
  handled:=true;
 //PostMessage(Application.MainForm.Handle, WM_KEYDOWN, VK_RETURN, 0);
 //TForm(Owner)

  if ssCtrl in Shift then begin
   case Key of

    Ord('0'):  todo:=true;
    VK_DIVIDE: todo:=true;
    VK_MULTIPLY: todo:=true;

    Ord('O'):   todo:=true;
    Ord('L'):   todo:=true;
    Ord('W'):   todo:=true;
    VK_LEFT: todo:=true;
    VK_RIGHT: todo:=true;
    else handled := false;
   end;
  end else if ssAlt in Shift then begin
   case Key of
    Ord('0'):   todo:=true;
    Ord('1'):   todo:=true;
    Ord('2'):   todo:=true;
    Ord('3'):   todo:=true;
//    Ord('4'):   OMFile.CheckMenuDropdown;
//    Ord('5'):   OMView.CheckMenuDropdown;
//    Ord('6'):   OMSeek.CheckMenuDropdown;
//    Ord('7'):   OMExtra.CheckMenuDropdown;
//    Ord('8'):   OMHelp.CheckMenuDropdown;
    VK_F4:      todo:=true;
    VK_RETURN:  todo:=true;
    else handled := false;
   end;
  end else begin  //touches seules
   case Key of
    VK_RIGHT:  todo:=true;
    VK_LEFT:    todo:=true;
    VK_UP:      todo:=true;
    VK_DOWN:    todo:=true;
    VK_NEXT:   todo:=true;
    VK_PRIOR:    todo:=true;
    VK_SUBTRACT:todo:=true;
    VK_ADD:     todo:=true;
    Ord('M'):   todo:=true;
    Ord('9'):   todo:=true;
    Ord('0'):   todo:=true;
    VK_DIVIDE:  todo:=true;
    VK_MULTIPLY:todo:=true;
    Ord('O'):   todo:=true;
    Ord('1'):   todo:=true;
    Ord('2'):   todo:=true;
    Ord('3'):   todo:=true;
    Ord('4'):   todo:=true;
    Ord('5'):   todo:=true;
    Ord('6'):   todo:=true;
    Ord('7'):   todo:=true;
    Ord('8'):   todo:=true;
    ord('R'):   todo:=true;
    Ord('D'):   todo:=true;
    Ord('F'):   todo:=true;
    Ord('C'):   todo:=true;
    Ord('T'):   todo:=true;
    Ord('S'):   todo:=true;
    Ord('L'):   todo:=true;
    191:        todo:=true;
    Ord('Q'):   todo:=true;
    VK_RETURN:  todo:=true;
    Ord('P'):   todo:=true;
    VK_SPACE, VK_MEDIA_PLAY_PAUSE: todo:=true;
    VK_TAB:     todo:=true;
    VK_MEDIA_STOP:      todo:=true;
    VK_MEDIA_PREV_TRACK: todo:=true;
    VK_MEDIA_NEXT_TRACK: todo:=true;
    VK_NUMPAD9 : todo:=true;
    VK_NUMPAD5 : todo:=true;
    VK_NUMPAD1 : todo:=true;

    VK_NUMPAD6 : todo:=true;
    VK_NUMPAD8 : todo:=true;
    VK_NUMPAD4 : todo:=true;
    VK_NUMPAD7 : todo:=true;

    ord('V'): todo:=true;
    else handled := false;
   end;
  end;



   if handled then
   begin
    if todo  then
    frmMain.FormKeyDown(nil,Key,Shift);
    Key:=0;
   end;
end;

procedure TfrmHelp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TfrmHelp.FormShow(Sender: TObject);
begin
  frmMain.MKeyHelp.Checked := true;
  
  if  Firstshow then

  begin
    FirstShow:=false;
    //frmHelp.Left:=frmmain.Left + frmmain.Width+2;
    //frmHelp.top:=frmmain.top   ;
  end;

    if frmmain.Fullscreen then
    begin
      //frmHelp.Position:=poScreenCenter;
      Top:=(Screen.WorkAreaHeight-Height) div 2;
      if Top<0 then Top:=0;
      Left:=(Screen.WorkAreaWidth-Width) div 2;
      if Left<0 then Left:=0;
    end
    else
    begin
    //frmHelp.Position:=poDefault;
    frmHelp.Left:=frmmain.Left + frmmain.Width+2;
    frmHelp.top:=frmmain.top   ;
    end;
end;

end.
