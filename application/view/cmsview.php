<?php
@include_once ('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

// This class is used for recursive template/part handling.
// It loads the templates, fills them with values and generates the output
// which is returned by the subpart method.

/**
 * Template handling
 *
 * @author Botho Hohbaum (bhohbaum@googlemail.com)
 * @package LibCompactMVC
 * @copyright Copyright (c) Botho Hohbaum 24.01.2012
 * @license LGPL version 3
 * @link https://github.com/bhohbaum/libcompactmvc
 */
class CMSView extends View {
	private $db;
	private $data;
	private $id;
	private $element_data;
	
	public function __construct() {
		parent::__construct();
		$this->db = DbAccess::get_instance("CMSDBA");
	}
	
	public function subpart($position) {
		$out = "";
		$children = $this->db->get_element_by_pid_and_position($this->id, $position, true);
		if (!isset($children)) {
			return "";
		}
		foreach ($children as $child) {
			$subview = new CMSView();
			$subview->set_id($child->id_elements);
			$subview->add_template("cms/parts/".$this->db->get_element_type_by_id($this->db->get_element_by_id($child->id_elements, true)->fk_id_element_types, true)->template);
			$out .= $subview->render();
		}
		return $out;
	}
	
	public function get_data($tname) {
		$data = $this->db->get_element_data_by_element_id_and_type_name($this->id, $tname, true);
		return $data->data;
	}
	
	public function set_id($id) {
		$this->id = $id;
	}
	
	public function get_id() {
		return $this->id;
	}
	
}

?>