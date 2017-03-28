<?php
if(isset($_GET['N']))
{
  $N = $_GET['N'];
 
  exec("Rscript imageplot.R $N");
}
?>
