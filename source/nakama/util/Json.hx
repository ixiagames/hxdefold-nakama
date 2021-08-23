package nakama.util;

@:native("_G.__nakama_json")
extern class Json {
    
    @:luaDotMethod static function encode(data:Dynamic):String;
    @:luaDotMethod static function decode(string:String):Dynamic;

}