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
class BackendDBA extends CMSDBA {
	
	public function write2log($loglevel, $date, $text) {
		// dummy atm
	}
	
	
	public function get_child_elements_by_pid($id, $obj = false) {
		if (($id == null) || ($id == '')) {
			$id = 'null';
		}
		$q = "SELECT	*
				FROM	elements
				WHERE	fk_id_parent_element = ".$this->mysqli->real_escape_string($id)."
			ORDER BY	position, ordinal ASC";
		return $this->run_query($q, true, $obj);
	}
	
	
	
	
	
	
	
	
	
}

?>