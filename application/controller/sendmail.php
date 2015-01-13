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
class SendMail extends CMVCController {
	private $user;
	private $pass;

	protected function dba() {
		DLOG(__METHOD__);
		return "DBA";
	}

	protected function retrieve_data_post() {
		DLOG(__METHOD__);
		$this->populate_members();
	}

	protected function run_page_logic() {
		DLOG(__METHOD__);
		$mail = new HTMLMail(MAIL_TRANS_TYPE);
		$mail->set_smtp_access(SMTP_SERVER);
		$mail->set_sender(SMTP_SENDER, SMTP_SENDER_NAME);
		$mail->set_receiver(MAIL_RECEIVER);
		$mail->set_reply_to($this->email);
		$mail->set_subject(MAIL_SUBJECT);
		$body = "Name: $this->name
Tel.: $this->telephone
E-Mail: $this->email

Nachricht:
$this->message
		";
		$mail->set_text_body($body);
		$mail->send();
		header("Location: /seolinks/kontakt");
	}



}

?>