<?php

/**
 * Database functions
 *
 * @author		Botho Hohbaum (bhohbaum@googlemail.com)
 * @package		LibCompactMVC
 * @copyright	Copyright (c) Botho Hohbaum 24.01.2012
 * @license		LGPL version 3
 * @link		https://github.com/bhohbaum/libcompactmvc
 */
class CMSDBA extends DbAccess {
	
	public function write2log($loglevel, $date, $text) {
		// dummy atm
	}
	
	
	public function get_element_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	elements
				WHERE	id_elements = ".$this->mysqli->real_escape_string($id);
		return $this->run_query($q, false, $obj);
	}
	
	public function get_element_type_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	element_types
				WHERE	id_element_types = ".$this->mysqli->real_escape_string($id);
		return $this->run_query($q, false, $obj);
	}
	
	
	
	
	
	
	
	
}

?>