<?php
@include_once ('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Test page
 *
 * @author Botho Hohbaum <bhohbaum@googlemail.com>
 * @package LibCompactMVC
 * @copyright Copyright (c) Botho Hohbaum 19.02.2014
 * @link http://www.adrodev.de
 */
class ElemDataEditor extends CMVCController {
	private $id;
	private $element;
	private $etype;
	private $edtypes;
	private $edata;

	protected function dba() {
		return "BackendDBA";
	}

	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->id = $this->request("id");
		$this->element = $this->db->get_element_by_id($this->id);
		$this->etype = $this->db->get_element_types_by_id($this->element["fk_id_element_types"]);
		$this->edtypes = $this->db->get_element_data_types_by_element_id($this->id);
		foreach ($this->edtypes as $idx => $edtype) {
			$this->edata[$idx] = $this->db->get_element_data_by_element_id_and_type_name($this->id, $edtype["name"]);
		}
	}

	protected function run_page_logic_get() {
		$this->view->add_template("header.tpl");
		$this->view->add_template("elemdataeditor.tpl");
		$this->view->add_template("footer.tpl");
		$this->view->set_value("id", $this->id);
		$this->view->set_value("edtypes", $this->edtypes);
		$this->view->set_value("edata", $this->edata);
		$template = file_get_contents("./templates/cms/" . $this->db->get_element_types_by_id($this->element["fk_id_element_types"], true)->template);
		$this->view->set_value("template", nl2br(str_replace("	", "&nbsp;&nbsp;&nbsp;&nbsp;", str_replace(" ", "&nbsp;", htmlentities($template)))));
	}

	protected function run_page_logic_post() {
		$this->run_page_logic_delete();
		foreach ($this->edtypes as $key => $val) {
			$this->db->add_element_data($val["id_element_data_types"], $this->id, "null", UTF8::encode($this->request($val["name"])));
		}
		foreach ($this->edtypes as $idx => $edtype) {
			$this->edata[$idx] = $this->db->get_element_data_by_element_id_and_type_name($this->id, $edtype["name"]);
		}
		$this->run_page_logic_get();
		$this->view->activate("closeit");
	}

	protected function run_page_logic_delete() {
		$this->db->delete_element_data_by_element_id($this->id);
	}

	protected function run_page_logic() {
		DLOG(__METHOD__);
	}


}

?>