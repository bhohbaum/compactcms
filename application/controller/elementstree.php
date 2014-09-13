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
class ElementsTree extends CMVCController {
	private $redis;
	private $id;
	private $json;
	private $param0;
	private $param1;
	private $param2;
	private $data;
	private $id_elements;
	private $fk_id_element_types;
	private $fk_id_parent_element;
	private $ordinal;
	private $position;
	private $description;
	
	protected function dba() {
		return "BackendDBA";
	}
	
	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->redis = new Redis();
		$this->redis->connect(REDIS_HOST, REDIS_PORT);
		$this->id = $this->request("id");
		$this->json = $this->request("json");
		$this->data = $this->request("data");
		$this->param0 = $this->request("param0");
		$this->param1 = $this->request("param1");
		$this->param2 = $this->request("param2");
		$this->id_elements = $this->request("id_elements");
		$this->fk_id_element_types = $this->request("fk_id_element_types");
		$this->fk_id_parent_element = $this->request("fk_id_parent_element");
		$this->ordinal = $this->request("ordinal");
		$this->position = $this->request("position");
		$this->description = $this->request("description");
	}
	
	protected function run_page_logic_get() {
		DLOG(__METHOD__);
		if ($this->param0 == "viewstate") {
			$this->json_response(json_decode($this->redis->get("viewstate_".$_COOKIE["PHPSESSID"]), true));
			return;
		}
		$etree = $this->db->get_element_by_id($this->id);
		$etypes = $this->db->get_element_types();
		$this->add_sub_elements($etree);
		if ($this->json == '1') {
			$this->json_response($etree);
			return;
		}
		$this->view->add_template("header.tpl");
		$this->view->add_template("elementstree.tpl");
		$this->view->add_template("footer.tpl");
		$this->view->set_value("id", $this->id);
		$this->view->set_value("etree", $etree);
		$this->view->set_value("etypes", $etypes);
	}
	
	protected function run_page_logic_post() {
		DLOG(__METHOD__);
		$viewstate = $this->redis->get("viewstate_".$_COOKIE["PHPSESSID"]);
		$this->redis->flushAll();
		$this->redis->set("viewstate_".$_COOKIE["PHPSESSID"], $viewstate);
		if ($this->param0 == "viewstate") {
			$val = urldecode($this->data);
			$this->redis->set("viewstate_".$_COOKIE["PHPSESSID"], $val);
			$this->redis->expire("viewstate_".$_COOKIE["PHPSESSID"], REDIS_KEY_RCACHE_TTL);
			$this->json_response(json_decode($val));
			return;
		} else if ($this->param0 == "save") {
			$this->db->update_element($this->id_elements, $this->fk_id_element_types, $this->fk_id_parent_element, $this->ordinal, $this->position, $this->description);
			$this->run_page_logic_get();
			return;
		} else if ($this->param0 == "copysubtree") {
			$this->db->update_element($this->id_elements, $this->fk_id_element_types, $this->fk_id_parent_element, $this->ordinal, $this->position, $this->description);
			$this->run_page_logic_get();
			return;
		}
	}
	
	protected function run_page_logic_delete() {
		$viewstate = $this->redis->get("viewstate_".$_COOKIE["PHPSESSID"]);
		$this->redis->flushAll();
		$this->redis->set("viewstate_".$_COOKIE["PHPSESSID"], $viewstate);
		if ($this->param0 == "delete") {
			$this->db->delete_element_by_id($this->param1);
		}
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