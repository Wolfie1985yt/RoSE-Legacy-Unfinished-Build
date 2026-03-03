package;

using StringTools;

class Ascii {
	public function new() {}

	public static function toAscii(input:String):Array<Int>
		return input.split("").map(function(c) return c.charCodeAt(0));
	
	public static function fromAscii(codes:Array<Int>):String
		return codes.map(function(c) return String.fromCharCode(c)).join("");
}