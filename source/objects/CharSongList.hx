package objects; 

class CharSongList 
{ 
	private static function setSongsAndCharacters() {
		data.set("majin", ["endless", "endeavors"]);
		data.set("lord x", ["execution", "cycles", "hellbent", "fate", "judgement", "gatekeepers"]);
		data.set("sunky", ["milk"]);
		data.set("melthog", ["melting", "confronting"]);
		data.set("tails doll", ["sunshine", "soulless"]);
		data.set("fleetway", ["chaos"]);
		data.set("faker", ["faker", "black-sun", "godspeed"]);
		data.set("sanic", ["too-fest"]);
		data.set("christmas", ["missiletoe", "slaybells", "jingle-hells"]);
		data.set("fatal error", ["fatality", "critical-error"]);
		data.set("furnace", ["stardust-speedway", "prey", "fight-or-flight"]);
		data.set("needlemouse", ["relax", "round-a-bout", "spike-trap"]);
		data.set("luther", ["her-world"]);
		data.set("coldsteel", ["personel", "personel-serious"]);
		data.set("sh tails", ["mania"]);
		data.set("demogri", ["uh-oh", "marauder", "haze"]);
		data.set("xterion", ["digitalized", "substantial"]);
		data.set("devoid", ["hollow", "empty"]);
		data.set("shp and genesys", ["burning"]);
		data.set("chaotix", ["my-horizon", "our-horizon"]);
		if (ClientPrefs.SongsCompleted.contains('long-sky') && ClientPrefs.charactersUnlocked.contains('chotix')) data.set("chotix", ["long-sky"]);
		data.set("hog", ["hedge", "manual-blast"]);
		data.set("curse", ["malediction", "'choice-of-ending'"]);
		data.set("normal cd", ["found-you"]);
		data.set("apollyon", ["genesis", "corinthians"]);
		data.set("satanos", ["trickery", "perdition", "infernal-demise"]);
		data.set("educator", ["expulsion"]);
		data.set("no name", ["forever-unnamed"]);
		data.set("gameover", ["too-far", "last-hope"]);
		data.set("requital", ["forestall-desire"]);
		data.set("sl4sh", ["b4cksl4sh"]);
		data.set("mono.bw", ["color-blind"]);
		data.set("dsk", ["miasma"]);
		data.set("omw", ["universal-collapse", "planestrider"]);
		data.set("bratwurst", ["life-and-death", "gods-will"]);
		data.set("nmi", ["fake-baby"]);
		data.set("grimeware", ["envy"]);
		data.set("exetior", ["bloodstorm", "sharpy-showdown"]);
		data.set("batman", ["call-of-justice", "gotta-go"]);
		data.set("sonichu", ["shocker", "extreme-zap"]);
		data.set("ugly sonic", ["ugly"]);
		data.set("lumpy sonic", ["frenzy"]);
		data.set("sonic.lmn", ["soured"]);
		if (ClientPrefs.SongsCompleted.contains('flashcard') && ClientPrefs.charactersUnlocked.contains('soink.fla')) data.set("soink.fla", ["flashcard"]);
		data.set("futagami", ["animosity", "reunion"]);
	}
	private static function setCharacters() {
		characters.push('majin');
		characters.push('lord x');
		characters.push('sunky');
		characters.push('melthog');
		characters.push('tails doll');
		characters.push('fleetway');
		characters.push('faker');
		characters.push('sanic');
		characters.push('christmas');
		characters.push('fatal error');
		characters.push('furnace');
		characters.push('needlemouse');
		characters.push('luther');
		characters.push('coldsteel');
		characters.push('sh tails');
		characters.push('demogri');
		characters.push('xterion');
		characters.push('devoid');
		characters.push('shp and genesys');
		characters.push('chaotix');
		if (ClientPrefs.SongsCompleted.contains('long-sky') && ClientPrefs.charactersUnlocked.contains('chotix')) characters.push('chotix');
		characters.push('hog');
		characters.push('curse');
		characters.push('normal cd');
		characters.push('apollyon');
		characters.push('satanos');
		characters.push('educator');
		characters.push('no name');
		characters.push('gameover');
		characters.push('requital');
		characters.push('sl4sh');
		characters.push('mono.bw');
		characters.push('dsk');
		characters.push('omw');
		characters.push('bratwurst');
		characters.push('nmi');
		characters.push('grimeware');
		characters.push('exetior');
		characters.push('batman');
		characters.push('sonichu');
		characters.push('ugly sonic');
		characters.push('lumpy sonic');
		characters.push('sonic.lmn');
		if (ClientPrefs.SongsCompleted.contains('flashcard') && ClientPrefs.charactersUnlocked.contains('soink.fla')) characters.push('soink.fla');
		characters.push('futagami');
	}
	
	public static var data:Map<String,Array<String>> = []; 
	public static var characters:Array<String> = []; 
	public static var songToChar:Map<String,String>=[]; 
	public static function init() {
		data.clear(); 
		characters = []; 
		setSongsAndCharacters();
		setCharacters();
		songToChar.clear(); 
		for(character in data.keys()) { 
			var songs = data.get(character); 
			for(song in songs)songToChar.set(song,character); 
		}
	} 
	
     public static function getSongsByChar(char:String) { 
		if(data.exists(char))return data.get(char);
		return []; 
	} 
}