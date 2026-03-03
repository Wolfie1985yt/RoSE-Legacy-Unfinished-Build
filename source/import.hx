#if !macro
import backend.Paths;
import backend.Paths as Paths;
import backend.Song as Song;
import backend.ClientPrefs as ClientPrefs;
import backend.Controls as Controls;
import backend.Generic as Generic;
import backend.Highscore as Highscore;
import backend.MusicBeatState as MusicBeatState;
import backend.StageData as StageData;
import backend.TranslationLanguages as TranslationLanguages;
import backend.WeekData as WeekData;
import backend.Asset2File as Asset2File;

import objects.Alphabet as Alphabet;
import objects.AttachedSprite as AttachedSprite;
import objects.AttachedText as AttachedText;
import objects.BGSprite as BGSprite;
import objects.Boyfriend as Boyfriend;
import objects.Character as Character;
import objects.HealthIcon as HealthIcon;
import objects.Note as Note;
import objects.NoteSplash as NoteSplash;
import objects.Section as Section;
import objects.StrumNote as StrumNote;
import objects.CharSongList as CharSongList;
import objects.WireSprite as WireSprite;

import substates.MusicBeatSubstate as MusicBeatSubstate;
import substates.Prompt as Prompt;
import substates.SonicTransition as SonicTransition;

import states.PlayState as PlayState;
import states.EncoreState as EncoreState;
import states.FreeplayState as FreeplayState;
import states.TitleState as TitleState;
import states.LoadingState as LoadingState;
import states.MainMenuState as MainMenuState;
import states.Shop as Shop;
import states.SoundTestState as SoundTestState;
import states.StoryMenuState as StoryMenuState;

import psychlua.FunkinLua as FunkinLua;

#if desktop
import backend.MacroData as MacroData;
#end
#if linux
import Discord;
#end
#end
