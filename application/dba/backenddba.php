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
				WHERE	fk_id_parent_element = " . $this->mysqli->real_escape_string($id) . "
			ORDER BY	position, ordinal ASC";
		return $this->run_query($q, true, $obj);
	}

	public function get_pages($obj = false) {
		$q = "SELECT	elements.*
				FROM	elements
			INNER JOIN	element_types
				ON		elements.fk_id_element_types = element_types.id_element_types
				WHERE	element_types.is_page = 1";
		return $this->run_query($q, true, $obj);
	}

	public function get_element_data_by_element_id($id, $obj = false) {
		$q = "SELECT 	*
				FROM	element_data
				WHERE	fk_id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, true, $obj);
	}

	public function get_element_data_types_by_element_id($id, $obj = false) {
		$q = "SELECT	element_data_types.*
				FROM	elements
			INNER JOIN	element_types
				ON		elements.fk_id_element_types = element_types.id_element_types
			INNER JOIN	element_types_has_element_data_types
				ON		element_types_has_element_data_types.fk_id_element_types = element_types.id_element_types
			INNER JOIN	element_data_types
				ON		element_data_types.id_element_data_types = element_types_has_element_data_types.fk_id_element_data_types
				WHERE	elements.id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, true, $obj);
	}

	public function get_element_data_types_by_element_type_id($id, $obj = false) {
		$q = "SELECT	element_data_types.*
				FROM	element_types
			INNER JOIN	element_types_has_element_data_types
				ON		element_types_has_element_data_types.fk_id_element_types = element_types.id_element_types
			INNER JOIN	element_data_types
				ON		element_data_types.id_element_data_types = element_types_has_element_data_types.fk_id_element_data_types
				WHERE	elements.id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, true, $obj);
	}

	public function get_element_data_types($obj = false) {
        $q = "SELECT	*
				FROM	element_data_types";
		return $this->run_query($q, true, $obj);
	}
	
	public function get_element_types($obj = false) {
		$q = "SELECT	*
				FROM	element_types
			ORDER BY	is_page DESC, description ASC";
		return $this->run_query($q, true, $obj);
	}

	public function delete_element_data_type_by_id($id) {
		$q = "DELETE FROM	element_data_types
				WHERE		id_element_data_types = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, false);
	}

	public function delete_element_data_by_element_id($id) {
		$q = "DELETE FROM	element_data
				WHERE		fk_id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, false);
	}

	public function delete_element_by_id($id) {
		$q = "DELETE FROM	elements
				WHERE		id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, false);
	}

	public function add_element_data($fk_id_element_data_types, $fk_id_elements, $fk_id_languages, $data) {
		$fk_id_languages = ($fk_id_languages == null) ? "null" : $fk_id_languages;
		$q = "INSERT INTO 	element_data
							(fk_id_element_data_types, fk_id_elements, fk_id_languages, data)
				VALUES		(" . $this->mysqli->real_escape_string($fk_id_element_data_types) . ",
							" . $this->mysqli->real_escape_string($fk_id_elements) . ",
							" . $this->mysqli->real_escape_string($fk_id_languages) . ",
							'" . $this->mysqli->real_escape_string($data) . "')";
		return $this->run_query($q, false);
	}

	public function add_element($fk_id_element_types, $fk_id_parent_element, $ordinal, $position, $description) {
		$fk_id_parent_element = ($fk_id_parent_element == null) ? "null" : $fk_id_parent_element;
		$q = "INSERT INTO 	elements
							(fk_id_element_types, fk_id_parent_element, ordinal, position, description)
				VALUES		(" . $this->mysqli->real_escape_string($fk_id_element_types) . ",
							" . $this->mysqli->real_escape_string($fk_id_parent_element) . ",
							" . $this->mysqli->real_escape_string($ordinal) . ",
							" . $this->mysqli->real_escape_string($position) . ",
							'" . $this->mysqli->real_escape_string($description) . "')";
		return $this->run_query($q, false);
	}

	public function update_element($id, $fk_id_element_types, $fk_id_parent_element, $ordinal, $position, $description) {
		$fk_id_parent_element = ($fk_id_parent_element == null) ? "null" : $fk_id_parent_element;
		$q = "UPDATE 	elements
				SET		fk_id_element_types = " . $this->mysqli->real_escape_string($fk_id_element_types) . ",
						fk_id_parent_element = " . $this->mysqli->real_escape_string($fk_id_parent_element) . ",
						ordinal = " . $this->mysqli->real_escape_string($ordinal) . ",
						position = " . $this->mysqli->real_escape_string($position) . ",
						description = '" . $this->mysqli->real_escape_string($description) . "'
				WHERE	id_elements = " . $this->mysqli->real_escape_string($id);
		return $this->run_query($q, false);
	}


}

?>