<?php
@include_once ('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Test page
 *
 * @author Botho Hohbaum <bhohbaum@googlemail.com>
 * @package LibCompactMVC
 * @copyright Copyright (c) Botho Hohbaum 19.02.2014
 * @link http://www.creativemedialounge.de
 */
class TemplateEditor extends CMVCController {
	private $id;
	private $cmsview;
	private $element;
	private $element_type;
	private $element_data;

	protected function dba() {
		return "BackendDBA";
	}

	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->populate_members();
	}

	protected function run_page_logic_get() {
		DLOG(__METHOD__);
		try {
			if ($this->param0 == "tpllist") {
				$this->view->set_value("elemtypes", $this->db->get_element_types(true));
			}
			if ($this->param0 == "template") {
				$this->view->set_value("template", file_get_contents("./templates/cms/" . $this->param1));
			}
			if ($this->param0 == "tpldata") {
				$this->view->set_value("element_data_types", $this->db->get_element_data_types(true));
				$this->view->set_value("element_data_types", $this->db->get_element_data_types_by_element_id(true));
			}
			$this->view->add_template("templateeditor.tpl");
			$this->view->activate($this->param0);
		} catch (Exception $e) {
			$this->view->clear();
			$this->view->add_template("header.tpl");
			$this->view->add_template("templateeditor.tpl");
			$this->view->add_template("footer.tpl");
			$this->view->activate("page");
		}
	}


}

?>