package objects; 

class SoundTestList 
{ 
	public static var codeType:String = '';
	public static var codeCharacter:String = '';
	public static var codeSongs:Array<String> = [];
	public static var codeWeek:Bool = false;
	public static var codeIcon:String = '';
	public static var codeImgOrVideo:String = '';
	public static var codeImgSound:Bool = false;
	public static var codePushClientPrefs:Bool = false;
	public static var codeClientPrefsPushString:String = '';
	public static var codeGore:Bool = false;
	public static var codeWeekNum:Int = 0;

	private static function setCodes() {
		codes.set("12-25", "songs-majin");
		codes.set("7-7", "songs-lord x");
		codes.set("69-69", "songs-sunky");
		codes.set("18-21", "songs-melthog");
		codes.set("66-6", "songs-tails doll");
		codes.set("8-21", "songs-fleetway");
		codes.set("31-13", "songs-faker");
		codes.set("0-0", "songs-sanic");
		codes.set("25-12", "songs-christmas");
		codes.set("0-50", "songs-fatal error");
		codes.set("23-2", "substates-furnace");
		codes.set("16-10", "songs-needlemouse");
		codes.set("20-8", "songs-luther");
		codes.set("5-23", "songs-coldsteel");
		codes.set("2-24", "songs-secret histories tails");
		codes.set("42-75", "songs-demogri and griatos");
		codes.set("0-25", "songs-xterion");
		codes.set("5-12", "songs-devoid");
		codes.set("30-17", "songs-shp and genesys");
		codes.set("1-11", "songs-chaotix");
		codes.set("50-50", "songs-hog");
		codes.set("9-19", "songs-curse");
		codes.set("19-1", "songs-normal cd");
		codes.set("99-99", "songs-apollyon");
		codes.set("66-99", "songs-satanos");
		codes.set("19-96", "substates-edusoft");
		codes.set("18-38", "songs-no name");
		codes.set("3-0", "songs-gameover");
		codes.set("6-4", "songs-requital");
		codes.set("20-5", "songs-sl4sh");
		codes.set("80-80", "songs-mono.bw");
		codes.set("16-24", "songs-dsk");
		codes.set("90-19", "songs-on my way");
		codes.set("4-11", "songs-bratwurst");
		codes.set("9-11", "songs-no more innocence");
		codes.set("11-27", "songs-grimeware");
		codes.set("26-17", "songs-exetior");
		codes.set("39-19", "songs-batman");
		codes.set("88-19", "songs-sonichu");
		codes.set("30-19", "songs-ugly sonic");
		codes.set("13-12", "songs-lumpy sonic");
		codes.set("24-3", "songs-sonic.lmn");
		codes.set("12-8", "songs-futagami");
		codes.set("96-96", "songs-slaps");
		codes.set("3-11", "songs-oxxymajin");

		//Images
		codes.set("1-13", "images-Divide");
		codes.set("9-10", "images-Gimbo");
		codes.set("6-6", "images-Memes");
		codes.set("32-8", "images-Sulonam Message");
		codes.set("41-1", "images-Thanks For Playing");

		//Videos
		codes.set("20-20", "videos-Art Flex");
		codes.set("23-23", "videos-Be One With Restored");
		codes.set("18-86", "videos-Crack");
		codes.set("12-34", "videos-GSBL");
		codes.set("81-73", "videos-Musicians");
		codes.set("11-11", "videos-Restored Is Dead");
		codes.set("19-83", "videos-Spider Sonic");
		codes.set("1-99", "videos-The Restoration Shorts");
	}

	private static function setCodesOrder() {
		codesSTMenuOrder.push('12-25'); //songs-majin
		codesSTMenuOrder.push('7-7'); //songs-lord x
		codesSTMenuOrder.push('69-69'); //songs-sunky
		codesSTMenuOrder.push('18-21'); //songs-melthog
		codesSTMenuOrder.push('66-6'); //songs-tails doll
		codesSTMenuOrder.push('8-21'); //songs-fleetway
		codesSTMenuOrder.push('31-13'); //songs-faker
		codesSTMenuOrder.push('0-0'); //songs-sanic
		codesSTMenuOrder.push('25-12'); //songs-christmas
		codesSTMenuOrder.push('0-50'); //songs-fatal error
		codesSTMenuOrder.push('23-2'); //songs-furnace
		codesSTMenuOrder.push('16-10'); //songs-needlemouse
		codesSTMenuOrder.push('20-8'); //songs-luther
		codesSTMenuOrder.push('5-23'); //songs-coldsteel
		codesSTMenuOrder.push('2-24'); //songs-secret histories tails
		codesSTMenuOrder.push('42-75'); //songs-demogri and griatos
		codesSTMenuOrder.push('0-25'); //songs-xterion
		codesSTMenuOrder.push('5-12'); //songs-devoid
		codesSTMenuOrder.push('30-17'); //songs-shp and genesys
		codesSTMenuOrder.push('1-11'); //songs-chaotix
		codesSTMenuOrder.push('50-50'); //songs-hog
		codesSTMenuOrder.push('9-19'); //songs-curse
		codesSTMenuOrder.push('19-1'); //songs-normal cd
		codesSTMenuOrder.push('99-99'); //songs-apollyon
		codesSTMenuOrder.push('66-99'); //songs-satanos
		codesSTMenuOrder.push('19-96'); //substate-edusoft
		codesSTMenuOrder.push('18-38'); //songs-no name
		codesSTMenuOrder.push('3-0'); //songs-gameover
		codesSTMenuOrder.push('6-4'); //songs-requital
		codesSTMenuOrder.push('20-5'); //songs-sl4sh
		codesSTMenuOrder.push('80-80'); //songs-mono.bw
		codesSTMenuOrder.push('16-24'); //songs-dsk
		codesSTMenuOrder.push('90-19'); //songs-on my way
		codesSTMenuOrder.push('4-11'); //songs-bratwurst
		codesSTMenuOrder.push('9-11'); //songs-no more innocence
		codesSTMenuOrder.push('11-27'); //songs-grimeware
		codesSTMenuOrder.push('26-17'); //songs-exetior
		codesSTMenuOrder.push('39-19'); //songs-batman
		codesSTMenuOrder.push('88-19'); //songs-sonichu
		codesSTMenuOrder.push('30-19'); //songs-ugly sonic
		codesSTMenuOrder.push('13-12'); //songs-lumpy sonic
		codesSTMenuOrder.push('24-3'); //songs-sonic.lmn
		codesSTMenuOrder.push('12-8'); //songs-futagami
		if (ClientPrefs.SoundTestCodesUnlocked.contains('96-96')) codesSTMenuOrder.push('96-96'); //songs-old
		if (ClientPrefs.SoundTestCodesUnlocked.contains('3-11')) codesSTMenuOrder.push('3-11'); //songs-oxxymajin

		//Images
		codesSTMenuOrder.push('1-13'); //images-divide
		codesSTMenuOrder.push('9-10'); //images-Sunkeh
		codesSTMenuOrder.push('6-6'); //images-GamerX
		codesSTMenuOrder.push('32-8'); //images-Marstarbro
		codesSTMenuOrder.push('41-1'); //images-Razencro

		//Videos
		codesSTMenuOrder.push('20-20'); //videos-ArtFlex
		codesSTMenuOrder.push('23-23'); //videos-BeOneWithRestored
		codesSTMenuOrder.push('18-86'); //videos-Crack
		codesSTMenuOrder.push('12-34'); //videos-GSBL'
		codesSTMenuOrder.push('81-73'); //videos-Musicians
		codesSTMenuOrder.push('11-11'); //videos-RestoredIsDead
		codesSTMenuOrder.push('19-83'); //videos-SpiderSonic
		codesSTMenuOrder.push('1-99'); //videos-RestorationShorts
	}

	public static var codes:Map<String, String> = [];
	public static var codesSTMenuOrder:Array<String> = [];
	public static function init() {
		codes = [];
		codesSTMenuOrder = [];
		setCodes();
		setCodesOrder();
	}
	public static function pushCode(numOne:Int, numTwo:Int) {
		codeType = codes.get(Std.string(numOne)+'-'+Std.string(numTwo)).split('-')[0];
		codeCharacter = codes.get(Std.string(numOne)+'-'+Std.string(numTwo)).split('-')[1];
		
		switch(codeType) {
			case 'substate':
			
			case 'songs':
				codeImgOrVideo = '';
				codeImgSound = false;
			case 'images':
				codeSongs = [];
				codeWeek = false;
				codeIcon = '';
				codePushClientPrefs = false;
				codeClientPrefsPushString = '';
				codeGore = false;
				codeWeekNum = 0;
			case 'videos':
				codeSongs = [];
				codeWeek = false;
				codeIcon = '';
				codeImgSound = false;
				codeGore = false;
				codeWeekNum = 0;
		}
		
		switch(codeCharacter) {
			case 'oxxymajin':
				codeSongs = ['oxxynless'];
				codeWeek = false;
				codeIcon = 'oxxymajin';
				codePushClientPrefs = false;
				codeClientPrefsPushString = '';
				codeGore = false;
				codeWeekNum = 20;
			case 'slaps':
				codeSongs = ['old ycr slaps'];
				codeWeek = false;
				codeIcon = 'ycrold';
				codePushClientPrefs = false;
				codeClientPrefsPushString = '';
				codeGore = false;
				codeWeekNum = 43;
			case 'majin':
				codeSongs = ['endless', 'endeavors'];
				codeWeek = true;
				codeIcon = 'majin';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'majin';
				codeGore = false;
				codeWeekNum = 2;
			case 'lord x':
				codeSongs = ['cycles', 'hellbent', 'fate'];
				codeWeek = true;
				codeIcon = 'soylent';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'lord x';
				codeGore = false;
				codeWeekNum = 3;
			case 'melthog':
				codeSongs = ['melting', 'confronting'];
				codeWeek = true;
				codeIcon = 'melthog1';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'melthog';
				codeGore = true;
				codeWeekNum = 45;
			case 'tails doll':
				codeSongs = ['sunshine', 'soulless'];
				codeWeek = true;
				codeIcon = 'taildoll';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'tails doll';
				codeGore = true;
				codeWeekNum = 4;
			case 'fleetway':
				codeSongs = ['chaos'];
				codeWeek = true;
				codeIcon = 'fleetway';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'fleetway';
				codeGore = false;
				codeWeekNum = 5;
			case 'faker':
				codeSongs = ['faker', 'black sun', 'godspeed'];
				codeWeek = true;
				codeIcon = 'faker';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'faker';
				codeGore = true;
				codeWeekNum = 6;
			case 'sanic':
				codeSongs = ['too fest'];
				codeWeek = false;
				codeIcon = 'sanic';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sanic';
				codeGore = false;
				codeWeekNum = 21;
			case 'christmas':
				codeSongs = ['missiletoe', 'slaybells', 'jingle hells'];
				codeWeek = true;
				codeIcon = 'sonicexep';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'christmas';
				codeGore = false;
				codeWeekNum = 7;
			case 'fatal error':
				codeSongs = ['fatality', 'critical error'];
				codeWeek = true;
				codeIcon = 'fatal-error';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'fatal error';
				codeGore = false;
				codeWeekNum = 22;
			case 'furnace':
				codeSongs = ['prey', 'fight or flight'];
				codeWeek = true;
				codeIcon = 'furnace';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'furnace';
				codeGore = true;
				codeWeekNum = 8;
			case 'needlemouse':
				codeSongs = ['relax', 'round a bout', 'spike trap'];
				codeWeek = true;
				codeIcon = 'needlemouse';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'needlemouse';
				codeGore = false;
				codeWeekNum = 9;
			case 'luther':
				codeSongs = ['her world'];
				codeWeek = false;
				codeIcon = 'luther';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'luther';
				codeGore = false;
				codeWeekNum = 23;
			case 'coldsteel':
				codeSongs = ['personel'];
				codeWeek = false;
				codeIcon = 'coldsteel';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'coldsteel';
				codeGore = false;
				codeWeekNum = 24;
			case 'xterion':
				codeSongs = ['digitalized', 'substantial'];
				codeWeek = true;
				codeIcon = 'xterion-first';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'xterion';
				codeGore = true;
				codeWeekNum = 10;
			case 'devoid':
				codeSongs = ['hollow', 'empty'];
				codeWeek = true;
				codeIcon = 'devoid';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'devoid';
				codeGore = false;
				codeWeekNum = 25;
			case 'chaotix':
				codeSongs = ['my horizon'];
				codeWeek = false;
				codeIcon = 'chaotix';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'chaotix';
				codeGore = false;
				codeWeekNum = 26;
			case 'hog':
				codeSongs = ['hedge', 'manual blast'];
				codeWeek = true;
				codeIcon = 'hog';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'hog';
				codeGore = true;
				codeWeekNum = 11;
			case 'curse':
				codeSongs = ['malediction', "'choice-of-ending'"];
				codeWeek = true;
				codeIcon = 'curse-nervous';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'curse';
				codeGore = false;
				codeWeekNum = 12;
			case 'satanos':
				codeSongs = ['trickery', 'perdition', 'infernal-demise'];
				codeWeek = true;
				codeIcon = 'satanos';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'satanos';
				codeGore = false;
				codeWeekNum = 13;
			case 'apollyon':
				codeSongs = ['genesis', 'corinthians'];
				codeWeek = true;
				codeIcon = 'apollyon';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'apollyon';
				codeGore = false;
				codeWeekNum = 14;
			case 'shp and genesys':
				codeSongs = ['burning'];
				codeWeek = false;
				codeIcon = 'burning';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'shp and genesys';
				codeGore = false;
				codeWeekNum = 15;
			case 'requital':
				codeSongs = ['forestall desire'];
				codeWeek = false;
				codeIcon = 'requital';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'requital';
				codeGore = false;
				codeWeekNum = 18;
			case 'sl4sh':
				codeSongs = ['b4cksl4sh'];
				codeWeek = false;
				codeIcon = 'sl4sh';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sl4sh';
				codeGore = false;
				codeWeekNum = 27;
			case 'mono.bw':
				codeSongs = ['color blind'];
				codeWeek = false;
				codeIcon = 'monobw';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'mono.bw';
				codeGore = false;
				codeWeekNum = 28;
			case 'dsk':
				codeSongs = ['miasma'];
				codeWeek = false;
				codeIcon = 'dsk';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'dsk';
				codeGore = false;
				codeWeekNum = 29;
			case 'on my way':
				codeSongs = ['universal-collapse', 'planestrider'];
				codeWeek = true;
				codeIcon = 'omw';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'omw';
				codeGore = false;
				codeWeekNum = 32;
			case 'bratwurst':
				codeSongs = ['life-and-death', 'gods-will'];
				codeWeek = true;
				codeIcon = 'bratwurst-p1';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'bratwurst';
				codeGore = false;
				codeWeekNum = 33;
			case 'no more innocence':
				codeSongs = ['fake baby'];
				codeWeek = false;
				codeIcon = 'nmi';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'nmi';
				codeGore = false;
				codeWeekNum = 34;
			case 'secret histories tails':
				codeSongs = ['mania'];
				codeWeek = false;
				codeIcon = 'secret';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sh tails';
				codeGore = false;
				codeWeekNum = 35;
			case 'lumpy sonic':
				codeSongs = ['frenzy'];
				codeWeek = false;
				codeIcon = 'lumpy2';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'lumpy sonic';
				codeGore = false;
				codeWeekNum = 47;
			case 'batman':
				codeSongs = ['call-of-justice', 'gotta-go'];
				codeWeek = true;
				codeIcon = 'batman';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'batman';
				codeGore = false;
				codeWeekNum = 36;
			case 'gameover':
				codeSongs = ['too-far', 'last-hope'];
				codeWeek = true;
				codeIcon = 'deadS';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'gameover';
				codeGore = true;
				codeWeekNum = 37;
			case 'sonichu':
				codeSongs = ['shocker', 'extreme zap'];
				codeWeek = true;
				codeIcon = 'sonichu';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sonichu';
				codeGore = false;
				codeWeekNum = 16;
			case 'sonic.lmn':
				codeSongs = ['soured'];
				codeWeek = false;
				codeIcon = 'SSonic';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sonic.lmn';
				codeGore = false;
				codeWeekNum = 38;
			case 'sunky':
				codeSongs = ['milk'];
				codeWeek = false;
				codeIcon = 'sunky';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sunky';
				codeGore = false;
				codeWeekNum = 39;
			case 'demogri and griatos':
				codeSongs = ['uh-oh', 'marauder', 'haze'];
				codeWeek = true;
				codeIcon = 'griatos-d';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'demogri';
				codeGore = false;
				codeWeekNum = 17;
			case 'grimeware':
				codeSongs = ['envy'];
				codeWeek = false;
				codeIcon = 'grimeware';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'grimeware';
				codeGore = true;
				codeWeekNum = 40;
			case 'ugly sonic':
				codeSongs = ['ugly'];
				codeWeek = false;
				codeIcon = 'ugly';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'ugly sonic';
				codeGore = false;
				codeWeekNum = 41;
			case 'futagami':
				codeSongs = ['animosity', 'reunion'];
				codeWeek = true;
				codeIcon = 'futagami';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'futagami';
				codeGore = false;
				codeWeekNum = 42;
			case 'exetior':
				codeSongs = ['bloodstorm', 'sharpy-showdown'];
				codeWeek = true;
				codeIcon = 'exetior';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'exetior';
				codeGore = false;
				codeWeekNum = 44;
			case 'no name':
				codeSongs = ['forever-unnamed'];
				codeWeek = false;
				codeIcon = 'noname';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'no name';
				codeGore = false;
				codeWeekNum = 19;
			case 'normal cd':
				codeSongs = ['found-you'];
				codeWeek = false;
				codeIcon = 'normal';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'normal cd';
				codeGore = false;
				codeWeekNum = 46;
				
			case 'Thanks For Playing': 
				codeImgOrVideo = 'Razencro';
				codeImgSound = true;
			case 'Divide': 
				codeImgOrVideo = 'divide';
				codeImgSound = false;
			case 'Gimbo': 
				codeImgOrVideo = 'Sunkeh';
				codeImgSound = false;
			case 'Memes': 
				codeImgOrVideo = 'GamerX';
				codeImgSound = false;
			case 'Sulonam Message': 
				codeImgOrVideo = 'Marstarbro';
				codeImgSound = true;
				
			case 'Be One With Restored': 
				codeImgOrVideo = 'BeOneWithRestored';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-3';
			case 'Restored Is Dead': 
				codeImgOrVideo = 'RestoredIsDead';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-6';
			case 'Art Flex': 
				codeImgOrVideo = 'ArtFlex';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-2';
			case 'Musicians': 
				codeImgOrVideo = 'Musicians';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-1';
			case 'Spider Sonic': 
				codeImgOrVideo = 'SpiderSonic';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-5';
			case 'GSBL': 
				codeImgOrVideo = 'GSBL';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-4';
			case 'Crack': 
				codeImgOrVideo = 'Crack';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-7';
			case 'The Restoration Shorts': 
				codeImgOrVideo = 'RestorationShorts';
				codePushClientPrefs = true;
				codeClientPrefsPushString = 'sound-test-8';
		}
	}
}