package nakama;

@:luaRequire("nakama.nakama")
@:native("nakama.nakama")
extern class Nakama {

    @:pure static function create_client(config:ClientConfig):Client;
    @:pure static function get_account(client:Client, ?callback:Account->Void):Dynamic;
    @:pure static function create_api_account_email(email:String, password:String, ?vars:Dynamic):Dynamic;
    @:pure static function authenticate_email(client:Client, body_api_account_email:Dynamic, ?create:Bool, ?username:String, ?callback:Dynamic->Void):Dynamic;
    @:pure static function set_bearer_token(client:Client, bearer_token:Dynamic):Void;
    @:pure static function sync(func:Void->Void):Void;

}