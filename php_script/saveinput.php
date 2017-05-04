<?php
$data = $_POST['data'];

$groupfile = fopen("../uploads/current/groups.txt", "w");
fwrite($groupfile, $data);
fclose($groupfile);
?>
