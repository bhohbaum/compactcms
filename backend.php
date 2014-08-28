<?php
@include('./include/libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

session_start();

/**
 * Index file
 *
 * @author      Botho Hohbaum <bhohbaum@googlemail.com>
 * @package     LibCompactMVC
 * @copyright   Copyright (c) Botho Hohbaum 11.02.2014
 * @link		http://www.adrodev.de
 */
class Main {
	
	private $ad;
	
	public function __construct() {
		;
	}
	
	public function dispatch() {
		$this->ad = new ActionDispatcher("action");
		$this->ad->set_handler("",				"Login");
		$this->ad->set_handler("login", 		"Login");
		$this->ad->set_handler("logout", 		"Logout");
		$this->ad->set_handler("control",	 	"Control");
		$this->ad->set_handler("elementstree", 	"ElementsTree");
		$this->ad->set_default("login");
//		$this->ad->set_control("control");
		$this->ad->run();
		echo($this->ad->get_ob());
	}
	
	
}

// entry point (MAIN)
$run = new Main();
$run->dispatch();

?>
