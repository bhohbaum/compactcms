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
	private $subparts;
	private $dataarr;
	private $root;

	public function __construct() {
		parent::__construct();
		$this->db = DbAccess::get_instance("CMSDBA");
		$this->root = false;
		$this->dataarr = array();
	}

	public function subpart($position) {
		$this->subparts[$position] = "";
		$children = $this->db->get_element_by_pid_and_position($this->id, $position, true);
		if (!isset($children)) {
			return "";
		}
		foreach ($children as $child) {
			$subview = new CMSView();
			$subview->set_id($child->id_elements);
			$elem = $this->db->get_element_type_by_id($this->db->get_element_by_id($child->id_elements, true)->fk_id_element_types, true);
			if (($elem->is_page == "0") || ($this->root)) {
				$subview->add_template("cms/parts/" . $elem->template);
				$this->subparts[$position] .= $subview->render(false);
			}
		}
		return $this->subparts[$position];
	}

	public function data($tname) {
		if (!array_key_exists($tname, $this->dataarr)) {
			$this->dataarr[$tname] = $this->db->get_element_data_by_element_id_and_type_name($this->id, $tname, true);
		}
		return $this->dataarr[$tname]->data;
	}
	
	public function render($caching = true) {
		$elem = $this->db->get_element_type_by_id($this->db->get_element_by_id($this->id, true)->fk_id_element_types, true);
		$e = $this->db->get_element_by_id($this->id, true);
		if ($e->fk_id_parent_element != null) {
			$t = $this->db->get_element_type_by_id($this->db->get_element_by_id($e->fk_id_parent_element, true)->fk_id_element_types);
		} else {
			$t["description"] = "NOT_" . ROOT_ELEM_DESC;
		}
		if (($elem->is_page == "0") || ($this->root) || ($t["description"] == ROOT_ELEM_DESC)) {
			$res = parent::render($caching);
		} else {
			$res = "";
		}
		return $res;
	}

	public function set_id($id) {
		$this->id = $id;
	}

	public function get_id() {
		return $this->id;
	}

	public function set_root($root) {
		$this->root = $root;
	}

	public function get_root() {
		return $this->root;
	}


}

?>