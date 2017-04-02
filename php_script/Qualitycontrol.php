<?php
set_time_limit(500);
exec("Rscript ../r_script/Qualitycontro.R");
echo("OK");
?>
