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
		DLOG(__METHOD__);
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
			$this->json_response(json_decode($this->redis->get("viewstate_" . $_COOKIE["PHPSESSID"]), true));
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
		if ($this->param0 == "viewstate") {
			$val = urldecode($this->data);
			$this->redis->set("viewstate_" . $_COOKIE["PHPSESSID"], $val);
			$this->redis->expire("viewstate_" . $_COOKIE["PHPSESSID"], REDIS_KEY_RCACHE_TTL);
			$this->json_response(json_decode($val));
			return;
		} else if ($this->param0 == "save") {
			$viewstate = $this->redis->get("viewstate_" . $_COOKIE["PHPSESSID"]);
			$this->redis->flushAll();
			$this->redis->set("viewstate_" . $_COOKIE["PHPSESSID"], $viewstate);
			$this->db->update_element($this->id_elements, $this->fk_id_element_types, $this->fk_id_parent_element, $this->ordinal, $this->position, strtolower(str_replace(" ", "_", $this->description)));
			$this->run_page_logic_get();
			return;
		} else if ($this->param0 == "copysubtree") {
			$viewstate = $this->redis->get("viewstate_" . $_COOKIE["PHPSESSID"]);
			$this->redis->flushAll();
			$this->redis->set("viewstate_" . $_COOKIE["PHPSESSID"], $viewstate);
			$src_parent = $this->db->get_element_by_id($this->id);
			$tgt_parent = $this->db->get_element_by_id($this->fk_id_parent_element);
			$this->copy_subtree($src_parent, $tgt_parent);
			$this->json_response(true);
			return;
		}
	}

	protected function run_page_logic_delete() {
		DLOG(__METHOD__);
		$viewstate = $this->redis->get("viewstate_" . $_COOKIE["PHPSESSID"]);
		$this->redis->flushAll();
		$this->redis->set("viewstate_" . $_COOKIE["PHPSESSID"], $viewstate);
		if ($this->param0 == "delete") {
			$this->db->delete_element_by_id($this->param1);
		}
	}

	private function add_sub_elements(&$parent) {
		DLOG(__METHOD__);
		if ($parent != null) {
			$parent["fk_id_element_types"] = $this->db->get_element_types_by_id($parent["fk_id_element_types"]);
		}
		$parent["subelements"] = $this->db->get_child_elements_by_pid($parent["id_elements"]);
		foreach ($parent["subelements"] as $idx => $element) {
			$this->add_sub_elements($parent["subelements"][$idx]);
		}
	}

	private function copy_subtree(&$src_parent, &$tgt_parent) {
		DLOG(__METHOD__);
		if ($src_parent == null) {
			return;
		}
		if ($tgt_parent == null) {
			return;
		}
		$id = $this->db->add_element($src_parent["fk_id_element_types"], $tgt_parent["id_elements"], $src_parent["ordinal"], $src_parent["position"], $src_parent["description"] . "-kopie");
		$elem = $this->db->get_element_by_id($id);
		$this->copy_element_data($src_parent, $elem);
		$src_parent["subelements"] = $this->db->get_child_elements_by_pid($src_parent["id_elements"]);
		foreach ($src_parent["subelements"] as $idx => $element) {
			$this->copy_subtree($src_parent["subelements"][$idx], $elem);
		}
	}

	private function copy_element_data($src_elem, $tgt_elem) {
		DLOG(__METHOD__);
		$data = $this->db->get_element_data_by_element_id($src_elem["id_elements"]);
		foreach ($data as $key => $val) {
			$this->db->add_element_data($val["fk_id_element_data_types"], $tgt_elem["id_elements"], $val["fk_id_languages"], $val["data"]);
		}
	}
	
	private function reindex() {
		DLOG(__METHOD__);
		$elements = $this->db->get_all_elements();
	}

}

?>