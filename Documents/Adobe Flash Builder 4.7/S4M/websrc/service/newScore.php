<?php 

include '../conf/config.php';

$link = sqlConnect();

$name = $_POST["name"];

$sql = "INSERT INTO scores (ident_name, created, updated) VALUES ('". sql($name) ."', now(), now())";
$result_flag = mysql_query($sql);

if(!$result_flag){
	die(mysql_error());
}

$last_id = mysql_insert_id();

header('Content-type: text/plain; charset=utf-8');
print $last_id;

sqlClose($link);

?>