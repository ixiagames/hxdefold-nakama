package nakama;

@:native("_G.__nakama")
extern class Nakama {

    public static inline function require():Void {
        untyped __lua__('_G.__nakama = require "nakama.nakama"');
    }

    @:luaDotMethod static function create_client(config:ClientConfig):Client;
    @:luaDotMethod static function create_api_account_device(uuid:String):Dynamic;
    @:luaDotMethod static function create_api_account_email(email:String, password:String, ?vars:Dynamic):Dynamic;
    @:luaDotMethod static function get_account(client:Client, ?callback:Account->Void):Dynamic;
    @:luaDotMethod static function authenticate_device(client:Client, body_api_account_device:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function authenticate_email(client:Client, body_api_account_email:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:luaDotMethod static function set_bearer_token(client:Client, bearer_token:Dynamic):Void;
    @:luaDotMethod static function sync(func:Void->Void):Void;

}