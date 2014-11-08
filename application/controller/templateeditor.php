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
class TemplateEditor extends CMVCController {
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
		$this->populate_members();
	}

	protected function run_page_logic_get() {
		DLOG(__METHOD__);
		$this->view->add_template("header.tpl");
		$this->view->add_template("templateeditor.tpl");
		$this->view->add_template("footer.tpl");
		if (isset($this->param0)) {
			$this->view->activate($this->param0);
		} else {
			$this->view->activate("page");
		}
	}


}

?>