package nakama;

@:native("_G.__nakama")
extern class Nakama {

    static inline function require():Void {
        untyped __lua__('_G.__nakama = require "nakama.nakama"');
    }

    @:luaDotMethod static function sync(func:Void->Void):Void;

    @:luaDotMethod static function create_client(config:ClientConfig):Client;
    @:luaDotMethod static function get_account(client:Client, ?callback:Account->Void):Dynamic;
    @:luaDotMethod static function authenticate_device(client:Client, body_api_account_device:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function authenticate_email(client:Client, body_api_account_email:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function set_bearer_token(client:Client, bearer_token:Dynamic):Void;

    @:luaDotMethod static function create_api_account_device(uuid:String):Dynamic;
    @:luaDotMethod static function create_api_account_email(email:String, password:String, ?vars:Dynamic):Dynamic;

    @:luaDotMethod static function create_socket(client:Client):Socket;
    @:luaDotMethod static function socket_connect(socket:Socket):SocketConnectResult;
    @:luaDotMethod static function socket_send(socket:Socket, message:Dynamic):SocketSendResult;

    @:luaDotMethod static function on_matchmakermatched(socket:Dynamic, callback:MatchMakerMatchedMessage->Void):Void;
    @:luaDotMethod static function on_matchpresence(socket:Dynamic, callback:MatchPresenceMessage->Void):Void;
    @:luaDotMethod static function on_matchdata(socket:Dynamic, callback:MatchMessage->Void):Void;

    @:luaDotMethod static function create_matchmaker_add_message(query:String, min_count:Int, max_count:Int, ?string_properties:Int, ?numeric_properties:Int):Dynamic;
    @:luaDotMethod static function create_matchmaker_remove_message(ticket:MatchMakerTicket):Dynamic;
    @:luaDotMethod static function create_match_data_message(match_id:String, op_code:Int, data:String):Dynamic;

}

typedef ClientConfig = {

    host:String,
    port:Int,
    use_ssl:Bool,
    username:String,
    password:String,
    ?engine:Dynamic

}

extern class Client { }
extern class Socket { }

extern class Account {

    var user_id(default, never):String;

}

@:multiReturn extern class SocketConnectResult {

    var success(default, never):Bool;
    var error(default, never):String;

}

extern class SocketSendResult {

    var success(default, never):{ cid:Int, matchmaker_ticket:MatchMakerTicket }
    var error(default, never):String;

}

extern class MatchMakerTicket {

    var ticket(default, null):String;

}

extern class MatchMakerMatchedMessage {
    
    var matchmaker_matched(default, null):{ match_id:String, token:Dynamic };

}

extern class MatchPresenceMessage {
    
}

extern class MatchMessage {

    var op_code(default, never):Int;
    var match_data(default, never):Dynamic;

}