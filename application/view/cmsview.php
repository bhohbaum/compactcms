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
			$subview->set_value("element", $this->db->get_element_by_id($child->id_elements, true));
			$subview->set_value("element_type", $this->db->get_element_type_by_id($subview->get_value("element")->fk_id_element_types, true));
			$subview->set_value("element_data", $this->db->get_element_data_by_element_id($child->id_elements, true));
			$subview->add_template("cms/parts/".$subview->get_value("element_type")->template);
			$out .= $subview->render();
		}
		return $out;
	}
	
	public function set_id($id) {
		$this->id = $id;
	}
	
	public function get_id() {
		return $this->id;
	}
	
}

?>