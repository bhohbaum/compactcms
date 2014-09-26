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
		$this->cmsview->set_id($this->id);
		$this->cmsview->set_root(true);
		$this->cmsview->add_template("cms/parts/" . $this->db->get_element_type_by_id($this->db->get_element_by_id($this->id, true)->fk_id_element_types, true)->template);
		$this->binary_response($this->cmsview->render());
	}


}

?>