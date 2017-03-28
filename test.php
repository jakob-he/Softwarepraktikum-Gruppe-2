<HTML>
   <HEAD>
      <TITLE>Testseite</TITLE>
	<FONT FACE="arial">
	<link rel="stylesheet" type="text/css" href="style.css" />
	<h1> File Upload </h1>
   </HEAD>
   <BODY>
      <P>
	 <?php
	 $t=time();
	 echo "Date: ";
	 echo(date("Y-m-d",$t));
	 echo("<br>");
	 echo "Time: " . date("h:i:s");
	 ?>
	
	
	<br>
	<br>
<form action="upload.php" method="post" enctype="multipart/form-data">
    Select .CEL file to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload .CEL file" name="submit">
</form>

	<br>
	<?php
	if ($handle = opendir('./uploads')) {
	echo "Uploaded Files:<br>";
    	while (false !== ($entry = readdir($handle))) {
        	if ($entry != "." && $entry != "..") {
            	echo "$entry<br>";
        	}
    	}
    	closedir($handle);
}
?>


<br>
<?php
echo "<form action='rtest.php' method='get'>";
echo "<b>Chipimage</b><br> .CEL file: <input type='text' name='N' />";
echo "<input type='submit' />";
echo "</form>";
?>
<br>

<!-- display Images
<?php
		$images = opendir("output/images");
		while($entryName = readdir($images)) {
			$dirArray[] = $entryName;
		}
		closedir($images);
		$indexCount	= count($dirArray);
		?>
		<ul>
			<?php
			for($index=0; $index < $indexCount; $index++) {
				$extension = substr($dirArray[$index], -3);
				if ($extension == 'png'){
					echo '<li><img src="output/images/' . $dirArray[$index] . '" alt="Image" /><span>' . $dirArray[$index] . '</span>';
				}	
			}
			?>
		</ul>
-->



	</FONT>
</main>
   </BODY>
</HTML>
