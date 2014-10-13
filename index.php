<?php
include('./include/libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

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
	
	public function app() {
		$this->ad = new ActionDispatcher("action");
		$this->ad->set_handler("", 					"Login");
		$this->ad->set_handler("control",			"Control");
		$this->ad->set_handler("login",				"Login");
		$this->ad->set_handler("logout", 			"Logout");
		$this->ad->set_handler("rendercontroller", 	"RenderController");
		$this->ad->set_default("rendercontroller");
		$this->ad->set_control("control");
		$this->ad->run();
		echo($this->ad->get_ob());
	}
	
	
}

// redirect
if (substr($_SERVER["REQUEST_URI"], 0, 4) != "/app") {
	if (!(substr($_SERVER["REQUEST_URI"], 0, 4) != "/seolinks")) {
		header("Location: /app/");
	}
}

// entry point (MAIN)
try {
	$run = new Main();
	$run->app();
} catch (Exception $e) {
	echo("<pre>");
	echo("Uncaught exception in web application:"."\n"."\n");
	echo($e->getMessage()."\n"."\n");
	echo($e->getTraceAsString()."\n");
	echo("</pre>");
}

