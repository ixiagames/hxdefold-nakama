package nakama;

@:native("nakama.nakama")
extern class Nakama {

    @:pure public static function create_client(config:ClientConfig):Client;
    @:pure public static function get_account(client:Client, ?callback:Account->Void):Account;
    @:pure public static function sync(func:Void->Void):Void;

}