<?php
$path="../uploads/current";
$files = array_diff(scandir($path), array('.', '..'));
echo json_encode($files);
?>
