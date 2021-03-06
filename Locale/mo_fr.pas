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

unit mo_fr;
interface
implementation
uses Windows,Locale;

procedure Activate;
begin
  with LOCstr do begin
    Title:='3nity Media Player';
      Status_Opening:='Ouverture ...';
      Status_Closing:='Fermeture ...';
      Status_Playing:='Joue';
      Status_Paused:='Suspendu';
      Status_Stopped:='Arr�t�';
      Status_Error:='Incapable de jouer le m�dia (Cliquer pour plus d''information)';

    FullscreenControls:='Controls plein �cran';
    OSD:='Choisir le mode OSD';
      NoOSD:='Aucun OSD';
      DefaultOSD:='OSD par d�faut';
      TimeOSD:='Afficher le temps';
      FullOSD:='Afficher le temps total';
    Escape:='Appuyez sur Echap pour quitter le mode plein �cran.';
    Filemenu:='&Fichier';
      OpenFile:='Jouer un fichier ...';
      OpenURL:='Jouer un URL ...';
        OpenURL_Caption:='Jouer un URL';
        OpenURL_Prompt:='Quel URL voulez-vous jouer?';
      OpenDrive:='Jouer un CD/DVD';
      OpenTV := 'Jouer TV/carte de capture';
      Close:='Fermer';
      Quit:='Quitter';
    View:='&Affichage';
      SizeAny:='Dimension sur mesure';
      Size50:='Demi taille';
      Size100:='Taille originale';
      Size200:='Double taille';
      VideoInside:='Ne couper pas le video';
      Fullscreen:='Plein �cran';
      AudioEqu:='Egaliseur audio';
      Compact:=   'Mode compact';
      TogOSD:=    'Cycler les modes OSD';
      OnTop:=     'Toujours sur le dessus';
      Vis:='Visualisation';
      VisEnable:='Afficher visualisation';
      VisDirectRender:='Renderization directe';
    Seek:='&Visualisation';
      Play:='Jouer';
      Pause:='Suspendre';
      Prev:='Titre pr�c�dent'^I'Ctrl Gauche';
      Next:='Titre suivant'^I'Ctrl Droite';
      ShowPlaylist:='Liste d''�coute ...';
      Mute:='Muet';
      SeekF10:='Avancer 10 secondes'^I'Droite';
      SeekR10:='Reculer 10 secondes'^I'Gauche';
      SeekF60:='Avancer 1 minute'^I'Haut';
      SeekR60:='Reculer 1 minute'^I'Bas';
      SeekF600:='Avancer 10 minutes'^I'PgHaut';
      SeekR600:='Reculer 10 minutes'^I'PgBas';
    Navigation:='&Navigation';
      Menu := 'Menu';
      Titles := 'Titres';
      Chapters:= 'Chapitres';
    Extra:='&Pr�f�rences';
      Audio:='Audio';
      Subtitle:='Sous-titres';
        NoSubtitle := 'Pas de sous-titres';
      AddSubtitle := 'Ajouter sous-titres...';

      Aspect:='Rapport largeur/hauteur';
        AspectAuto:='Auto-d�tection';
        Aspect43:='Forcer 4:3';
        Aspect169:='Forcer 16:9';
        Aspect235:='Forcer 2.35:1';
      DeinterlaceAlg:='Algorithme d�sentrelacement';
        DeinterlaceBlend := 'Inter-trame';
        DeinterlaceSimple := 'Simple';
        DeinterlaceAdaptative := 'Adaptatif';
        DeinterlaceDoubleRate := 'Double fr�quence';
      Deinterlace:='D�-entrelacer';

      Off := 'D�branch�';
      On:='D�clench�';
      Auto:='Automatique';

      Settings := 'R�glages ...';
      Options:='Pr�f�rences ...';
      Language:='Langue';
      StreamInfo:='Information sur fichier ...';
      ShowOutput:='Afficher la sortie de MPlayer';
    Help:='A&ide';
      KeyHelp:='Aide du clavier ...';
      About:='� propos ...';
      
      
  HelpFormCaption:='Aide du clavier';
  HelpFormHelpText:=
'Clefs de navigation:'^M^J+
'Espace'^I'Jouer/Suspendre'^M^J+
'Droite'^I'Avancer 10 secondes'^M^J+
'Gauche'^I'Reculer 10 secondes'^M^J+
'Haut'^I'Avancer 1 minute'^M^J+
'Bas'^I'Reculer 1 minute'^M^J+
'PgHaut'^I'Avancer 10 minutes'^M^J+
'PgBas'^I'Reculer 10 minutes'^M^J+
^M+^J+
'Autre clefs:'^M^J+
'O'^I'Cycler les modes OSD'^M^J+
'F'^I'Basculer en plein �cran'^M^J+
'Q'^I'Quitter immediatement'^M^J+
'9/0'^I'Ajuster le volume'^M^J+
'-/+'^I'Ajuster la sync audio/video'^M^J+
'1/2'^I'Ajuster la luminosit�'^M^J+
'3/4'^I'Ajuster le contraste'^M^J+
'5/6'^I'Ajuster la hue'^M^J+
'7/8'^I'Ajuster la saturation'^M^J+
'M'^I'Muet'^M^J+
'//*'^I'Ajuster le volume'^M^J+
'D'^I'frame_drop'^M^J+
'C'^I'Mode Compact'^M^J+
'T'^I'Toujours au premier plan'^M^J+
//'S'^I'Faire une Capture photo'^M^J+
'L'^I'Afficher Playlist'^M^J+
'RETURN'^I'Play'^M^J+
'P'^I'Pause'^M^J+
'TAB'^I'Controles en Plein Ecran'^M^J+
'NUMPAD9'^I'Zoom +'^M^J+
'NUMPAD5'^I'Zoom Reset'^M^J+
'NUMPAD1'^I'Zoom -'^M^J+
'NUMPAD6'^I'Aspet +'^M^J+
'NUMPAD8'^I'Reset Aspet'^M^J+
'NUMPAD4'^I'Aspet -'^M^J+
'NUMPAD7'^I'Ne pas couper la vid�o'^M^J+
'V'^I^I'Sous-titres'^M^J+
'CTRL+0'^I^I'Reset Speed'^M^J+
'CTRL+/'^I^I'Speed -'^M^J+
'CTRL+*'^I^I'Speed +'^M^J+
'CTRL+O'^I^I'Ouvrir un Fichier'^M^J+
'CTRL+L'^I^I'Ouvrir une URL'^M^J+
'CTRL+W'^I^I'Fermer'^M^J+
'CTRL+LEFT'^I'Jouer la piste pr�c�dente'^M^J+
'CTRL+RIGHT'^I'Jouer la piste suivante'^M^J+
'Alt+0'^I^I'Dimension sur mesure'^M^J+
'Alt+1'^I^I'Demi Taille'^M^J+
'Alt+2'^I^I'Taille originale'^M^J+
'Alt+3'^I^I'Taille double'^M^J+
'Alt+F4'^I^I'Fermer le programme'^M^J+
'Alt+Return'^I'Plein Ecran'^M^J+
'CTRL+LEFT'^I'Jouer la piste pr�c�dente'^M^J+
'CTRL+RIGHT'^I'Jouer la piste suivante'^M^J+
'MEDIA_STOP'^I^I'Stop '^M^J+
'MEDIA_PREV_TRACK'^I'Jouer la piste pr�c�dente'^M^J+
'MEDIA_NEXT_TRACK'^I'Jouer la piste suivante'
  ;
  HelpFormClose:='Fermer';

  //log form
  LogFormCaption:='Sortie MPlayer';
  LogFormClose:='Fermer';

  //about form
  AboutFormCaption:='� propos de 3nity Media Player';
  AboutFormClose:='Fermer';
  AboutVersionMPUI:='3nity Media Player version:';
  AboutVersionMplayer:='MPlayer version:';

  //settings form
  SettingsformCaption := 'R�glages';
    Brightness := 'Luminosit�';
    Contrast := 'Contraste';
    Hue := 'Teinte';
    Saturation := 'Saturation';
    Gamma := 'Gamma';
    SubScale := 'Sous. taille';
    ResetSetting := 'Restaurer';
    MResetSetting := 'Restaurer tout';

  //options form
    FullScreenMonitor := 'Moniteur plein �cran';
    AutoLocale:='(Auto-s�lection)';

    OptionsFormCaption:='Pr�f�rences';
    OptionsFormOK:='OK';
    OptionsFormApply:='Appliquer';

            OptionsFormAssociate:='Associer';
    OptionsFormSelectAll:='Tous';
    OptionsFormSelectNone:='Aucun';

    
    OptionsFormSave:='Sauver';
    OptionsFormClose:='Fermer';
    OptionsFormHelp:='Aide';
    OptionsFormParams:='Param�tres MPlayer additionnels:';

    OptionsFormIndex:='Reconstruire l''index du fichier au besoin';
    OptionsFormPriorityBoost:='Ex�cuter avec priorit� plus �lev�e';

    Autosync := 'Facteur auto-synchronisation';
    AVsyncperframe := 'Synchronisation A-V par photogramme(us.)';

    OptionsFormAudioOut:='Pilote de sortie audio';
      AudioOutNoDecode:='(ne pas d�coder le son)';
      AudioOutNoOut:='(ne pas jouer le son)';
    OptionsFormAudioDev:='Unit� de sortie DirectSound';
    OptionsFormAudioFilterChannels := 'Filtrage et redirection des canaux';
    OptionsFormSoftVol:='Reglage du volume par logiciel / Amplification du volume';
    OptionsFormUseVolcmd := 'Employer option volume sur ligne de commande';
    OptionsFormAudioDecodeChannels := 'M�x de canaux a d�coder';
    OptionsFormAc3Comp := 'Compression dynamique AC3';
    OptionsFormUseliba52 := 'Employer la librairie liba52';

    OptionsFormVideoOut := 'Pilote de sortie video';
      VideoOutUser := 'Un Autre:';
    OptionsFormOverlay:= 'Couleur pour la superposition';
    ForceEvenWidth := 'Forcer largeur pair';
    DirectRender := 'Renderization directe';
    DoubleBuffer := 'Double m�moire tampon';
    DrawSlices := 'Dessin en morceaux';

    OptionsFormVideoeq  := '�qualiseur video';
      VideoeqOff  := 'D�branch�';
    VideoScaler := 'Changer taille par logiciel';
    TryScaler := 'Essayer taille en erreur';

    OptionsFormPostproc:='Post-traitement';
      PostprocOff:='Aucun';
      PostprocAuto:='Automatique';
      PostprocMax:='Qualit� maximum';

    OptionsFormGeneral := 'G�n�ral';
    OptionsFormAudio := 'Audio';
    OptionsFormVideo := 'Vid�o';
    OptionsFormCaching := 'Cache';
    OptionsFormOSDSub := 'OSD et sous-titres';

    MediaDefault := 'D�faut';
    MediaFixed := 'Disque dur';
    MediaRamdisk := 'Disque RAM';
    MediaCdrom := 'CD-ROM / DVD-ROM';
    MediaRemovable := 'Support amovible';
    mediaNetwork := 'R�seau local';
    MediaInternet := 'Internet';
    MediaDvd := 'Format DVD';

    FontPath := 'Fonte de caract�res';
    FontEncoding := 'Codage des caract�res';
    FontEncodings[0] := 'D�faut';
    FontEncodings[1] := 'Unicode';
    FontEncodings[2] := 'Langues Europ�ennes Occidentales (ISO-8859-1)';
    FontEncodings[3] := 'Langues Europ�eenes Occidentales avec Euro (ISO-8859-15)';
    FontEncodings[4] := 'Langues Europ�eenes Slaves/Centrales (ISO-8859-2)';
    FontEncodings[5] := 'Esperanto, Galicien, Maltais, Turc (ISO-8859-3)';
    FontEncodings[6] := 'Caract�res Old Baltic (ISO-8859-4)';
    FontEncodings[7] := 'Cyrillique (ISO-8859-5)';
    FontEncodings[8] := 'Arabe (ISO-8859-6)';
    FontEncodings[9] := 'Grec Moderne (ISO-8859-7)';
    FontEncodings[10] := 'Turc (ISO-8859-9)';
    FontEncodings[11] := 'Balte (ISO-8859-13)';
    FontEncodings[12] := 'Celte (ISO-8859-14)';
    FontEncodings[13] := 'Hebreu (ISO-8859-8)';
    FontEncodings[14] := 'Russe (KOI8-R)';
    FontEncodings[15] := 'Ukrainien, Bi�lorusse (KOI8-U/RU)';
    FontEncodings[16] := 'Chinois Simplifi� (CP936)';
    FontEncodings[17] := 'Chinois Traditionnel (BIG5)';
    FontEncodings[18] := 'Japonais (SHIFT-JIS)';
    FontEncodings[19] := 'Cor�en (CP949)';
    FontEncodings[20] := 'Tha�landais (CP874)';
    FontEncodings[21] := 'Cyrillique Windows (CP1251)';
    FontEncodings[22] := 'Slave/Europe Centrale Windows (CP1250)';

    FontConfig := 'Fontconfig (scruter polices de caract�res)';
    SubAss := 'Employer SSA/ASS';
    SubAutoLoad := 'Ajouter sous-titres externes';

    SubAssBorderColor := 'Couleur de la bordure du texte';
    SubAssColor := 'Couleur du texte';
    SubBgColor := 'Couleur de fond du text';

    UseDvdNav := 'DVD menus (exp�rimental)';
    DeinterlaceDVD := 'D�-entrelacer toujours';

  //playlist form
  PlaylistFormCaption:='Liste d''�coute';
  PlaylistFormPlay:='Jouer';
  PlaylistFormAdd:='Ajouter ...';
  PlaylistFormMoveUp:='Monter';
  PlaylistFormMoveDown:='Descendre';
  PlaylistFormDelete:='Enlever';
  PlaylistFormShuffle:='Mode al�atoire';
  PlaylistFormLoop:='R�p�ter';
  PlaylistFormSave:='Sauver ...';
  PlaylistFormClose:='Fermer';

  InfoFormCaption:='Information sur fichier';
  InfoFormClose:='Fermer';
  InfoFormCopy := 'Copier';
  NoInfo:='Aucune information disponible.';
  InfoFileFormat:='Format';
  InfoPlaybackTime:='Duration';
  InfoTags:='M�tadonn�e';
  InfoVideo:='Video';
  InfoAudio:='Audio';
  InfoDecoder:='Decodeur';
  InfoCodec:='Codec';
  InfoBitrate:='D�bit binaire';
  InfoVideoSize:='Dimensions';
  InfoVideoFPS:='Images par seconde';
  InfoVideoAspect:='Rapp. larg./haut.';
  InfoAudioRate:='Fr�quence';
  InfoAudioChannels:='Canaux';
  InfoInterlace:='Photogramme';
  InfoVideoInt := 'Entrelac�';
  InfoVideoPro := 'progressif';
  InfoTrack := 'Piste';
  InfoFilesize := 'Taille';
  InfoSub := 'Sous-titres';
  end;
end;

begin
  RegisterLocale('Fran�ais',Activate,LANG_FRENCH,DEFAULT_CHARSET);
end.
