<?php 
if(date("H")<="12")
{
echo "Guten Morgen,";
}
elseif(date("H")>"12")
{
echo "Guten Mittag,";
}
elseif(date("H")>"18")
{
echo "Guten Abend,";
}
elseif(date("H")>"21")
{
echo "Gute Nacht,";
}
?>	
      
<?php
    echo $_GET['benutzername'];
?>	




 
<p>Heute ist der <?php
  echo date('d.m.Y \u\m H:i:s');
?> Uhr</p>




<br>











