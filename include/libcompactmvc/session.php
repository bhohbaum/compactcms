<?php
@include_once('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

class Session
{
	// REMEMBER!!!
	// NEVER use the $_SESSION directly when using this class!
	// your data will get lost!
	
	// keeps instance of the classs
	private static $instance;
	
	// contains all session data
	private static $parray;
	
	// private constructor prevents direct instantiation
	private function __construct() 
	{
		self::$parray = $_SESSION;
		
	//	The following lines change the session id with every click. 
	//	This makes it harder for attackers to "steal" our session.
		if (ini_get("session.use_cookies")) {
			$sname = session_name();
			setcookie($sname, '', time() - 42000);
			unset($_COOKIE[$sname]);
		}
		session_destroy();
		session_start();
	}

	// prevent cloning
	private function __clone()
	{
		;
	}

	// store our data into the $_SESSION variable
	public function __destruct() {
		$_SESSION = self::$parray;
	}
	
	/**
	 * @return returns the instance of this class. this is a singleton. there can only be one instance.
	 */
	public static function get_instance() 
	{
		if (!isset(self::$instance)) {
			$c = __CLASS__;
			self::$instance = new $c;
		}

		return self::$instance;
	}
	
	/**
	 * @param String $pname property name
	 * @param Any $value property value. can be a scalar, array or object.
	 */
	public function set_property($pname, $value)
	{
		self::$parray[$pname] = $value;
	}

	/**
	 * @param String $pname property name
	 * @return returns the property
	 */
	public function get_property($pname) {
		return (isset(self::$parray[$pname])) ? self::$parray[$pname] : null;
	}

	/**
	 * clears all data from the session
	 */
	public function clear() {
		self::$parray = array();
	}
}



?>