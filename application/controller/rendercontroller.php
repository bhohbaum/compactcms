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
class RenderController extends CMVCController {
	
	private $id;
	private $cmsview;
	private $element;
	private $element_type;
	private $element_data;
	
	protected function dba() {
		return "CMSDBA";
	}
	
	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->id = $this->request("id");
		$this->cmsview = new CMSView();
	}
	
	protected function run_page_logic() {
		DLOG(__METHOD__);
		$this->element = $this->db->get_element_by_id($this->id);
		$this->element_type = $this->db->get_element_type_by_id($this->element["fk_id_element_types"]);
		$this->element_data = $this->db->get_element_data_by_element_id($this->id);
		$this->cmsview->set_id($this->id);
		$this->cmsview->set_value("element_type", $this->element_type);
		$this->cmsview->set_value("element_data", $this->element_data);
		$this->cmsview->add_template("cms/layouts/".$this->element_type["template"]);
		$this->binary_response($this->cmsview->render());
	}
	
}

?>