<?php
$oldldpath = getenv('LD_LIBRARY_PATH');
putenv("LD_LIBRARY_PATH=");
exec('bash -c "exec nohup setsid Rscript ../r_script/customize.R > /dev/null 2>&1 &"');
putenv("LD_LIBRARY_PATH=$oldldpath");
?>
