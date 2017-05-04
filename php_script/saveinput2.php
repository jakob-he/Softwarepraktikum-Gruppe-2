<?php
$data = $_POST['data'];

$groupfile = fopen("../uploads/current/customize.txt", "w");
fwrite($groupfile, $data);
fclose($groupfile);
?>
