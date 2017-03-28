<?php
if(isset($_GET['N']))
{
  $N = $_GET['N'];
 
  exec("Rscript ../r_script/imageplot.R $N");
}
?>
