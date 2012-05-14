<?php
@include_once('../libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Description of htmllist.php
 *
 * @author      bhohbaum
 * @package     libcompactmvc
 * @copyright   Copyright (c) HTML Design 24.01.2012
 * @link		https://redmine.hive2.compactmvc.net/projects/libcompactmvc
 */

class HTMLList {
	
	private $ptr;
	private $items;
	
	public function __construct() {
		$this->ptr = 0;
		$this->items = array();
	}
	
	public function add_item($data) {
		while (isset($this->items[$this->ptr])) {
			$this->ptr++;
		}
		$this->items[$this->ptr] = $data;
	}
	
	public function get_item_count() {
		return count($this->items);
	}
	
	public function get_item($index) {
		if (isset($this->items[$index])) {
			return ($this->items[$index]);
		} else {
			return false;
		}
	}
	
	public function get_prev_item() {
		$this->ptr--;
		if (isset($this->items[$this->ptr])) {
			return $this->items[$this->ptr];
		} else {
			return false;
		}
	}
	
	public function get_current_item() {
		if (isset($this->items[$this->ptr])) {
			return $this->items[$this->ptr];
		} else {
			return false;
		}
	}
	
	public function get_next_item() {
		$this->ptr++;
		if (isset($this->items[$this->ptr])) {
			return $this->items[$this->ptr];
		} else {
			return false;
		}
	}
	
	public function get_position() {
		return $this->ptr;
	}
	
	public function set_position($pos) {
		$this->ptr = $pos;
		if ($this->ptr > count($this->items) - 1) {
			$this->ptr = count($this->items) - 1;
		}
		if ($this->ptr < 0) {
			$this->ptr = 0;
		}
	}
	
	public function reset() {
		$this->ptr = 0;
	}
	
}


?>