<?php
defined('LIBCOMPACTMVC_ENTRY') || define('LIBCOMPACTMVC_ENTRY', (($_SERVER['DOCUMENT_ROOT'] == "") || ($_SERVER['DOCUMENT_ROOT'] == getcwd())) || die('Invalid entry point'));

/**
 * LibCompactMVC application loader
 *
 * @author      Botho Hohbaum <bhohbaum@googlemail.com>
 * @package     LibCompactMVC
 * @copyright   Copyright (c) Botho Hohbaum 11.02.2014
 * @link		http://www.adrodev.de
 */

function cmvc_include($fname) {
	$basepath = dirname(dirname(__FILE__)."../");
	
	$dirs_up = array(
					"./",
					"../",
					"../../",
					"../../../",
					"../../../../",
					"../../../../../"
				);
	
	// Put all directories into this array, where source files shall be included.
	// This function is intended to work from everywhere.
	$dirs_down = array(
					"application/",
					"application/dba/",
					"application/controller/",
					"application/view/",
					"include/",
					"include/libcompactmvc/"
				);
	
	foreach ($dirs_up as $u) {
		foreach ($dirs_down as $d) {
			// if directory of index.php or below
			$f = dirname($u.$d.$fname)."/".basename($u.$d.$fname);
			// and file exists
			if (file_exists($f)) {
				// include it once
				include_once($f);
				return;
			}
		}
	}
}



// first include the configuration
cmvc_include('config.php');

if (!defined("LOG_FILE")) {
	die("Constant LOG_FILE is undefined, please define in config.php - exiting.\n");
}
@touch(LOG_FILE);
if (!file_exists(LOG_FILE)) {
	die(LOG_FILE." does not exists, exiting.\n");
}
if (!is_writable(LOG_FILE)) {
	die(LOG_FILE." is not writable by the current webserver process, exiting.\n");
}

if (defined('DEBUG') && (DEBUG == 0)) {
	ob_start();
}

// framework
cmvc_include('actiondispatcher.php');
cmvc_include('arraylist.php');
cmvc_include('captcha.php');
cmvc_include('centermap.php');
cmvc_include('cmvccontroller.php');
cmvc_include('dbaccess.php');
cmvc_include('error_messages.php');
cmvc_include('functions.php');
cmvc_include('googlemaps.php');
cmvc_include('htmlmail.php');
cmvc_include('log.php');
cmvc_include('map_radius.php');
cmvc_include('multiextender.php');
cmvc_include('network.php');
cmvc_include('session.php');
cmvc_include('smtp.php');
cmvc_include('socket.php');
cmvc_include('upload.php');
cmvc_include('utf8.php');
cmvc_include('validator.php');
cmvc_include('view.php');


// pages
cmvc_include('include.php');



if (defined('DEBUG') && (DEBUG == 0)) {
	ob_end_clean();
}
	

?>
