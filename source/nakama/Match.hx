package nakama;

extern class Match {

    var authoritative(default, null):Bool;
    var match_id(default, null):String;
    var label(default, null):String;
    var self(default, null):MatchPresence;
    var size(default, null):Int;
    var presences(default, null):Array<MatchPresence>;

}