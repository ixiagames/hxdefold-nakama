package nakama.util;

import haxe.extern.Rest;

@:native("_G.__nakama_log")
extern class Log {

    public static inline function require():Void {
        untyped __lua__('_G.__nakama_log = require "nakama.util.log"');
    }

    @:luaDotMethod @:selfCall static function log(v:String, infos:Rest<String>):Void;
    @:luaDotMethod static function silent():Void;
    @:luaDotMethod static function print():Void;
    @:luaDotMethod static function format():Void;
    @:luaDotMethod static function custom(func:(String, Rest<String>)->Void):Void;

}