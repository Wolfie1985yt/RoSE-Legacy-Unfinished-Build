#if (!mobile && !hl)

package;

import Sys.sleep;
import hxdiscord_rpc.Discord;
import hxdiscord_rpc.Types;
import lime.app.Application;

#if LUA_ALLOWED
import llua.Lua;
import llua.State;
#end

using StringTools;

class DiscordClient
{
    public static var isInitialized:Bool = false;
    public static var imageRpc:String = 'icon';
    public static var smallImageRpc:String = '';
    public static var detailsRpc:String = '';
    public static var stateRpc:String = '';

    public static var userNickname:String = '';
	public static var userTag:String = '';
    public static var userID:String = '';

    private var eventHandlers:DiscordEventHandlers;

    public function new()
    {
        trace("Discord Client starting...");

        eventHandlers = new DiscordEventHandlers();
        eventHandlers.ready = cpp.Function.fromStaticFunction(onReady);
        eventHandlers.errored = cpp.Function.fromStaticFunction(onError);
        eventHandlers.disconnected = cpp.Function.fromStaticFunction(onDisconnected);

        Discord.Initialize("1008647422576177212", cpp.RawPointer.addressOf(eventHandlers), true, null);
        trace("Discord Client started.");

        while (true) {
            Discord.RunCallbacks();
            sleep(2);
        }

        Discord.Shutdown();
    }

    public static function shutdown()
        Discord.Shutdown();

    static function onReady(request:cpp.RawConstPointer<DiscordUser>):Void
    {
		userNickname = request[0].globalName;
		userTag = request[0].username;
		userID = request[0].userId;
        var rpcF:String = 'I AM GOD';
        var rpcS:String = 'JUST DIE';
        if (TranslationLanguages.Text.exists(rpcF) && ClientPrefs.Language != 'English')
            rpcF = TranslationLanguages.Text[rpcF];
        if (TranslationLanguages.Text.exists(rpcS) && ClientPrefs.Language != 'English')
            rpcS = TranslationLanguages.Text[rpcS];

        var presence = new DiscordRichPresence();
        presence.details = rpcF;
        presence.largeImageKey = 'scary';
        presence.largeImageText = rpcS;
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    static function onError(errorCode:Int, message:cpp.ConstCharStar)
    {
        trace('Error! $errorCode : ${message.toString()}');
    }

    static function onDisconnected(errorCode:Int, message:cpp.ConstCharStar)
    {
        trace('Disconnected! $errorCode : ${message.toString()}');
    }

    public static function initialize()
    {
        var DiscordDaemon = sys.thread.Thread.create(() -> {
            new DiscordClient();
        });
        trace("Discord Client initialized");
        isInitialized = true;
    }

    public static function changePresence(?details:String = null, ?state:Null<String>, ?smallImageKey:String = null, ?hasStartTimestamp:Bool, ?endTimestamp:Float)
    {
		stateRpc = state;

        var rpcBy:String = 'By: Restoration Team';
        if (TranslationLanguages.Text.exists(rpcBy) && ClientPrefs.Language != 'English')
            rpcBy = TranslationLanguages.Text[rpcBy];

        if (details == null) details = detailsRpc;
        else detailsRpc = details;

        if (smallImageKey == null) smallImageKey = smallImageRpc;
        else smallImageRpc = smallImageKey;

        var startTimestamp:Float = if (hasStartTimestamp) Date.now().getTime() else 0;
        if (endTimestamp > 0) endTimestamp = startTimestamp + endTimestamp;

        var presence = new DiscordRichPresence();
        presence.details = detailsRpc;
        presence.state = state;
        presence.largeImageKey = imageRpc;
        presence.largeImageText = rpcBy + "(" + Application.current.meta.get('version') + ")";
        presence.smallImageKey = smallImageRpc;
        presence.startTimestamp = Std.int(startTimestamp / 1000);
        presence.endTimestamp = Std.int(endTimestamp / 1000);
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    public static function Cheater()
    {
        var rpcF:String = 'NO CHEATING';
        if (TranslationLanguages.Text.exists(rpcF) && ClientPrefs.Language != 'English')
            rpcF = TranslationLanguages.Text[rpcF];

        var presence = new DiscordRichPresence();
        presence.details = ">:(";
        presence.largeImageKey = 'cheat';
        presence.largeImageText = rpcF;
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    public static function SonicIntro()
    {
        var presence = new DiscordRichPresence();
        presence.details = "...";
        presence.largeImageKey = 'intro';
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    public static function FinalCrash()
    {
        var presence = new DiscordRichPresence();
        presence.largeImageKey = 'final';
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    public static function STCutscene()
    {
        var presence = new DiscordRichPresence();
        presence.largeImageKey = 'st';
        Discord.UpdatePresence(cpp.RawConstPointer.addressOf(presence));
    }

    #if LUA_ALLOWED
    public static function addLuaCallbacks(lua:State)
    {
        Lua_helper.add_callback(lua, "changePresence", function(details:String, state:Null<String>, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float) {
            changePresence(details, state, smallImageKey, hasStartTimestamp, endTimestamp);
        });
    }
    #end
}
#end