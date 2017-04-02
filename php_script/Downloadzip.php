<?php
$downloadfile = "output/current/Qualitycontrol.zip";
$filename = "Qualitycontrol.zip";
$filesize = filesize($downloadfile);

header("Content-Type: application/zip");
header("Content-Disposition: attachment; filename='$filename'");
header("Content-Length: $filesize");

readfile($downloadfile);
exit;
?>
