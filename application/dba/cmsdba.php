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
	
	
	//======================================================================================================================================================
	// methods for frontend rendering
	//======================================================================================================================================================
	
	public function get_element_by_id($id, $obj = false) {
		if (($id == null) || ($id == '')) {
			$id = 'null';
		}
		$q = "SELECT	*
				FROM	elements
				WHERE	id_elements = ".$this->mysqli->real_escape_string($id)."
			ORDER BY	position, ordinal ASC";
		return $this->run_query($q, false, $obj);
	}
	
	public function get_element_by_pid_and_position($pid, $pos, $obj = false) {
		$q = "SELECT	*
				FROM	elements
				WHERE	fk_id_parent_element = ".$this->mysqli->real_escape_string($pid)."
				AND		position = ".$this->mysqli->real_escape_string($pos)."
			ORDER BY	ordinal ASC";
		return $this->run_query($q, true, $obj);
	}
	
	public function get_element_type_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	element_types
				WHERE	id_element_types = ".$this->mysqli->real_escape_string($id);
		return $this->run_query($q, false, $obj);
	}
	
	public function get_element_data_by_element_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	element_data
				WHERE	id_element_data = ".$this->mysqli->real_escape_string($id);
		return $this->run_query($q, false, $obj);
	}
	
	public function get_element_data_by_element_id_and_type_name($id, $type_name, $obj = false) {
		$q = "SELECT	*
				FROM	element_data
			INNER JOIN	element_data_types
				ON		element_data.fk_id_element_data_types = element_data_types.id_element_data_types
			INNER JOIN	elements
				ON		element_data.fk_id_elements = elements.id_elements
				WHERE	elements.id_elements = ".$this->mysqli->real_escape_string($id)."
				AND		element_data_types.name = '".$this->mysqli->real_escape_string($type_name)."'";
		return $this->run_query($q, false, $obj);
	}
	
	
	
	
	
	
	
	
}

?>