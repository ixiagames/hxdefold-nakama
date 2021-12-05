package nakama;

import lua.Table;
import nakama.Socket;

@:native("_G.__nakama")
extern class Nakama {

    static inline function init(log:Bool = false, json:Bool = true):Void {
        untyped __lua__('_G.__nakama = require "nakama.nakama"');
        untyped __lua__('_G.__nakama_defold = require "nakama.engine.defold"');
        if (log)
            untyped __lua__('_G.__nakama_log = require "nakama.util.log"');
        if (json)
            untyped __lua__('_G.__nakama_json = require "nakama.util.json"');
    }
    
    @:luaDotMethod static function sync(func:Void->Void):Void;

    @:luaDotMethod static function create_client(config:ClientConfig):Client;
    @:luaDotMethod static function get_account(client:Client, ?callback:Account->Void):Dynamic;
    @:luaDotMethod static function authenticate_device(client:Client, body_api_account_device:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):AuthDeviceResult;
    @:luaDotMethod static function authenticate_email(client:Client, body_api_account_email:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function set_bearer_token(client:Client, bearer_token:Dynamic):Void;

    @:luaDotMethod static function create_api_account_device(uuid:String):Dynamic;
    @:luaDotMethod static function create_api_account_email(email:String, password:String, ?vars:Dynamic):Dynamic;

    @:luaDotMethod static function create_socket(client:Client):Socket;
    @:luaDotMethod static function socket_connect(socket:Socket):SocketConnectResult;
    @:luaDotMethod static function socket_send(socket:Socket, message:Dynamic):Dynamic;

    @:luaDotMethod static function on_matchmakermatched(socket:Dynamic, callback:MatchMakerMatchedMessage->Void):Void;
    @:luaDotMethod static function on_matchpresence(socket:Dynamic, callback:MatchPresenceMessage->Void):Void;
    @:luaDotMethod static function on_matchdata(socket:Dynamic, callback:MatchMessage->Void):Void;

    @:luaDotMethod static function create_matchmaker_add_message(query:String, min_count:Int, max_count:Int, ?string_properties:Int, ?numeric_properties:Int):Dynamic;
    @:luaDotMethod static function create_matchmaker_remove_message(ticket:{ ticket:String }):Dynamic;
    @:luaDotMethod static function create_match_join_message(?match_id:String, ?token:Dynamic):Dynamic;
    @:luaDotMethod static function create_match_data_message(match_id:String, op_code:Int, data:String):Dynamic;

    @:luaDotMethod static function update_account(client:Client, body_api_update_account_request:Table<String, Dynamic>, ?callback:Dynamic->Void):Dynamic;

    @:luaDotMethod static function rpc_func(client:Client, func_id:String, ?body:Dynamic, ?http_key:String, ?callback:Dynamic->Void):{ payload:String };
    @:luaDotMethod static function rpc_func2(client:Client, func_id:String, ?payload:String, ?http_key:String, ?callback:Dynamic->Void):{ payload:String };

}

extern class AuthDeviceResult {
    
    var token(default, never):Dynamic;
    var error(default, never):Bool;
    var code(default, never):Int;
    var message(default, never):String;

}

extern class MatchMakerMatched {
    
    var match_id(default, never):String;
    var ticket(default, never):String;
    var token(default, never):Dynamic;
    var self(default, never):MatchPresence;
    var users(default, never):Array<MatchPresence>;

}

extern class MatchMakerMatchedMessage {
    
    var matchmaker_matched(default, never):MatchMakerMatched;

}

extern class MatchPresenceMessage {
    
   var match_presence_event(default, never):MatchPresenceEvent;

}
extern class MatchPresenceEvent {
    
    var match_id(default, never):String;
    var joins(default, never):Table<Int, MatchPresence>;
    var leaves(default, never):Table<Int, MatchPresence>;

}

extern class MatchMessage {

    var match_data(default, never):MatchData;

}
extern class MatchData {

    public var reliable(default, never):Bool;
    public var op_code(default, never):String;
    public var match_id(default, never):String;
    public var data(default, never):String;
    
}