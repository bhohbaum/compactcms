<?php 
@include_once('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

class Validator {
	
	private function __construct() {
		;
	}
	
	public static function email($string) {
		return filter_var($string, FILTER_VALIDATE_EMAIL) ? true : false;
	}
	
	public static function boolean($string) {
		return filter_var($string, FILTER_VALIDATE_BOOLEAN) ? true : false;
	}
	
	public static function float($string) {
		return filter_var($string, FILTER_VALIDATE_FLOAT) ? true : false;
	}
	
	public static function int($string) {
		return filter_var($string, FILTER_VALIDATE_INT) ? true : false;
	}
	
	public static function ipaddr($string) {
		return filter_var($string, FILTER_VALIDATE_IP) ? true : false;
	}
	
	public static function url($string) {
		return filter_var($string, FILTER_VALIDATE_URL) ? true : false;
	}
	
	
}



?>