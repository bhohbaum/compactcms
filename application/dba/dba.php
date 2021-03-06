<?php

/**
 * Database functions
 *
 * @author		Botho Hohbaum (bhohbaum@googlemail.com)
 * @package		LibCompactMVC
 * @copyright	Copyright (c) Botho Hohbaum 24.01.2012
 * @license		LGPL version 3
 * @link		https://github.com/bhohbaum/libcompactmvc
 */
class DBA extends DbAccess {

	public function write2log($loglevel, $date, $text) {
		// dummy atm
	}

	public function get_all_mailings($obj = false) {
		$q = "SELECT	*
				FROM	mailings";
		return $this->run_query($q, true, $obj);
	}

	public function get_image_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	images
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_text_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	texts
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mailpart_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailparts
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_event_type_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	event_types
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_event_type_by_name($id, $obj = false) {
		$q = "SELECT	*
				FROM	event_types
				WHERE	name = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mailing_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailings
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false, $obj);
	}

	public function get_mailpart_type_by_name($name, $obj = false) {
		$q = "SELECT	*
				FROM	mailpart_types
				WHERE	name = '" . $this->escape($name) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mailpart_type_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailpart_types
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_receiver_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	receivers
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_receiver_by_email($email, $obj = false) {
		$q = "SELECT	*
				FROM	receivers
				WHERE	email = '" . $this->escape($email) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mhr_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailings_has_receivers
				WHERE	id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mhr_by_ident($ident, $obj = false) {
		$q = "SELECT	*
				FROM	mailings_has_receivers
				WHERE	ident = '" . $this->escape($ident) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mhr_by_mailing_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailings_has_receivers
				WHERE	fk_id_mailings = '" . $this->escape($id) . "'";
		return $this->run_query($q, true, $obj);
	}

	public function get_tracking_combined_by_mailing_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	tracking_combined
				WHERE	mhr_fk_id_mailings = '" . $this->escape($id) . "'";
		return $this->run_query($q, true, $obj);
	}

	public function get_tracking_events_by_mhr_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	tracking_combined
				WHERE	mhr_id = '" . $this->escape($id) . "'";
		return $this->run_query($q, true, $obj);
	}

	public function get_last_tracking_event_by_mhr_and_mailing_id($mailingid, $mhrid, $obj = false) {
		$q = "SELECT	*
				FROM	tracking_combined
				WHERE	mhr_fk_id_mailings = '" . $this->escape($mailingid) . "'
				AND		mhr_id = '" . $this->escape($mhrid) . "'
			ORDER BY	te_id DESC
				LIMIT	0,1";
		return $this->run_query($q, false, $obj);
	}

	public function create_image() {
		$q = "INSERT INTO 	images 
							(name)
				VALUES		('')";
		return $this->run_query($q, false);
	}

	public function create_text($text) {
		$q = "INSERT INTO 	texts 
							(text)
				VALUES		('" . $this->escape($text) . "')";
		return $this->run_query($q, false);
	}

	public function create_tracking_event($fk_id_mailings_has_receivers, $fk_id_event_types, $fk_id_mailparts) {
		if (!is_numeric($fk_id_event_types)) {
			$event_type = $this->get_event_type_by_name($fk_id_event_types);
			$fk_id_event_types = $event_type["id"];
		}
		$fk_id_mailings_has_receivers = ($fk_id_mailings_has_receivers == null) ? "null" : $fk_id_mailings_has_receivers;
		$fk_id_event_types = ($fk_id_event_types == null) ? "null" : $fk_id_event_types;
		$fk_id_mailparts = ($fk_id_mailparts == null) ? "null" : $fk_id_mailparts;
		$q = "INSERT INTO 	tracking_events 
							(fk_id_mailings_has_receivers,
							fk_id_event_types,
							fk_id_mailparts)
				VALUES		(" . $this->escape($fk_id_mailings_has_receivers) . ",
							" . $this->escape($fk_id_event_types) . ",
							" . $this->escape($fk_id_mailparts) . ")";
		return $this->run_query($q, false);
	}

	public function create_mailing($name) {
		$q = "INSERT INTO 	mailings 
							(name)
				VALUES		('" . $this->escape($name) . "')";
		return $this->run_query($q, false);
	}

	public function create_mailpart($ordinal, $mailings, $mailpart_types, $texts, $images) {
		$texts = ($texts == null) ? "null" : $texts;
		$images = ($images == null) ? "null" : $images;
		$q = "INSERT INTO 	mailparts 
							(ordinal, fk_id_mailings, fk_id_mailpart_types, fk_id_texts, fk_id_images)
				VALUES		(" . $this->escape($ordinal) . ",
							" . $this->escape($mailings) . ",
							" . $this->escape($mailpart_types) . ",
							" . $this->escape($texts) . ",
							" . $this->escape($images) . ")";
		return $this->run_query($q, false);
	}

	public function create_receiver($email, $salutation, $firstname, $lastname) {
		$q = "INSERT IGNORE INTO 	receivers 
							(email, salutation, firstname, lastname)
				VALUES		('" . $this->escape($email) . "',
							'" . $this->escape($salutation) . "',
							'" . $this->escape($firstname) . "',
							'" . $this->escape($lastname) . "')";
		return $this->run_query($q, false);
	}

	public function create_mhr($fk_id_mailings, $fk_id_receivers) {
		$fk_id_mailings = ($fk_id_mailings == null) ? "null" : $fk_id_mailings;
		$fk_id_receivers = ($fk_id_receivers == null) ? "null" : $fk_id_receivers;
		$q = "INSERT IGNORE INTO 	mailings_has_receivers 
							(fk_id_mailings, fk_id_receivers)
				VALUES		(" . $this->escape($fk_id_mailings) . ",
							" . $this->escape($fk_id_receivers) . ")";
		return $this->run_query($q, false);
	}

	public function update_mailpart($id, $link, $ordinal, $mailings, $mailpart_types, $texts, $images) {
		$mailings = ($mailings == null) ? "null" : $mailings;
		$mailpart_types = ($mailpart_types == null) ? "null" : $mailpart_types;
		$texts = ($texts == null) ? "null" : $texts;
		$images = ($images == null) ? "null" : $images;
		if ($link == null) {
			$q = "UPDATE 	mailparts
					SET		ordinal = " . $this->escape($ordinal) . ",
							fk_id_mailings = " . $this->escape($mailings) . ",
							fk_id_mailpart_types = " . $this->escape($mailpart_types) . ",
							fk_id_texts = " . $this->escape($texts) . ",
							fk_id_images = " . $this->escape($images) . "
					WHERE	id = " . $this->escape($id);
		} else {
			$q = "UPDATE 	mailparts
					SET		link = '" . $this->escape($link) . "',
							ordinal = " . $this->escape($ordinal) . ",
							fk_id_mailings = " . $this->escape($mailings) . ",
							fk_id_mailpart_types = " . $this->escape($mailpart_types) . ",
							fk_id_texts = " . $this->escape($texts) . ",
							fk_id_images = " . $this->escape($images) . "
					WHERE	id = " . $this->escape($id);
		}
		return $this->run_query($q, false);
	}

	public function update_mailing($id, $name, $send_date) {
		$q = "UPDATE 	mailings
				SET		name = '" . $this->escape($name) . "',
						send_date = '" . $this->escape($send_date) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_mailing_name($id, $name) {
		$q = "UPDATE 	mailings
				SET		name = '" . $this->escape($name) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_mailing_send_date($id, $send_date) {
		$q = "UPDATE 	mailings
				SET		send_date = '" . $this->escape($send_date) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_mailing_data_url($id, $data_url) {
		$q = "UPDATE 	mailings
				SET		data_url = '" . $this->escape($data_url) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_mailing_subject($id, $subject) {
		$q = "UPDATE 	mailings
				SET		subject = '" . $this->escape($subject) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_text($id, $text) {
		$q = "UPDATE 	texts
				SET		text = '" . $this->escape($text) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function update_receiver($id, $email, $salutation, $firstname, $lastname) {
		$q = "UPDATE 	receivers
				SET		email = '" . $this->escape($email) . "',
						salutation = '" . $this->escape($salutation) . "',
						firstname = '" . $this->escape($firstname) . "',
						lastname = '" . $this->escape($lastname) . "'
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false);
	}

	public function get_mailpart_by_mailing_id_and_ordinal($id, $ordinal, $obj = false) {
		$q = "SELECT	*
				FROM	mailparts
				WHERE	fk_id_mailings = '" . $this->escape($id) . "'
				AND		ordinal = '" . $this->escape($ordinal) . "'";
		return $this->run_query($q, false, $obj);
	}

	public function get_mailparts_by_mailing_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	mailparts
				WHERE	fk_id_mailings = '" . $this->escape($id) . "'
			ORDER BY	ordinal ASC";
		return $this->run_query($q, true, $obj);
	}

	public function delete_text_by_id($id) {
		$q = "DELETE FROM	texts
				WHERE		id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false);
	}

	public function delete_image_by_id($id) {
		$image = $this->get_image_by_id($id);
		unlink(IMAGES_BASE_DIR . "/" . $image["name"] . ".jpg");
		$q = "DELETE FROM	images
				WHERE		id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false);
	}

	public function delete_mailpart_by_id($id) {
		$mailpart = $this->get_mailpart_by_id($id);
		if ($mailpart["fk_id_texts"] != null) {
			$this->delete_text_by_id($mailpart["fk_id_texts"]);
		}
		if ($mailpart["fk_id_images"] != null) {
			$this->delete_image_by_id($mailpart["fk_id_images"]);
		}
		$q = "DELETE FROM	mailparts
				WHERE		id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false);
	}

	public function delete_mailing_by_id($id) {
		$mailparts = $this->get_mailparts_by_mailing_id($id);
		foreach ($mailparts as $mailpart) {
			$this->delete_mailpart_by_id($mailpart["id"]);
		}
		$q = "DELETE FROM	mailings
				WHERE		id = '" . $this->escape($id) . "'";
		return $this->run_query($q, false);
	}

	public function get_next_receiver($obj = false) {
		$q = "SELECT	*
				FROM	next_receiver";
		return $this->run_query($q, false, $obj);
	}

	public function get_todays_mailings($obj = false) {
		$q = "SELECT	*
				FROM	todays_mailings";
		return $this->run_query($q, true, $obj);
	}

	public function get_tracking_overview($mailingid, $obj = false) {
		$q = "CALL tracking_overview($mailingid)";
		return $this->run_query($q, true, $obj);
	}
	
	// ======================================================================================================================================================
	/*
	public function get_element_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	elements
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false, $obj);
	}

	public function get_element_type_by_id($id, $obj = false) {
		$q = "SELECT	*
				FROM	element_types
				WHERE	id = " . $this->escape($id);
		return $this->run_query($q, false, $obj);
	}
	*/


}

?>