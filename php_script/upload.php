<?php

$current="../uploads/current/";

if (!file_exists($current)) {
    mkdir($current, 0777, true);  //create current directory if it doesnt exist
}
  else {
    rename($current,"../uploads/".filemtime($current)); //rename current to date of last file change
    mkdir($current, 0777, true);  //create new current directory
}




if (!empty($_FILES["file"]["name"][0])) { //test if array is empty
  foreach($_FILES["file"]["name"] as $position => $name) { //upload each file
      (move_uploaded_file($_FILES["file"]["tmp_name"][$position], $current  . $name));
  }
}

echo "OK";
?>
