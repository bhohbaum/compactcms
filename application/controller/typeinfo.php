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
class TypeInfo extends CMVCController {
	private $id;

	protected function dba() {
		DLOG(__METHOD__);
		return "BackendDBA";
	}

	protected function retrieve_data() {
		DLOG(__METHOD__);
		$this->id = $this->request("id");
	}

	protected function run_page_logic() {
		DLOG(__METHOD__);
		$etype = $this->db->get_element_types_by_id($this->id);
	}


}

?>