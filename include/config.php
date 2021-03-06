<?php 
include_once('libcompactmvc.php');
LIBCOMPACTMVC_ENTRY;

/**
 * Application config
 *
 * @author      Botho Hohbaum <bhohbaum@googlemail.com>
 * @package     LibCompactMVC
 * @copyright   Copyright (c) Botho Hohbaum 11.02.2014
 * @link		http://www.adrodev.de
 */

// Set global constants

// DB Server:

// DB Server (IP or hostname)
define("MYSQL_HOST", "localhost");

// default DB
define("MYSQL_DB", "compactcms");

// DB user
define("MYSQL_USER", "botho");

// DB password
define("MYSQL_PASS", "Mausi_303");

define("DBA_DEFAULT_CLASS", "DBA");

// Register GET/POST/PUT variables as members in the controllers
define('REGISTER_HTTP_VARS', true);

// Further constants to be set at installation time
define('UPLOAD_BASE_DIR', './files/upload');				// relative to $_SERVER['DOCUMENT_ROOT']
define('IMAGES_BASE_DIR', './files/images');				// relative to $_SERVER['DOCUMENT_ROOT']
define('TEMP_DIR', './files/temp');							// relative to $_SERVER['DOCUMENT_ROOT']
define('CSV_BASE_DIR', './files/csv');						// relative to $_SERVER['DOCUMENT_ROOT']
define('LOG_FILE', '/Users/botho/log/compactcms.log');			// relative to $_SERVER['DOCUMENT_ROOT']
define('BASE_URL', 'http://libcompactmvc.bothos-mbp');
define('DEFAULT_TIMEZONE', 'CET');

define('REDIS_HOST', '127.0.0.1');
define('REDIS_PORT', 6379);

define('REDIS_KEY_RCACHE_PFX', 'RENDERCACHE_');
define('REDIS_KEY_RCACHE_TTL', 600);

define('CAPTCHA_RES_PATH', "./include/resources");			// relative to $_SERVER['DOCUMENT_ROOT']
define('CAPTCHA_SESS_VAR', "captcha");

define('SMTP_SERVER', '127.0.0.1');
define('SMTP_USER', '');
define('SMTP_PASS', '');
define('SMTP_SENDER', 'test@bothos-mbp');
define('SMTP_SENDER_NAME', 'LibCompactMVC');
// Send method: MAIL (mail() function) or SMTP
define('MAIL_TRANS_TYPE', 'SMTP');
define('MAIL_RECEIVER', 'b.hohbaum@googlemail.com');
define('MAIL_DEBUG_ADDR', 'b.hohbaum@googlemail.com');

// allowed users (login)
// to get the hash on a terminal, type: 
// php -r 'echo(md5("your-password-goes-here")."\n");'
define('LOGIN_USERS', '{"adrodev": 	"c0e8bf3bdd9583f9650fefd8ec590b5c", 
						"admin": 	"64ab07516f3e7adb0a79cc5ec9ca529d"}');

// special DB content
define('MPT_TEXT_ONLY', 		"text_only");
define('MPT_TEXT_WITH_IMAGE', 	"text_with_image");
define('MPT_TYPE_IMAGE_ONLY', 	"image_only");

define('TRACKING_MAIL_SENT', 	"mail_sent");
define('TRACKING_MAIL_OPENED', 	"mail_opened");
define('TRACKING_LINK_CLICKED',	"link_clicked");


define('ROOT_ELEM_TYPE_DESC', "root");
define('ROOT_ELEM_DATA_KEY', "startpage");

// Session
define('SESSION_DYNAMIC_ID_DISABLED', true);

// Debug messages & logging
// 0	off
// 1	on
define('DEBUG', 1);



?>
