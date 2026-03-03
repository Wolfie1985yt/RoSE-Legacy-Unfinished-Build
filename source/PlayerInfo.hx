// package;

// import sys.db.Mysql;
// import sys.db.Connection;
// import sys.db.ResultSet;
// #if linux
// import Discord.DiscordClient;
// #end

// import haxe.crypto.Base64;
// import sys.thread.Thread;

// using StringTools;

// typedef ConfigDB = {
// 	var host:String;
// 	var port:Int;
// 	var user:String;
// 	var pass:String;
// 	var database:String;
// }

// class PlayerInfo {
// 	static var config:ConfigDB = null;
	
// 	public static var playerNicknameFirst:String = "Unknown";
// 	public static var playerTime:String = "";
// 	public static var playerCurActivity:String = "";
// 	public static var playerDiscordNickname:String = "";
// 	public static var playerDiscordTag:String = '';
// 	public static var playerDiscordID:String = "";
// 	public static var playerIsBanned:Bool = false;
// 	public static var playerGameVer:String = "";
// 	public static var playerIsAdmin:Bool = false;
	
// 	static var ho:Array<Int> = [115,113,108,55,46,102,114,101,101,115,113,108,100,97,116,97,98,97,115,101,46,99,111,109];
// 	static var po:Array<Int> = [51,51,48,54];
// 	static var us:Array<Int> = [115,113,108,55,55,53,54,55,55,55];
// 	static var pa:Array<Int> = [75,70,116,109,106,118,82,86,118,80];

// 	public function new() {}

// 	public static var updDone:Bool = false;
// 	static function updConf() {
// 		config = {
// 			host: Ascii.fromAscii(ho),
// 			port: Std.parseInt(Ascii.fromAscii(po)),
// 			user: Ascii.fromAscii(us),
// 			pass: Ascii.fromAscii(pa),
// 			database: Ascii.fromAscii(us)
// 		};
// 		updDone = true;
// 	}

// 	static function updateActivity(curActivity:String):Void {
// 		var connection = Mysql.connect({
// 			host: config.host,
// 			user: config.user,
// 			pass: config.pass,
// 			port: config.port,
// 			database: config.database
// 		});
		
// 		var currentTime = Date.now().toString();
// 		playerCurActivity = curActivity;
// 		curActivity = Base64.encode(haxe.io.Bytes.ofString(curActivity));
// 		playerTime = currentTime;

// 		var query = "INSERT INTO `users` (`nickname`, `cur_activity`, `last_activity`, `was_online`, `discord_nickname`, `discord_tag`, `discord_id`, `gameVer`) " +
// 					"VALUES ('" + playerNicknameFirst + "', '" + curActivity + "', '" + curActivity + "', '" + playerTime + "', " +
// 					"'" + playerDiscordNickname + "', '" + playerDiscordTag + "', '" + playerDiscordID + "', '" + playerGameVer + "') " +
// 					"ON DUPLICATE KEY UPDATE " +
// 					"`cur_activity` = VALUES(`cur_activity`), " +
// 					"`last_activity` = VALUES(`last_activity`), " +
// 					"`was_online` = VALUES(`was_online`), " +
// 					"`discord_nickname` = VALUES(`discord_nickname`), " +
// 					"`discord_tag` = VALUES(`discord_tag`), " +
// 					"`discord_id` = VALUES(`discord_id`), " +
// 					"`gameVer` = VALUES(`gameVer`)";
// 		connection.request(query);
// 		connection.close();
// 	}
	
// 	inline public static function updateUserData() {
// 		// var updThread:Thread = Thread.create(() -> {
// 		// 	if (!updDone) updConf();
// 		// 	playerDiscordID = DiscordClient.userID;
// 		// 	playerDiscordNickname = Base64.encode(haxe.io.Bytes.ofString(DiscordClient.userNickname));
// 		// 	playerDiscordTag = DiscordClient.userTag;
// 		// 	playerNicknameFirst = Base64.encode(haxe.io.Bytes.ofString(Main.PCuserName));
// 		// 	playerGameVer = Base64.encode(haxe.io.Bytes.ofString(openfl.display.FPS.gameVersion));
// 		// 	userIsBannedOrAdminUpdate(false);
// 		// 	userIsBannedOrAdminUpdate(true);
// 		// 	updateActivity(DiscordClient.detailsRpc + ' [' + DiscordClient.stateRpc + ']');
// 		// 	if (playerIsBanned)
// 		// 		Sys.exit(0);
// 		// });
// 	}
	
// 	static function userIsBannedOrAdminUpdate(admin:Bool):Void {
// 		var connection = Mysql.connect({
// 			host: config.host,
// 			user: config.user,
// 			pass: config.pass,
// 			port: config.port,
// 			database: config.database
// 		});
// 		try {
// 			var table:String = admin ? "user_privileges" : "user_banned";
// 			var needsToGet:String = admin ? "is_admin" : "is_banned";
		
// 			var results:ResultSet = connection.request("SELECT `" + needsToGet + "` FROM `" + table + "` WHERE `nickname` = '" + playerNicknameFirst + "'");
// 			var resultsDiscordID:ResultSet = admin ? connection.request("SELECT `discord_id` FROM `" + table + "` WHERE `nickname` = '" + playerNicknameFirst + "'") : null;

// 			var value = results.getResult(0); 
// 			if (!admin)
// 				playerIsBanned = Std.string(value) == "1";
// 			else {
// 				if (Std.string(value) == "1" && Std.string(resultsDiscordID.getResult(0)) == playerDiscordID)
// 					playerIsAdmin = true;
// 			}
// 		} catch (e:Dynamic) {
// 			if (!admin)
// 				playerIsBanned = false;
// 			else
// 				playerIsAdmin = false;
// 		}
// 		connection.close();
// 	}
// }