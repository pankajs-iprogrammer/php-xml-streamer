<?php

ini_set('max_execution_time', 200);
// error_reporting(0);

// configuration
define('DBHOST', "localhost");
define('DBNAME', "my_idea_cms_feb_19");
define('DBUSER', "root");
define('DBPASS', "iprogrammer123#");

// Folder Path
define('PATH', './docs/');

// Max Query Size
define('MAX_QUERY_SIZE', 500);
$conn = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME) or die("Mysql Connetion Error : ". mysqli_connect_error());