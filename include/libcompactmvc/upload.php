<?php
@include_once('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Upload helper
 * 
 * @author Botho Hohbaum (bhohbaum@googlemail.com)
 * @package LibCompactMVC Mail Module
 * @license LGPL version 3
 * @link http://www.gnu.org/licenses/lgpl.html
 */
class Upload {
	
	private $ul_path;
	private $files_arr;
	private $names_arr;
	
	public function __construct($path) {
		$this->ul_path = $path;
		$this->files_arr = $_FILES;
	}
	
	public function save() {
		$ret = array();
		$i = 0;
		foreach ($this->files_arr as $key => $value) {
			$this->names_arr[$i++] = $key;
			if ($value['name'] != "") {
				move_uploaded_file($value['tmp_name'], $this->ul_path."/".$value['name'])
					or die('cannot write to upload directory');
				chmod($this->ul_path."/".$value['name'], 0666);
				$ret[] = $this->ul_path."/".$value['name'];
			}
		}
		return $ret;
	}
	
	public function save_sub() {
		$ret = array();
		foreach ($this->files_arr as $key => $value) {
			if ($value['name'] != "") {
				move_uploaded_file($value['tmp_name'], $this->ul_path."/".$key."/".$value['name'])
					or die('cannot write to upload directory');
				chmod($this->ul_path."/".$key."/".$value['name'], 0666);
				$ret[$key][] = $this->ul_path."/".$key."/".$value['name'];
			}
		}
		return $ret;
	}
	
	public function get_param_name($index = 0) {
		return $this->names_arr[$index];
	}
	
}



?>