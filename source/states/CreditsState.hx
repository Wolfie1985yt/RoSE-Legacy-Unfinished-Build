// VINE BOOM
// SHIT CODE MOMENT

package states;

#if linux
import Discord.DiscordClient;
#end
import backend.Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.FlxState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.input.gamepad.FlxGamepad;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import flixel.ui.FlxBar;
import backend.Song.SwagSong;
import objects.Section.SwagSection;
import flixel.FlxCamera;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import openfl.utils.Assets;
import sys.FileSystem;
import flixel.math.FlxMath;

using StringTools;

class CreditsState extends MusicBeatState
{
	var bgDay:FlxSprite;
	var starsDay:FlxSprite;
	var UWUDay:FlxSprite;

	var bgNight:FlxSprite;
	var starsNight:FlxSprite;
	var UWUNight:FlxSprite;
	
	var Panel:FlxSprite;
	var CreditsLeft:FlxSprite;
	var CreditsRight:FlxSprite;
	var ChangeTeamUp:FlxSprite;
	var ChangeTeamDown:FlxSprite;
	var ChangeTeamMidUP:FlxSprite;
	var ChangeTeamMidDOWN:FlxSprite;
	var CurrentTeam:FlxSprite;
	var OldTeam:FlxSprite;
	var SpecialThanks:FlxSprite;
	var Creators:FlxSprite;

	var curSelected:Int = 0;
	var positions:Array<Int> = [];
	var curFlag:String = 'RU';
	public static var curPage:String = 'NEW';
	var IsNight:Bool = false;
	var canPress:Bool = false;
	public static var RNIsHere:Bool = false;
	var CreditsX:Float = 0;
	var shiftMult:Int = 1;
	var holdTime:Float = 0;
	private var camGame:FlxCamera;
	var mouseHitbox:FlxSprite;
	
	var Credits:FlxTypedSpriteGroup<FlxSprite>;
	var CreditIcon:FlxTypedSpriteGroup<FlxSprite>;
	var CreditFlag:FlxTypedSpriteGroup<FlxSprite>;
	var CreditFrame:FlxTypedSpriteGroup<FlxSprite>;
	var CreditsTextOne:FlxTypedSpriteGroup<FlxSprite>;
	var CreditsTextTwo:FlxTypedSpriteGroup<FlxSprite>;
	var creditsListTeam:Array<Array<String>> = [ //Name - Description - Link - Country
		['Merphi', 				'Director, Main Coder', 			'https://www.youtube.com/c/MerphiPlay', 					'RU'],
		['Sulonam', 			'Co-Director, Coder, Artist',		'https://www.youtube.com/@MMMandComino', 					'CL'],
		['ХАМИНДИ', 			'Composer', 						'https://www.youtube.com/@Alex_Hamud', 						'BY'],
		['Annigram', 			'Composer', 						'https://www.youtube.com/@annigram/videos', 				'GB'],
		['Artisus', 			'Artist', 							'https://www.youtube.com/@Artless-f2y', 					'US'],
		['Avicazo', 			'Artist', 							'https://www.youtube.com/@AvicaZo', 						''],
		['Boyo', 				'Artist', 							'https://x.com/SeniorBoyo64', 								'CL'],
		['Capitan Jorge', 		'Composer', 						'https://www.youtube.com/@CapitanJorge24/videos', 			'AR'],
		['Cherrinum', 			'Main Charter, Voice Actor', 		'https://www.youtube.com/@The-Cherrie', 					'US'],
		['Dayron', 				'Artist', 							'https://www.youtube.com/@dayron5218', 						'PE'],
		['DroCaleb', 			'Composer', 						'https://x.com/RoseDrocaleb', 								'GB'],
		['DStickman', 			'Artist', 							'https://www.youtube.com/@DStickmanP', 						'VE'],
		['Engineerr', 			'Artist', 							'https://www.youtube.com/watch?v=xvFZjo5PgG0', 				'US'],
		['Estaguy', 			'Artist, Pixel Artist', 			'https://youtube.com/@Estaguy24', 							'CH'],
		['Exe', 				'Main Composer', 					'https://www.youtube.com/channel/UCNVYZhuZyzQyPmRQAKvQqXQ', 'US'],
		['Fare.dz', 			'Artist', 							'', 														''],
		['Genko Vich', 			'Artist', 							'https://x.com/Genko_xddd', 								''],
		['GioIsDead', 			'Artist', 							'https://www.youtube.com/@JustANormalYoutubeGuy', 			'US'],
		['HyperDream', 			'Main Artist', 						'https://www.youtube.com/@hyperisdreaming', 				'MN'],
		['Inski', 				'Artist, Pixel Artist', 			'https://www.youtube.com/@EduMakesStuff91', 				'MX'],
		['ItsNito', 			'Voice Actor', 						'https://www.youtube.com/@NitoIsHappy/videos', 				'ES'],
		['Kawaii', 				'Main Composer', 					'https://www.youtube.com/@SpooKster_FLP', 					'ES'],
		['KincitoBytes', 		'Composer', 						'https://www.youtube.com/channel/UCq4v2AuJxBdUNkYlwou8s5A', 'CL'],
		['KittySleeper', 		'Coder', 							'https://github.com/KittySleeper', 							'US'],
		['Kophy232', 			'Charter, Pixel Artist', 			'https://www.youtube.com/channel/UCZ1H8wMsJ0jVH57bFj6dRsA', 'PE'],
		['Kostyaher', 			'3D Artist', 						'https://www.youtube.com/channel/UC06jPWFcg062DeQAZ0GMAJg', ''],
		['LeefLett', 			'Artist, Animator', 				'https://www.youtube.com/@LeefLett', 						'US'],
		['Lich Walter', 		'3D Artist', 						'', 														''],
		['LonelyKris', 			'Charter', 							'https://www.youtube.com/@Lonely-Kris', 					'US'],
		['Luc', 				'Artist, Animator', 				'https://www.youtube.com/@LucPal165', 						'AR'],
		['Majora', 				'Artist', 							'https://www.youtube.com/channel/UCZEIlnS1W2WOvK1A0A2p4wQ', 'RU'],
		['MarioPlus12', 		'Artist', 							'https://www.youtube.com/channel/UCfNF8kY9DrPQbjNtIG-Qj9g', ''],
		['MasterX', 			'Mobile Port Coder', 				'https://www.youtube.com/@MarioMaster39', 					''],
		['Maxi2110', 			'Composer', 						'https://www.youtube.com/channel/UC8DzHLfhdv9UfjKuaS-IkpA', 'CL'],
		['MaysLastPlay', 		'Mobile Port Coder', 				'https://www.youtube.com/@MaysLastPlay', 					'UA'],
		['MeDicenKay', 			'Charter, Composer', 				'https://www.youtube.com/@MeDicenKay.', 					'CL'],
		['Melodii2b', 			'Composer', 						'https://www.youtube.com/channel/UC3Rm0SdQn0IZZlcASiVIOtA', ''],
		['Nebros', 				'Animator', 						'', 														''],
		['Obscuryth', 			'Charter', 							'https://www.youtube.com/@obscuryth', 						'HU'],
		['PurplePanic', 		'Pixel Artist', 					'', 														''],
		['Raimbowcore12', 		'Main Charter', 					'https://www.youtube.com/channel/UCkfi2umVQlsj6SUs1sTxPHg', 'ES'],
		['RedyShines', 			'Pixel Artist, Animator', 			'https://www.youtube.com/channel/UCukCkDsY7d_ReJEluJSCY_w', 'NZ'],
		['RogtaryMusic', 		'Composer', 						'https://www.youtube.com/@rogtarywips/videos', 				'CL'],
		['Sagiri', 				'Mobile Port Coder', 				'', 														''],
		['Sanko', 				'Composer', 						'https://www.youtube.com/channel/UCzRIidgZSSJhgOqgIqZxNYQ', 'MX'],
		['Scarcen', 			'Composer', 						'', 														'US'],
		['Sebas1554', 			'Artist, Animator', 				'https://www.youtube.com/@Sebas1554-amonguss', 				'PE'],
		['Sen', 				'3D Artist', 						'', 														''],
		['Shinidami', 			'Artist', 							'https://www.youtube.com/channel/UC36YQi0VmGIz89yl8fQ-yYQ', 'SD'],
		['SonicDDY', 			'Artist', 							'https://www.youtube.com/@spinetalepapyrus8910/videos', 	'AU'],
		['SonicPlay', 			'Coder, Artist', 					'https://www.youtube.com/channel/UCvHAqSEdZm6-dkGHixEQUNg', 'RU'],
		['Starszinark', 		'Charter', 							'https://www.youtube.com/@Starszinark/videos', 				'US'],
		['Surf', 				'Artist, Animator', 				'https://x.com/elpilloso', 									'PE'],
		['TcGames', 			'Artist', 							'https://x.com/Tcgames912', 								'PE'],
		['TheGreatBeyond', 		'Artist, Animator', 				'https://www.youtube.com/@TheGreatBeyond-sj6ic', 			'UA'],
		['TheWinterReaper', 	'Artist', 							'https://www.youtube.com/channel/UCwGoqxogkVOj4bdlnClkMiA', ''],
		['Tomis13t', 			'Composer', 						'https://www.youtube.com/channel/UC7SiLKAgguwWPcZb7zU9K8g', 'BR'],
		['TRENO', 				'Main Artist, Animator', 			'https://www.youtube.com/channel/UCONuNNcnJn7y12TjZvsbILg', 'VE'],
		['Wolfie_1985', 		'Coder, Charter', 					'https://www.youtube.com/channel/UC8mx-rDEJcj8PzT49bifHzw', 'US'],
		['ZolZarolZ', 			'Artist', 							'https://www.youtube.com/@zolcabeludo', 					'BR'],
	];
	var creditsListRestored:Array<Array<String>> = [ //Name - Description - Link - Country
		['Futagami', 			'Director, Artist, Charter', 			'', 													'RU'],
		['AlizaBunn', 			'Charter', 								'', 													''],
		['APartyGoer69', 		'Artist', 								'', 													''],
		['Aughnubis', 			'Charter', 								'', 													''],
		['BaTIF104', 			'Artist', 								'https://twitter.com/BaTIF104', 						''],
		['CapybaraSonic', 		'Artist', 								'', 													''],
		['Cartoon Cat', 		'Artist', 								'https://www.youtube.com/@CARTOONCAT123/videos',		'ID'],
		['DuduGD', 				'Charter', 								'', 													''],
		['Eden_Essence', 		'Composer', 							'https://www.youtube.com/@eden_essence/videos', 		'US'],
		['FNAFfan1', 			'Artist', 								'', 													''],
		['Gasper The Stupid', 	'Artist', 								'', 													''],
		['Geovanito', 			'Artist', 								'', 													''],
		['Goldenfoxy2604', 		'Charter', 								'https://www.youtube.com/@goldenfoxy2604/videos', 		'BR'],
		['Grilledpook', 		'Artist', 								'', 													''],
		['HoSky', 				'Artist', 								'', 													''],
		['InsertName011', 		'Charter', 								'', 													''],
		['ItsFellow', 			'Code Helper', 							'https://www.youtube.com/@itsfellow17/videos', 			''],
		['Lifeless', 			'Coder', 								'', 													''],
		['LilMip', 				'Artist', 								'https://www.youtube.com/@OneBoredCatbug/videos', 		''],
		['Liu', 				'Artist', 								'', 													''],
		['LOSER', 				'Charter', 								'', 													''],
		['Luigi02', 			'Charter', 								'', 													''],
		['Matrass', 			'Artist', 								'', 													''],
		['Maugerr30', 			'Artist', 								'', 													''],
		['Megalovb', 			'Pixel Artist', 						'', 													''],
		['M0nke', 				'Artist', 								'', 													''],
		['Nefarionus', 			'Charter', 								'', 													''],
		['NicolasMyt', 			'Code Helper', 							'https://gamebanana.com/members/2063514', 				''],
		['PhantomNexus', 		'Charter', 								'https://www.youtube.com/@phantomnexus3027/videos', 	''],
		['Redblurr26', 			'Artist', 								'', 													''],
		['Romgk', 				'Artist', 								'', 													''],
		['RS Productions', 		'Artist', 								'https://www.youtube.com/@RSproductions3425/videos', 	'TR'],
		['Sedol', 				'Artist', 								'', 													''],
		['Shaggy', 				'Coder, Charter', 						'https://youtu.be/R-CAjjEEdxs', 						''],
		['SleepyCat', 			'Charter', 								'', 													''],
		['Synth', 				'Charter', 								'', 													''],
		['TwinGeoduk', 			'Charter', 								'https://www.youtube.com/@TwinGeoduk/videos', 			'MX'],
		['UNI', 				'Charter', 								'', 													''],
		['WiiCube64', 			'Charter', 								'', 													''],
		['Willosaur', 			'Artist', 								'', 													''],
		['Xpastelxbloodx', 		'Composer', 							'https://www.youtube.com/@xpastelxbloodx/videos', 		''],
		['ZeroXSP', 			'Charter', 								'https://www.youtube.com/@ZeroXSP/videos', 				'']
	];	
	var creditsListST:Array<Array<String>> = [ //Name - Description - Link - Country
		['Angelgamepad', 		'Ex-Artist, Animator', 					'https://www.youtube.com/@Angelgamepad456/videos', 			'CO'],
		['Awe', 				'Very Cool Fella, Composer', 			'https://www.youtube.com/@awe9037', 						'ES'],
		['Barco', 				'Very Cool Fella', 						'https://www.youtube.com/@BarcoBasurerow', 					'UR'],
		['Bawnic', 				'Ex-Artist', 							'https://www.youtube.com/channel/UCDmeDB6bvF66KDIYwH8vs_Q', 'VN'],
		['B_Fezz', 				'Ex-Artist', 							'https://www.youtube.com/channel/UCA_psctOiIibCKUgrD6UvWg', 'PE'],
		['BeyTail', 			'Very Cool Fella', 						'https://www.youtube.com/channel/UChmeN5fWDCQbcbfUCeFbzhA', ''], 
		['Blue Demon',			'Ex-Artist', 							'', 														'BR'],
		['Boring345', 			'Ex-Composer', 							'https://www.youtube.com/@tenrecblod63', 							'TR'],
		['Bosu', 				'Ex-Artist', 							'https://www.youtube.com/@the_bosu', 						'CO'],
		['Break010', 			'Ex-Artist', 							'', 														''],
		['Chron Delta', 		'Ex-Composer', 							'https://www.youtube.com/channel/UCJKp_mponFzJo6m8ZdiauUQ', 'US'],
		['CinderSamurai', 		'Soonc Creator', 						'https://ibb.co/fvCT3S5', 									'US'],
		['Claude Speed', 		'A Good Fella', 						'https://www.youtube.com/@Claude-speed/videos', 			''],
		['Colin', 				'A Good Fella', 						'https://www.youtube.com/@Phun-Bun', 						''],
		['Danix', 				'A Good Fella', 						'', 										'CL'],
		['DanlyDaMusican', 		'Ex-Composer', 							'https://youtube.com/@DanlyDaMusician', 					'RU'],
		['Dark Blaze', 			'Very Cool Fella', 						'https://www.youtube.com/@darkblaze0443/featured', 			'IT'],
		['Diego VideoGames',	'Very Cool Fella', 						'https://www.youtube.com/@diegovideogames6317/featured', 	'VE'],
		['Doge', 				'Ex-Composer', 							'https://soundcloud.com/iamdadogeofdafuture', 				'US'],
		['Dolor de Duodeno',	'Very Cool Fella, Meme Creator', 		'https://www.youtube.com/@DDDuodeno', 						'ES'],
		['Dupanims', 			'Ex-Artist', 							'https://www.youtube.com/@dupanims7487', 					'MX'],
		['ElBro', 			'OMW Voice Actor', 						'', 						'US'],
		['EliteHack', 			'Very Cool Fella', 						'', 														'GB'],
		['Flor456', 			'Very Cool Fella', 						'https://www.youtube.com/@Elflorista', 						'SV'],
		['GAto', 				'A Good Fella', 						'https://www.youtube.com/@GAto3/videos', 					'CL'],
		['Gato Sus', 			'Very Cool Fella', 						'https://www.youtube.com/@Angeldx-yg6nw', 							''],
		['Gh0st542', 			'A Good Fella', 						'', 														'US'],
		['GhostLab', 			'Ex-Composer', 							'https://www.youtube.com/@GhostLab1321', 					'RU'],
		['Gnurla The Great',	'Very Cool Fella', 						'https://www.youtube.com/channel/UC6B2s6aSa1vgWH2j8wu1UBQ', ''],
		['Irafahell100', 		'Very Cool Fella', 						'https://www.youtube.com/@raz.19', 							'RO'],
		['John9Doe', 			'Ex-3D Artist', 						'https://x.com/john9doe1', 									''],
		['Kamilion1444455', 	'Ex-Artist', 							'', 														'PL'],
		['KraimYT', 			'Ex-Composer', 							'https://www.youtube.com/@KraimYT', 						'CL'],
		['Kurtz', 				'Aedra Epic Fella', 					'https://www.youtube.com/@kurtz__', 						'CL'],
		['Luisuke Destroyer', 			'Bratwurst Voice Actor', 						'https://www.youtube.com/@LuisukeDestroyer/videos', 						'VE'],
		['Luscious', 			'Very Cool Fella', 						'https://www.youtube.com/@luscious77', 						''],
		['Mad', 				'Very Cool Fella', 						'https://www.youtube.com/@santirz5288', 					'AR'],
		['Mastex', 				'Ex-Composer', 							'', 												''],
		['Michelle', 			'Grimbooba Voice Actor', 						'https://www.youtube.com/channel/UCNIQpGXOoX1Ghidyb-VOocQ', 					'AR'],
		['Mr Gogeta', 				'Very Cool Fella', 							'https://www.youtube.com/@HyperShadic2903ultra', 						''],
		['Mr L', 				'Aedra Epic Fella', 					'https://www.youtube.com/@misterl3464', 					'CL'],
		['Narvyy', 				'Ex-Artist', 							'https://www.youtube.com/@narvyytheartist', 				'PE'],
		['NayreFunkin', 		'Chikal Creator, Cool Fella', 						'https://www.youtube.com/@nayrefunkin9739', 				'CO'],
		['Nefastius', 			'Very Cool Fella', 						'https://www.youtube.com/@itsnefastius1622/videos', 		'EC'],
		['NickLivePro', 		'Very Cool Fella', 						'https://www.youtube.com/@niklivepro15', 							'IT'],
		['N1ck N4me', 			'Ex-Coder, Artist', 					'https://x.com/n1ckolasng', 								'US'],
		['Oratual', 			'Voice Actor', 							'https://www.youtube.com/@ceaselesstakado27', 				'AR'],
		['Pollo Rostizado', 	'Mauricio.Exe Creator', 						'https://www.youtube.com/@ronmcbonbon5660', 				'MX'],
		['RE-ES', 				'Aedra Epic Fella', 					'https://www.youtube.com/@REESIX1', 						'CL'],
		['RexNeo2190', 			'Imperial Creator, Cool Fella', 						'https://www.youtube.com/@El_rex_4521', 					'MX'],
		['RoFos', 				'Ex-Composer', 							'https://www.youtube.com/@Rofos06', 						'RU'],
		['RoSe Community', 		'A Lot of Support', 					'https://Discord.gg/nMTVdyh4Nz', 							'EA'],
		['Saldavid', 			'A Good Fella', 						'https://www.youtube.com/@Saldavid35', 						'CO'],
		['Sami', 				'Lady Tails Creator', 					'https://www.youtube.com/channel/UCUhfTbRPoc6lGpV0iSzt_Mg', 'LB'],
		['Shyllis', 			'Ex-Coder, Composer', 					'https://www.youtube.com/channel/UCFcRalyx5xObwAANx-fJ2fQ', 'UA'],
		['SilverJay25', 		'Very Cool Fella', 						'https://www.youtube.com/@SilverJaylen.25/videos', 			'US'],
		['SnakyJoel', 			'ROTD Creator', 						'https://www.youtube.com/@Snakyjoel', 						'VE'],
		['Sofia450', 		'Imperial Creator, Cool Fella', 						'https://www.youtube.com/@sofia450/featured', 				'AR'],
		['SparkPlug', 		'Ex-Voice Actor', 						'', 														'US'],
		['SSG950', 				'Exieco Creator', 						'https://www.youtube.com/@SSG950/featured', 				'DZ'],
		['Stimbo The Third', 				'Amazing Voice Actor', 						'https://www.youtube.com/@stimbothethird/videos', 				''],
		['SunTime', 			'Ex-Composer', 							'', 														''],
		['TheForgotten', 		'Very Cool Fella', 						'https://www.youtube.com./@TheForgotten0n3.', 				'AR'],
		['TheG', 		'Ex-Artist', 						'', 				''],
		['TheRealSnow', 		'Very Cool Fella', 						'https://www.youtube.com/@snowtde5', 				'PN'],
		['Torresmmo', 			'Ex-Artist, Animator', 					'https://x.com/Torrmate', 									'BR'],
		['Travis', 				'Very Cool Fella', 						'https://www.youtube.com/@ceaselesstakado27', 				'AR'],
		['Tsuki', 				'Very Cool Fella', 						'https://www.youtube.com/@75UK1M00N', 						'MX'],
		['ZimCold', 			'Very Cool Fella', 						'https://www.youtube.com/channel/UCSKIUS3EoopmGeO2_h_EDJQ', 			'']
	];
	var creditsListCreators:Array<Array<String>> = [ //Name - Description - Link - Country
		['Alepie', 		'2017x Creator', 						'https://bsky.app/profile/itsalepie.bsky.social', 						''],
		['Alex_2023', 		'YT Support, Content Creator', 						'https://www.youtube.com/@alex_20242/videos', 						'AR'],
		['Astronomical', 		'YT Support, Content Creator', 						'https://www.youtube.com/@AstroGaming07/videos', 						'GB'],
		['CommunityGame', 		'YT Support, Content Creator', 						'https://www.youtube.com/@CommunityGame/videos', 						'US'],
		['CraftyIsHere', 		'YT Support, Content Creator', 						'https://www.youtube.com/@CraftyIsHere/videos', 						''],
		['CuteyTCat', 		'Content Creator', 						'https://www.youtube.com/@CuteyTCat/videos', 						'CA'],
		['Doobus Goobus', 		'Content Creator', 						'https://www.youtube.com/@DoobusGoobus/videos', 						'US'],
		['DumboyMikey', 		'YT Support, Content Creator', 						'https://www.youtube.com/@DumboyMikey/videos', 						'US'],
		['Elithios', 		'YT Support, Content Creator', 						'https://www.youtube.com/@elithios_exe', 						'BE'],
		['Exetior', 		'YT Support, Content Creator', 						'https://www.youtube.com/@sonichedgehog4972/videos', 						''],
		['Flasticundo 2.0', 		'YT Support, Content Creator', 						'https://www.youtube.com/@flasticundo.2.053/videos', 						''],
		['Game Theory', 		'Content Creator', 						'https://www.youtube.com/watch?v=_3DHGXgZ-_s', 						'US'],
		['GasGrass', 		'Path To Deicide Creator', 						'https://www.youtube.com/channel/UCYDwoXHN8qhNItFL5xSGnUQ', 						'US'],
		['Hirokazu Yasuhara', 		'Sonic The Hedgehog BG Designer', 						'', 						'JP'],
		['IagoAnims', 		'Minus Sonic.exe Creator', 						'https://x.com/iagoanimator', 						''],
		['ImThatBlueWolf', 		'Forgotten Creator', 						'https://www.youtube.com/@blazingrose_5624/videos', 						'CH'],
		['InstaFiz', 		'Xendio Creator', 						'https://www.youtube.com/@InstaFiz/videos', 						'US'],
		['Jibalex', 		'YT Support, Content Creator', 						'https://www.youtube.com/@jibalex17/videos', 						'ES'],
		['Kirby-Popstar', 		'Sonk.rom Creator', 						'https://www.youtube.com/@Kirby_Popstar/videos', 						'MX'],
		['Mecazagurei', 		'YT Support, Content Creator', 						'https://www.youtube.com/@Mecazagurei', 						''],
		['Mr. Grimbo Shrimbo', 		'YT Support, Content Creator', 						'https://www.youtube.com/@AshuraGoneReal29/videos', 						'US'],
		['Mr. Kanxz', 		'YT Support, Content Creator', 						'https://www.youtube.com/@mrkanxz4k', 						'CL'],
		['Mr. Kitten', 		'YT Support, Content Creator', 						'https://www.youtube.com/@pm_me_sum_kittens_pls/videos', 						'US'],
		['MY5TCrimson', 		'Crimson Creator', 						'https://www.youtube.com/@MY5TCrimson/featured', 						''],
		['Naoto Oshima', 		'Sonic Character Designer', 						'', 						'JP'],
		['Neutroa', 		'Nantelle Creator', 						'https://www.youtube.com/@Neutroa/videos', 						'US'],
		['NickGamer', 		'YT Support, Content Creator', 						'https://www.youtube.com/channel/UCLsm_r8RrJ5uhV-GY5BT3CA', 						'MX'],
		['OniiAnubis', 		'YT Support, Content Creator', 						'https://www.youtube.com/@OniiFNF/videos', 						'US'],
		['Petur Wentzlau', 		'Tanic Creator', 						'https://www.youtube.com/@peturwentzlau494/videos', 						'FI'],
		['Presto McFanta', 		'Baby X Creator', 						'https://www.youtube.com/channel/UC6nQTcu9oonqhQb0no8-YOw', 						''],
		['Raenablaize626', 		'Fanon Creator', 						'https://gamebanana.com/members/2482525', 						''],
		['Randidesu', 		'Sonic.raw Creator', 						'https://www.youtube.com/@randidesu/videos', 						'US'],
		['Riveren', 		'Psych Engine Main Artist', 						'https://x.com/riverennn?lang=es', 						''],
		['Ruisna', 		'YT Support, Content Creator', 						'https://www.youtube.com/@CoverRuisna/videos', 						'MX'],
		['Ryzzon', 		'YT Support, Content Creator', 						'https://www.youtube.com/@Ryzzon/videos', 						'US'],
		['SEGA Corporation', 		'Sonic Games and Characters', 						'https://www.sega.com/homepage', 						'JP'],
		['Shadow Mario', 		'Psych Engine Creator', 						'https://github.com/ShadowMario', 						'BR'],
		['Silverd51_YT', 		'YT Support, Content Creator', 						'https://www.youtube.com/@silverd51_YT', 						'MX'],
		['Sinical', 		'Catherious Creator', 						'https://www.youtube.com/channel/UCJhPTbD5WXjQuAJGh5GXzAw', 						'CL'],
		['Sinuois', 		'Blue Pendrive Creator', 						'https://www.youtube.com/@sinuois/videos', 						'CL'],
		['Sonic Team', 		'The Best and Coolest Team', 						'https://x.com/sonic_hedgehog', 						'JP'],
		['Sox', 		'Gangsta Creator', 						'https://www.youtube.com/@Lumix-m7s/videos', 						''],
		['Sr Pelo', 		'Cartoonist and Animator', 						'https://www.youtube.com/@SrPelo', 						'MX'],
		['Superfoxi543', 		'YT Support, Content Creator', 						'https://www.youtube.com/@Superfoxi543-Oficial/videos', 						'CO'],
		['The Funkin Crew Inc', 		'FNF Creators and Leaders', 						'https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game', 		'NW'],
		['TOKCU4', 		'YT Support, Content Creator', 						'https://www.youtube.com/@tvoy.toksya/videos', 						'RU'],
		['Tour De Pizza', 		'Pizza Tower and Snick Creator', 						'https://x.com/PizzaTowergame', 						'CA'],
		['Vix Entertainment', 		'Overdrive Creator', 						'https://www.youtube.com/@NewVix/videos', 						'AR'],
		['Yuji Naka', 		'Sonic The Hedgehog Coder', 						'', 						'JP'],
		['Zmed_', 		'Symbiote Speed Creator', 						'https://x.com/Zmed_817', 						'AR'],
	];	
	
	
	override function create()
	{
		var Cursor = new states.CursorLoadState();

		Paths.clearUnusedMemory();
		Paths.clearStoredMemory();

		#if linux
		DiscordClient.imageRpc = 'credits';
		var rpcName:String = 'In Credits Menu';
		if (TranslationLanguages.Text.exists(rpcName) && ClientPrefs.Language != 'English')
			rpcName = TranslationLanguages.Text[rpcName];
		DiscordClient.changePresence(rpcName, null);
		#end
		
		camGame = new FlxCamera();
		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];
		
		FlxG.sound.playMusic(Paths.music('credits'), 0);
		FlxG.sound.music.fadeIn(0.5, 0, 0.6);

		var dif = 0;
		for (i in 0...creditsListCreators.length+creditsListRestored.length+creditsListST.length+creditsListTeam.length) {
			positions.insert(i, dif);
			dif -= 400;
		}

		//Day
		bgDay = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/day/bg'));
		bgDay.antialiasing = ClientPrefs.globalAntialiasing;
		bgDay.scrollFactor.set();
		add(bgDay);
		
		starsDay = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/day/stars'));
		starsDay.antialiasing = ClientPrefs.globalAntialiasing;
		starsDay.scrollFactor.set();
		add(starsDay);
		
		UWUDay = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/day/uwu'));
		UWUDay.antialiasing = ClientPrefs.globalAntialiasing;
		UWUDay.scrollFactor.set();
		add(UWUDay);
		
		//Night
		bgNight = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/night/bg'));
		bgNight.antialiasing = ClientPrefs.globalAntialiasing;
		bgNight.scrollFactor.set();
		bgNight.alpha = 0;
		add(bgNight);
		
		starsNight = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/night/stars'));
		starsNight.antialiasing = ClientPrefs.globalAntialiasing;
		starsNight.scrollFactor.set();
		starsNight.alpha = 0;
		add(starsNight);

		UWUNight = new FlxSprite(0, 0).loadGraphic(Paths.image('credits/night/uwu'));
		UWUNight.antialiasing = ClientPrefs.globalAntialiasing;
		UWUNight.scrollFactor.set();
		UWUNight.alpha = 0;
		add(UWUNight);
		
		//Credits
		Panel = new FlxSprite(0, 420).loadGraphic(Paths.image('credits/credits-stuff/panel'));
		Panel.antialiasing = ClientPrefs.globalAntialiasing;
		Panel.scrollFactor.set();
		Panel.alpha = 0;
		add(Panel);
		
		CreditIcon = new FlxTypedSpriteGroup<FlxSprite>();
		add(CreditIcon);
		CreditFlag = new FlxTypedSpriteGroup<FlxSprite>();
		add(CreditFlag);
		CreditFrame = new FlxTypedSpriteGroup<FlxSprite>();
		add(CreditFrame);
		CreditsTextOne = new FlxTypedSpriteGroup<FlxSprite>();
		add(CreditsTextOne);
		CreditsTextTwo = new FlxTypedSpriteGroup<FlxSprite>();
		add(CreditsTextTwo);
		
		switch(curPage) {
			case 'NEW':
				for (i in 0...creditsListTeam.length)
				{			
					var icon:FlxSprite = new FlxSprite(437 + CreditsX, 465);
					icon.ID = i;
					switch(creditsListTeam[i][0]) {
						case 'Torresmmo':
							icon.frames = Paths.getSparrowAtlas('credits/credits-stuff/icons/Torresmmo');
							icon.animation.addByPrefix('torr', 'Torresmmo', 24);
							icon.animation.play('torr', true);
						default:
					  	#if desktop
							if (FileSystem.exists('assets/images/credits/credits-stuff/icons/' + creditsListTeam[i][0] + '.png'))
							#else
							if (Assets.exists('assets/images/credits/credits-stuff/icons/' + creditsListTeam[i][0] + '.png'))
							#end
								icon.loadGraphic(Paths.image('credits/credits-stuff/icons/' + creditsListTeam[i][0]));
							else
								icon.loadGraphic(Paths.image('credits/credits-stuff/icons/placeholder'));
					}
					icon.antialiasing = ClientPrefs.globalAntialiasing;
					icon.scrollFactor.set();
					CreditIcon.add(icon);
					
					if(creditsListTeam[i][3] != '')
						curFlag = creditsListTeam[i][3];
					else
						curFlag = 'unknown';
					
					var flag:FlxSprite = new FlxSprite(791 + CreditsX, 467);
					flag.ID = i;
					flag.loadGraphic(Paths.image('credits/credits-stuff/flags/' + curFlag));
					flag.antialiasing = ClientPrefs.globalAntialiasing;
					flag.scrollFactor.set();
					CreditFlag.add(flag);
				
					var frame:FlxSprite = new FlxSprite(420 + CreditsX, 448);
					frame.ID = i;
					frame.loadGraphic(Paths.image('credits/credits-stuff/frame'));
					frame.antialiasing = ClientPrefs.globalAntialiasing;
					frame.scrollFactor.set();
					CreditFrame.add(frame);
					
					var nickname:FlxText = new FlxText(CreditsX + 200, 505, FlxG.width, creditsListTeam[i][0], 18);
					nickname.ID = i;
					nickname.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 17);
					nickname.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextOne.add(nickname);
					
					var work:FlxText = new FlxText(CreditsX + 200, 590, FlxG.width, creditsListTeam[i][1], 18);
					work.ID = i;
					work.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 15);
					work.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextTwo.add(work);
					
					CreditsX += 400;
				}
			case 'OLD':
				for (i in 0...creditsListRestored.length)
				{			
					var icon:FlxSprite = new FlxSprite(437 + CreditsX, 465);
					icon.ID = i;
					#if desktop
					if (FileSystem.exists('assets/images/credits/credits-stuff/icons/' + creditsListRestored[i][0] + '.png'))
					#else
					if (Assets.exists('assets/images/credits/credits-stuff/icons/' + creditsListRestored[i][0] + '.png'))
					#end
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/' + creditsListRestored[i][0]));
					else
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/placeholder'));
					icon.antialiasing = ClientPrefs.globalAntialiasing;
					icon.scrollFactor.set();
					CreditIcon.add(icon);
					
					if(creditsListRestored[i][3] != '')
						curFlag = creditsListRestored[i][3];
					else
						curFlag = 'unknown';
					
					var flag:FlxSprite = new FlxSprite(791 + CreditsX, 467);
					flag.ID = i;
					flag.loadGraphic(Paths.image('credits/credits-stuff/flags/' + curFlag));
					flag.antialiasing = ClientPrefs.globalAntialiasing;
					flag.scrollFactor.set();
					CreditFlag.add(flag);
				
					var frame:FlxSprite = new FlxSprite(420 + CreditsX, 448);
					frame.ID = i;
					frame.loadGraphic(Paths.image('credits/credits-stuff/frame'));
					frame.antialiasing = ClientPrefs.globalAntialiasing;
					frame.scrollFactor.set();
					CreditFrame.add(frame);
					
					var nickname:FlxText = new FlxText(CreditsX + 200, 505, FlxG.width, creditsListRestored[i][0], 18);
					nickname.ID = i;
					nickname.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 17, FlxColor.fromRGB(255, 255, 255));
					nickname.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextOne.add(nickname);
					
					var work:FlxText = new FlxText(CreditsX + 200, 590, FlxG.width, creditsListRestored[i][1], 18);
					work.ID = i;
					work.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 15, FlxColor.fromRGB(255, 255, 255));
					work.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextTwo.add(work);
					
					CreditsX += 400;
				}
			case 'ST':
				for (i in 0...creditsListST.length)
				{			
					var icon:FlxSprite = new FlxSprite(437 + CreditsX, 465);
					icon.ID = i;
					#if desktop
					if (FileSystem.exists('assets/images/credits/credits-stuff/icons/' + creditsListST[i][0] + '.png'))
					#else
					if (Assets.exists('assets/images/credits/credits-stuff/icons/' + creditsListST[i][0] + '.png'))
					#end
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/' + creditsListST[i][0]));
					else
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/placeholder'));
					icon.antialiasing = ClientPrefs.globalAntialiasing;
					icon.scrollFactor.set();
					CreditIcon.add(icon);
					
					if(creditsListST[i][3] != '')
						curFlag = creditsListST[i][3];
					else
						curFlag = 'unknown';
					
					var flag:FlxSprite = new FlxSprite(791 + CreditsX, 467);
					flag.ID = i;
					flag.loadGraphic(Paths.image('credits/credits-stuff/flags/' + curFlag));
					flag.antialiasing = ClientPrefs.globalAntialiasing;
					flag.scrollFactor.set();
					CreditFlag.add(flag);
				
					var frame:FlxSprite = new FlxSprite(420 + CreditsX, 448);
					frame.ID = i;
					frame.loadGraphic(Paths.image('credits/credits-stuff/frame'));
					frame.antialiasing = ClientPrefs.globalAntialiasing;
					frame.scrollFactor.set();
					CreditFrame.add(frame);
					
					var nickname:FlxText = new FlxText(CreditsX + 200, 505, FlxG.width, creditsListST[i][0], 18);
					nickname.ID = i;
					nickname.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 17, FlxColor.fromRGB(255, 255, 255));
					nickname.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextOne.add(nickname);
					
					var work:FlxText = new FlxText(CreditsX + 200, 590, FlxG.width, creditsListST[i][1], 18);
					work.ID = i;
					work.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 15, FlxColor.fromRGB(255, 255, 255));
					work.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextTwo.add(work);
					
					CreditsX += 400;
				}
			case 'CREATORS':
				for (i in 0...creditsListCreators.length)
				{			
					var icon:FlxSprite = new FlxSprite(437 + CreditsX, 465);
					icon.ID = i;
					#if desktop
					if (FileSystem.exists('assets/images/credits/credits-stuff/icons/' + creditsListCreators[i][0] + '.png'))
					#else
					if (Assets.exists('assets/images/credits/credits-stuff/icons/' + creditsListCreators[i][0] + '.png'))
					#end
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/' + creditsListCreators[i][0]));
					else
						icon.loadGraphic(Paths.image('credits/credits-stuff/icons/placeholder'));
					icon.antialiasing = ClientPrefs.globalAntialiasing;
					icon.scrollFactor.set();
					CreditIcon.add(icon);
					
					if(creditsListCreators[i][3] != '')
						curFlag = creditsListCreators[i][3];
					else
						curFlag = 'unknown';
					
					var flag:FlxSprite = new FlxSprite(791 + CreditsX, 467);
					flag.ID = i;
					flag.loadGraphic(Paths.image('credits/credits-stuff/flags/' + curFlag));
					flag.antialiasing = ClientPrefs.globalAntialiasing;
					flag.scrollFactor.set();
					CreditFlag.add(flag);
				
					var frame:FlxSprite = new FlxSprite(420 + CreditsX, 448);
					frame.ID = i;
					frame.loadGraphic(Paths.image('credits/credits-stuff/frame'));
					frame.antialiasing = ClientPrefs.globalAntialiasing;
					frame.scrollFactor.set();
					CreditFrame.add(frame);
					
					var nickname:FlxText = new FlxText(CreditsX + 200, 505, FlxG.width, creditsListCreators[i][0], 18);
					nickname.ID = i;
					nickname.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 17);
					nickname.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextOne.add(nickname);
					
					var work:FlxText = new FlxText(CreditsX + 200, 590, FlxG.width, creditsListCreators[i][1], 18);
					work.ID = i;
					work.setFormat(Paths.font("sonic-cd-menu-font.ttf"), 15);
					work.antialiasing = ClientPrefs.globalAntialiasing;
					CreditsTextTwo.add(work);
					
					CreditsX += 400;
				}
			}
		CreditIcon.alpha = 0;
		CreditFlag.alpha = 0;
		CreditFrame.alpha = 0;
		CreditsTextOne.alpha = 0;
		CreditsTextTwo.alpha = 0;
		
		CreditsLeft = new FlxSprite(355, 524).loadGraphic(Paths.image('credits/credits-stuff/left'));
		CreditsLeft.antialiasing = ClientPrefs.globalAntialiasing;
		CreditsLeft.scrollFactor.set();
		CreditsLeft.alpha = 0;
		add(CreditsLeft);
		
		CreditsRight = new FlxSprite(889, 524).loadGraphic(Paths.image('credits/credits-stuff/right'));
		CreditsRight.antialiasing = ClientPrefs.globalAntialiasing;
		CreditsRight.scrollFactor.set();
		CreditsRight.alpha = 0;
		add(CreditsRight);
		
		ChangeTeamUp = new FlxSprite(942, 384).loadGraphic(Paths.image('credits/credits-stuff/up'));
		ChangeTeamUp.antialiasing = ClientPrefs.globalAntialiasing;
		ChangeTeamUp.scrollFactor.set();
		ChangeTeamUp.alpha = 0;
		add(ChangeTeamUp);
		
		ChangeTeamDown = new FlxSprite(942, 384).loadGraphic(Paths.image('credits/credits-stuff/down'));
		ChangeTeamDown.antialiasing = ClientPrefs.globalAntialiasing;
		ChangeTeamDown.scrollFactor.set();
		ChangeTeamDown.alpha = 0;
		add(ChangeTeamDown);
		
		ChangeTeamMidUP = new FlxSprite(942, 373).loadGraphic(Paths.image('credits/credits-stuff/up'));
		ChangeTeamMidUP.antialiasing = ClientPrefs.globalAntialiasing;
		ChangeTeamMidUP.scrollFactor.set();
		ChangeTeamMidUP.alpha = 0;
		add(ChangeTeamMidUP);
		
		ChangeTeamMidDOWN = new FlxSprite(942, 395).loadGraphic(Paths.image('credits/credits-stuff/down'));
		ChangeTeamMidDOWN.antialiasing = ClientPrefs.globalAntialiasing;
		ChangeTeamMidDOWN.scrollFactor.set();
		ChangeTeamMidDOWN.alpha = 0;
		add(ChangeTeamMidDOWN);
		
		CurrentTeam = new FlxSprite(1071, 383).loadGraphic(Paths.image('credits/credits-stuff/current-team'));
		CurrentTeam.antialiasing = ClientPrefs.globalAntialiasing;
		CurrentTeam.scrollFactor.set();
		CurrentTeam.alpha = 0;
		add(CurrentTeam);

		OldTeam = new FlxSprite(983, 383).loadGraphic(Paths.image('credits/credits-stuff/old-team'));
		OldTeam.antialiasing = ClientPrefs.globalAntialiasing;
		OldTeam.scrollFactor.set();
		OldTeam.alpha = 0;
		add(OldTeam);
		if (TranslationLanguages.Files.contains("credits/credits-stuff/old-team") && ClientPrefs.Language != 'English')
			OldTeam.x = 997;
		
		SpecialThanks = new FlxSprite(1034, 383).loadGraphic(Paths.image('credits/credits-stuff/special-thanks'));
		SpecialThanks.antialiasing = ClientPrefs.globalAntialiasing;
		SpecialThanks.scrollFactor.set();
		SpecialThanks.alpha = 0;
		add(SpecialThanks);

		Creators = new FlxSprite(1083, 383).loadGraphic(Paths.image('credits/credits-stuff/creators'));
		Creators.antialiasing = ClientPrefs.globalAntialiasing;
		Creators.scrollFactor.set();
		Creators.alpha = 0;
		add(Creators);

		if (TranslationLanguages.Files.contains("credits/credits-stuff/special-thanks") && ClientPrefs.Language != 'English')
			SpecialThanks.x = 997;
		
		mouseHitbox = new FlxSprite(420,448).makeGraphic(440,204, 0x00000000);
		add(mouseHitbox);
		
		if (!RNIsHere) {
			new FlxTimer().start(1.5, function(hello:FlxTimer)
			{
				FlxTween.tween(bgDay, {alpha: 0}, 1.0, {ease: FlxEase.expoInOut});
				FlxTween.tween(starsDay, {alpha: 0}, 1.0, {ease: FlxEase.expoInOut});
				FlxTween.tween(UWUDay, {alpha: 0}, 1.0, {ease: FlxEase.expoInOut});
				
				FlxTween.tween(bgNight, {alpha: 1}, 1.0, {ease: FlxEase.expoInOut});
				FlxTween.tween(starsNight, {alpha: 1}, 1.0, {ease: FlxEase.expoInOut});
				FlxTween.tween(UWUNight, {alpha: 1}, 0.8, {ease: FlxEase.expoInOut});
				
				new FlxTimer().start(1.5, function(hello:FlxTimer)
				{
					Credits = new FlxTypedSpriteGroup<FlxSprite>();
					Credits.add(CreditIcon);
					Credits.add(CreditFlag);
					Credits.add(CreditFrame);
					IsNight = true;
					RNIsHere = true;
					canPress = true;
					FlxTween.tween(Panel, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditIcon, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditFlag, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditFrame, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditsTextOne, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditsTextTwo, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditsLeft, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CreditsRight, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(ChangeTeamDown, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					FlxTween.tween(CurrentTeam, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
					
					Select(curSelected, '', false);
				});
			});
		} else {
			bgDay.alpha = 0;
			starsDay.alpha = 0;
			UWUDay.alpha = 0;
			bgNight.alpha = 1;
			starsNight.alpha = 1;
			UWUNight.alpha = 1;
			Credits = new FlxTypedSpriteGroup<FlxSprite>();
			Credits.add(CreditIcon);
			Credits.add(CreditFlag);
			Credits.add(CreditFrame);
			IsNight = true;
			canPress = true;
			if (curPage == 'NEW') ChangeTeamDown.alpha = 1;
			if (curPage == 'OLD' || curPage == 'ST') ChangeTeamMidUP.alpha = 1;
			if (curPage == 'OLD' || curPage == 'ST') ChangeTeamMidDOWN.alpha = 1;
			if (curPage == 'CREATORS') ChangeTeamUp.alpha = 1;
			if (curPage == 'NEW') CurrentTeam.alpha = 1;
			if (curPage == 'OLD') OldTeam.alpha = 1;
			if (curPage == 'ST') SpecialThanks.alpha = 1;
			if (curPage == 'CREATORS') Creators.alpha = 1;
			FlxTween.tween(Panel, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditIcon, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditFlag, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditFrame, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditsTextOne, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditsTextTwo, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditsLeft, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
			FlxTween.tween(CreditsRight, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});

			Select(curSelected, '', false);
		}
		super.create();
	}
	override function update(elapsed:Float)
	{
		#if desktop
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
        if (gamepad != null && ClientPrefs.controllerMode == false) {
			ClientPrefs.controllerMode = true;
			ClientPrefs.saveSettings();
			trace('Controller Connected: ' + ClientPrefs.controllerMode);
		}
		if (gamepad == null && ClientPrefs.controllerMode == true) {
			ClientPrefs.controllerMode = false;
			ClientPrefs.saveSettings();
			trace('Controller Connected: ' + ClientPrefs.controllerMode);
		}
		#end

		if ((controls.BACK || FlxG.mouse.justPressedRight #if mobile || FlxG.android.justReleased.BACK #end) && canPress)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
			FlxG.switchState(new MainMenuState());
			canPress = false;
			RNIsHere = false;
			curPage = 'NEW';
		}
		
		if(FlxG.keys.pressed.SHIFT) {
			shiftMult = 3;
		} else {
			shiftMult = 1;
		}
		
		if (IsNight && canPress) {
			var upP = controls.UI_UP_P;
			var downP = controls.UI_DOWN_P;
			var leftP = controls.UI_LEFT_P;
			var rightP = controls.UI_RIGHT_P;
			
			if (leftP)
			{
				Select(-shiftMult, 'left', true);
				holdTime = 0;
			}
			if (rightP)
			{
				Select(shiftMult, 'right', true);
				holdTime = 0;
			}
			if (controls.UI_LEFT || controls.UI_RIGHT)
			{
				var checkLastHold:Int = Math.floor((holdTime - 0.5) * 10);
				holdTime += elapsed;
				var checkNewHold:Int = Math.floor((holdTime - 0.5) * 10);

				if(holdTime > 0.5 && checkNewHold - checkLastHold > 0)
				{
					if (controls.UI_LEFT) Select((checkNewHold - checkLastHold) * (controls.UI_LEFT ? -shiftMult : shiftMult), 'left', true);
					if (controls.UI_RIGHT) Select((checkNewHold - checkLastHold) * (controls.UI_LEFT ? -shiftMult : shiftMult), 'right', true);
				}
			}
			if (FlxG.mouse.wheel != 0)
			{
				if (FlxG.mouse.wheel > 0) Select(-shiftMult * FlxG.mouse.wheel,'left', true);
				if (FlxG.mouse.wheel < 0) Select(-shiftMult * FlxG.mouse.wheel,'right', true);
			}
			if (FlxG.mouse.overlaps(CreditsLeft) && FlxG.mouse.justPressed) Select(-1, 'left', true);
			if (FlxG.mouse.overlaps(CreditsRight) && FlxG.mouse.justPressed) Select(1, 'right', true);
			if (upP && curPage != 'NEW' || (FlxG.mouse.overlaps(ChangeTeamUp) && FlxG.mouse.justPressed) || (FlxG.mouse.overlaps(ChangeTeamMidUP) && FlxG.mouse.justPressed)) {
				FlxTween.tween(Panel, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(Credits, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsTextOne, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsTextTwo, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsLeft, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsRight, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(ChangeTeamUp, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				
				switch(curPage) {
					case 'OLD':
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamDown, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidUP, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(CurrentTeam, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
					case 'ST':
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamDown, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidUP, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
					case 'CREATORS':
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamDown, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidUP, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(CurrentTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				}

				new FlxTimer().start(0.5, function(hello:FlxTimer)
				{
					switch(curPage) {
						case 'OLD':
							curPage = 'NEW';
						case 'ST':
							curPage = 'OLD';
						case 'CREATORS':
							curPage = 'ST';
					}
					FlxTransitionableState.skipNextTransIn = true; 
					FlxTransitionableState.skipNextTransOut = true; 
					MusicBeatState.switchState(new states.CreditsState());
				});
				canPress = false;
				IsNight = false;
			}
			if (downP && curPage != 'CREATORS' || (FlxG.mouse.overlaps(ChangeTeamDown) && FlxG.mouse.justPressed) || (FlxG.mouse.overlaps(ChangeTeamMidDOWN) && FlxG.mouse.justPressed)) {
				FlxTween.tween(Panel, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(Credits, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsTextOne, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsTextTwo, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsLeft, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(CreditsRight, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
				FlxTween.tween(ChangeTeamDown, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});

				switch(curPage) {
					case 'NEW':
						FlxTween.tween(ChangeTeamMidUP, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamUp, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(CurrentTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
					case 'OLD':
						FlxTween.tween(ChangeTeamMidUP, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamUp, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(CurrentTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
					case 'ST':
						FlxTween.tween(ChangeTeamMidUP, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamMidDOWN, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(ChangeTeamUp, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(CurrentTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(OldTeam, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(SpecialThanks, {alpha: 0}, 0.2, {ease: FlxEase.expoInOut});
						FlxTween.tween(Creators, {alpha: 1}, 0.2, {ease: FlxEase.expoInOut});
				}

				new FlxTimer().start(0.5, function(hello:FlxTimer)
					{
						switch(curPage) {
							case 'NEW':
								curPage = 'OLD';
							case 'OLD':
								curPage = 'ST';
							case 'ST':
								curPage = 'CREATORS';
						}
						FlxTransitionableState.skipNextTransIn = true; 
						FlxTransitionableState.skipNextTransOut = true; 
						MusicBeatState.switchState(new states.CreditsState());
					});
				canPress = false;
				IsNight = false;
			}
			
			if ((controls.ACCEPT || (FlxG.mouse.overlaps(mouseHitbox) && (FlxG.mouse.justPressed || FlxG.mouse.justPressedMiddle))) && canPress) {
				switch(curPage) {
					case 'NEW':
						if(creditsListTeam[curSelected][2] != '')
							CoolUtil.browserLoad(creditsListTeam[curSelected][2]);
					case 'OLD':
						if(creditsListRestored[curSelected][2] != '')
							CoolUtil.browserLoad(creditsListRestored[curSelected][2]);
					case 'ST':
						if(creditsListST[curSelected][2] != '')
							CoolUtil.browserLoad(creditsListST[curSelected][2]);
					case 'CREATORS':
						if(creditsListCreators[curSelected][2] != '')
							CoolUtil.browserLoad(creditsListCreators[curSelected][2]);
				}
			}
		}
		
		if (IsNight) {
			Credits.forEach(function(spr:FlxSprite)
			{
				Credits.x = FlxMath.lerp(Credits.x, positions[curSelected], CoolUtil.boundTo(elapsed * 8, 0, 1));
			});
			CreditIcon.forEach(function(spr:FlxSprite)
			{
				if (spr.ID == curSelected) {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 465, CoolUtil.boundTo(elapsed * 8, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 0, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 555, CoolUtil.boundTo(elapsed * 8, 0, 1));
				}
			});
			CreditFlag.forEach(function(spr:FlxSprite)
			{
				if (spr.ID == curSelected) {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 467, CoolUtil.boundTo(elapsed * 8, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 0, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 557, CoolUtil.boundTo(elapsed * 8, 0, 1));
				}
			});
			CreditFrame.forEach(function(spr:FlxSprite)
			{
				if (spr.ID == curSelected) {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 448, CoolUtil.boundTo(elapsed * 8, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 0, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 538, CoolUtil.boundTo(elapsed * 8, 0, 1));
				}
			});
			CreditsTextOne.x = Credits.x + 343;
			CreditsTextTwo.x = Credits.x + 245;
			CreditsTextOne.forEach(function(spr:FlxSprite)
			{
				if (spr.ID == curSelected) {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 505, CoolUtil.boundTo(elapsed * 8, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 0, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.y = FlxMath.lerp(spr.y, 510, CoolUtil.boundTo(elapsed * 8, 0, 1));
				}
			});
			CreditsTextTwo.forEach(function(spr:FlxSprite)
			{
				if (spr.ID == curSelected) {
					spr.alpha = FlxMath.lerp(spr.alpha, 1, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 1, CoolUtil.boundTo(elapsed * 8, 0, 1));
					if (curPage == 'ST') spr.y = FlxMath.lerp(spr.y, 600, CoolUtil.boundTo(elapsed * 8, 0, 1));
					else spr.y = FlxMath.lerp(spr.y, 590, CoolUtil.boundTo(elapsed * 8, 0, 1));
				} else {
					spr.alpha = FlxMath.lerp(spr.alpha, 0, CoolUtil.boundTo(elapsed * 24, 0, 1));
					spr.scale.x = FlxMath.lerp(spr.scale.x, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					spr.scale.y = FlxMath.lerp(spr.scale.y, 0.7, CoolUtil.boundTo(elapsed * 8, 0, 1));
					if (curPage == 'ST') spr.y = FlxMath.lerp(spr.y, 605, CoolUtil.boundTo(elapsed * 8, 0, 1));
					else spr.y = FlxMath.lerp(spr.y, 595, CoolUtil.boundTo(elapsed * 8, 0, 1));
				}
			});
		}
	}
	
	function Select(sel:Int = 0, woo:String = '', ?kys:Bool = false) {
		if (kys) FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		curSelected += sel;
		switch(curPage) {
			case 'NEW':
				if (curSelected >= creditsListTeam.length)
					curSelected = 0;
				if (curSelected < 0)
					curSelected = creditsListTeam.length - 1;
			case 'OLD':
				if (curSelected >= creditsListRestored.length)
					curSelected = 0;
				if (curSelected < 0)
					curSelected = creditsListRestored.length - 1;
			case 'ST':
				if (curSelected >= creditsListST.length)
					curSelected = 0;
				if (curSelected < 0)
					curSelected = creditsListST.length - 1;
			case 'CREATORS':
				if (curSelected >= creditsListCreators.length)
					curSelected = 0;
				if (curSelected < 0)
					curSelected = creditsListCreators.length - 1;
		}
		
		var CreditsWooLeft:FlxSprite;
		var CreditsWooRight:FlxSprite;
		switch(woo) {
			case 'left':				
				CreditsWooLeft = new FlxSprite(355, 524).loadGraphic(Paths.image('credits/credits-stuff/left'));
				CreditsWooLeft.antialiasing = ClientPrefs.globalAntialiasing;
				CreditsWooLeft.scrollFactor.set();
				add(CreditsWooLeft);
				FlxTween.tween(CreditsWooLeft, {x: 105}, 0.3, {ease: FlxEase.quadIn});
				FlxTween.tween(CreditsWooLeft, {alpha: 0}, 0.3, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.31, function(tmr:FlxTimer) {
					CreditsWooLeft.destroy();
				});
			case 'right':			
				CreditsWooRight = new FlxSprite(889, 524).loadGraphic(Paths.image('credits/credits-stuff/right'));
				CreditsWooRight.antialiasing = ClientPrefs.globalAntialiasing;
				CreditsWooRight.scrollFactor.set();
				add(CreditsWooRight);
				FlxTween.tween(CreditsWooRight, {x: 1139}, 0.3, {ease: FlxEase.quadIn});
				FlxTween.tween(CreditsWooRight, {alpha: 0}, 0.3, {ease: FlxEase.quadIn});
				new FlxTimer().start(0.31, function(tmr:FlxTimer) {
					CreditsWooRight.destroy();
				});
		}
	}
}