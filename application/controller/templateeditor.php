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
			$test = $this->param0;
		} catch (Exception $e) {
			$this->view->clear();
			$this->view->add_template("header.tpl");
			$this->view->add_template("templateeditor.tpl");
			$this->view->add_template("footer.tpl");
			$this->view->activate("page");
			return;
		}
		try {
			if ($this->param0 == "tpllist") {
				$this->view->set_value("elemtypes", $this->db->get_element_types(true));
			}
			if ($this->param0 == "template") {
				$etype = $this->db->get_element_types_by_id($this->param1, true);
				$this->view->set_value("template", file_get_contents("./templates/cms/" . $etype->template));
			}
			if ($this->param0 == "elemtype") {
				$etype = $this->db->get_element_types_by_id($this->param1, true);
				$this->json_response($etype);
				return;
			}
			if ($this->param0 == "tpldata") {
				$alledt = $this->db->get_element_data_types_without_element_type_id($this->param1, true);
				$myedt = $this->db->get_element_data_types_by_element_type_id($this->param1, true);
				$this->view->set_value("id", $this->param1);
				$this->view->set_value("unused", $alledt);
				$this->view->set_value("used", $myedt);
			}
			$this->view->add_template("templateeditor.tpl");
			$this->view->activate($this->param0);
		} catch (Exception $e) {
			throw $e;
		}
	}
	
	protected function run_page_logic_post() {
		DLOG(__METHOD__);
		try {
			if ($this->param0 == "template") {
				$etype = $this->db->get_element_types_by_id($this->param1, true);
				file_put_contents("./templates/cms/" . $etype->template, UTF8::encode(base64_decode($this->data)));
				$this->binary_response($this->data);
				return;
			}
			if ($this->param0 == "elemtype") {
				$data = json_decode($this->data, false);
				$etype = $this->db->get_element_types_by_id($this->param1, true);
				$this->db->update_element_type($etype->id_element_types, $data->description, $etype->template, $data->is_page);
				$this->json_response($data);
				return;
			}
			if ($this->param0 == "usedata") {
				$this->db->add_element_types_has_element_data_types($this->tplid, $this->fieldid);
				return;
			}
			if ($this->param0 == "unusedata") {
				$this->db->del_element_types_has_element_data_types($this->tplid, $this->fieldid);
				return;
			}
			if ($this->param0 == "adddata") {
				
			}
		} catch (Exception $e) {
			throw $e;
		}
		
		
	}

	protected function run_page_logic_put() {
		DLOG(__METHOD__);
		try {
			if ($this->param0 == "template") {
				if ($this->db->get_element_types_by_template_name($this->param1, true) == null) {
					file_put_contents("./templates/cms/" . $this->param1, "");
					$this->db->add_element_type("", $this->param1, 0);
				}
				return;
			}
			if ($this->param0 == "templatedata") {
				if ($this->db->get_element_data_types_by_name($this->param1, true) == null) {
					$this->db->add_element_data_type($this->param1);
				}
				return;
			}
		} catch (Exception $e) {
			throw $e;
		}
	}
	
	protected function run_page_logic_delete() {
		try {
			if ($this->param0 == "template") {
				$etype = $this->db->get_element_types_by_id($this->param1, true);
				unlink("./templates/cms/" . $etype->template);
				$this->db->delete_element_type_by_id($this->param1);
			}
			if ($this->param0 == "templatedata") {
				$this->db->delete_element_data_types_by_id($this->param1);
			}
		} catch (Exception $e) {
			throw $e;
		}
	}
	
	
}

?>