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
class AddElement extends CMVCController {
	private $redis;
	private $id;
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
		$this->fk_id_element_types = $this->request("fk_id_element_types");
		$this->fk_id_parent_element = $this->request("fk_id_parent_element");
		$this->ordinal = $this->request("ordinal");
		$this->position = $this->request("position");
		$this->description = $this->request("description");
	}
	
	protected function run_page_logic_get() {
		DLOG(__METHOD__);
		$this->view->add_template("header.tpl");
		$this->view->add_template("addelement.tpl");
		$this->view->add_template("footer.tpl");
		$this->view->set_value("id", $this->id);
		$this->view->set_value("etypes", $this->db->get_element_types());
	}
	
	protected function run_page_logic_post() {
		DLOG(__METHOD__);
		$viewstate = $this->redis->get("viewstate_".$_COOKIE["PHPSESSID"]);
		$this->redis->flushAll();
		$this->redis->set("viewstate_".$_COOKIE["PHPSESSID"], $viewstate);
		$this->view->add_template("header.tpl");
		$this->view->add_template("addelement.tpl");
		$this->view->add_template("footer.tpl");
		$this->view->set_value("id", $this->id);
		$this->view->set_value("etypes", $this->db->get_element_types());
		$this->view->activate("closeit");
		$this->db->add_element($this->fk_id_element_types, $this->fk_id_parent_element, $this->ordinal, $this->position, $this->description);
	}
	
	
	
	
	
}

?>