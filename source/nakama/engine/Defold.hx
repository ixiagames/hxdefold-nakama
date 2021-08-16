package nakama.engine;

@:native("_G.__nakama_defold")
extern class Defold {

    public static inline function require():Void {
        untyped __lua__('_G.__nakama_defold = require "nakama.engine.defold"');
    }

    @:luaDotMethod static function uuid():String;

}