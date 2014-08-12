<?php
@include_once ('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

// This class is used for recursive template/part handling.
// It loads the templates, fills them with values and generates the output
// which is returned by the subpart method.

/**
 * Template handling
 *
 * @author Botho Hohbaum (bhohbaum@googlemail.com)
 * @package LibCompactMVC
 * @copyright Copyright (c) Botho Hohbaum 24.01.2012
 * @license LGPL version 3
 * @link https://github.com/bhohbaum/libcompactmvc
 */
class CMSView extends View {
	private $db;
	private $view;
	private $data;
	
	public function __construct() {
		parent::__construct();
		$this->db = DbAccess::get_instance("CMSDBA");
		$this->view = new CMSView();
	}
	
	public function subpart($partid, $position) {
		
//		$this->view
		return $this->render();
	}
	
}

?>