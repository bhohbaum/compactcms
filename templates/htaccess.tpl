RewriteEngine on

RewriteRule ^app$ /index.php?&action=&%{QUERY_STRING} [L]

RewriteRule ^app/([^/]*)$ /index.php?&action=$1&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)$ /index.php?&action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)$ /index.php?&action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /index.php?&action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /index.php?&action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]

RewriteRule ^restapi/([^/]*)$ /api.php?&action=$1&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)$ /api.php?&action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)$ /api.php?&action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /api.php?&action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /api.php?&action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]

RewriteRule ^backend$ /backend.php?&action=test&%{QUERY_STRING} [L]
 
RewriteRule ^backend/([^/]*)$ /backend.php?&action=$1&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)$ /backend.php?&action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)$ /backend.php?&action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /backend.php?&action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ /backend.php?&action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]


<?= $this->get_value("") ?>