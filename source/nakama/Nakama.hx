package nakama;

@:native("_G.__nakama")
extern class Nakama {

    public static inline function require():Void {
        untyped __lua__('_G.__nakama = require "nakama.nakama"');
    }

    @:luaDotMethod static function sync(func:Void->Void):Void;
    @:luaDotMethod static function create_client(config:ClientConfig):Client;
    @:luaDotMethod static function create_api_account_device(uuid:String):Dynamic;
    @:luaDotMethod static function create_api_account_email(email:String, password:String, ?vars:Dynamic):Dynamic;
    @:luaDotMethod static function get_account(client:Client, ?callback:Account->Void):Dynamic;
    @:luaDotMethod static function authenticate_device(client:Client, body_api_account_device:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function authenticate_email(client:Client, body_api_account_email:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function set_bearer_token(client:Client, bearer_token:Dynamic):Void;
    @:luaDotMethod static function create_socket(client:Client):Dynamic;
    @:luaDotMethod static function socket_connect(socket:Dynamic):SocketConnectResult;
    @:luaDotMethod static function socket_send(socket:Dynamic, message:Dynamic):Dynamic;
    @:luaDotMethod static function on_matchpresence(socket:Dynamic, callback:MatchPresenceMessage->Void):Void;
    @:luaDotMethod static function on_matchdata(socket:Dynamic, callback:MatchMessage->Void):Void;
    @:luaDotMethod static function create_matchmaker_add_message(query:String, min_count:Int, max_count:Int, ?string_properties:Int, ?numeric_properties:Int):Dynamic;

}

typedef ClientConfig = {

    host:String,
    port:Int,
    use_ssl:Bool,
    username:String,
    password:String,
    ?engine:Dynamic

}

extern class Client {
    
}

typedef Account = {

    user_id:String,
    
}

@:multiReturn extern class SocketConnectResult {

    var success:Bool;
    var error:String;

}

extern class MatchPresenceMessage {
    
}

extern class MatchMessage {

    public var op_code(default, never):Int;
    public var match_data(default, never):Dynamic;

}