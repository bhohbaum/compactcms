<?php
@include_once('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Test page
 *
 * @author      Botho Hohbaum <bhohbaum@googlemail.com>
 * @package     LibCompactMVC
 * @copyright   Copyright (c) Botho Hohbaum 19.02.2014
 * @link		http://www.adrodev.de
 */
class CMSEditor extends CMVCController {
	private $id;
	
	protected function dba() {
		return "BackendDBA";
	}
	
	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->id = $this->request("id");
	}
	
	protected function run_page_logic() {
		DLOG(__METHOD__);
		$etree = $this->db->get_element_by_id($this->id);
		$this->add_sub_elements($etree);
		$this->json_response($etree);
	}
	
	protected function run_page_logic_get() {
		$etree = $this->db->get_element_by_id($this->id);
		$this->add_sub_elements($etree);
		$this->view->add_template("cmseditor.tpl");
		$this->view->set_value("etree", $etree);
	}
	
	private function add_sub_elements(&$parent) {
		if ($parent != null) {
			$parent["fk_id_element_types"] = $this->db->get_element_type_by_id($parent["fk_id_element_types"]);
		}
		$parent["subelements"] = $this->db->get_child_elements_by_pid($parent["id_elements"]);
		foreach ($parent["subelements"] as $idx => $element) {
			$this->add_sub_elements($parent["subelements"][$idx]);
		}
	}
	
	
	
	
}

?>