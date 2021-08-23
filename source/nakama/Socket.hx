package nakama;

extern class Socket { }

@:multiReturn extern class SocketConnectResult {

    var success(default, never):Bool;
    var error(default, never):String;

}