package nakama;

extern class Socket { }

@:multiReturn extern class SocketConnectResult {

    var success(default, never):Bool;
    var error(default, never):String;

}

extern class SocketMatchMakerAddResult {
    
    var match(default, null):Match;
    var cid(default, null):String;

}