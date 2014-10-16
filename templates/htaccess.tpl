RewriteEngine on

RewriteBase /

<?php if ($this->get_value(ROOT_ELEM_DATA_KEY) != null)  { ?>
RewriteRule / app/rendercontroller?id=<?= $this->get_value(ROOT_ELEM_DATA_KEY) ?>&%{QUERY_STRING} [L]
<?php } ?>
<?php foreach($this->get_value("elements") as $key => $val) { ?>
RewriteRule ^seolinks/<?= strtolower(str_replace(" ", "_", $val["description"])) ?>$ app/rendercontroller?id=<?= $val["id_elements"] ?>&%{QUERY_STRING} [L]
<?php } ?>

RewriteRule ^app$ index.php?action=&%{QUERY_STRING} [L]

RewriteRule ^app/([^/]*)$ index.php?action=$1&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)$ index.php?action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)$ index.php?action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ index.php?action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^app/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ index.php?action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]

RewriteRule ^restapi/([^/]*)$ api.php?action=$1&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)$ api.php?action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)$ api.php?action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ api.php?action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^restapi/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ api.php?action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]

RewriteRule ^backend$ backend.php?action=test&%{QUERY_STRING} [L]
 
RewriteRule ^backend/([^/]*)$ backend.php?action=$1&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)$ backend.php?action=$1&param0=$2&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)$ backend.php?action=$1&param0=$2&param1=$3&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ backend.php?action=$1&param0=$2&param1=$3&param2=$4&%{QUERY_STRING} [L]
RewriteRule ^backend/([^/]*)/([^/]*)/([^/]*)/([^/]*)/([^/]*)$ backend.php?action=$1&param0=$2&param1=$3&param2=$4&param3=$5&%{QUERY_STRING} [L]



