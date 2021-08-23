package nakama;

typedef ClientConfig = {

    host:String,
    port:Int,
    use_ssl:Bool,
    username:String,
    password:String,
    ?engine:Dynamic

}