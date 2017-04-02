<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Microarray Analysis">
    <meta name="author" content="Colin Gundlach, Jakob Hertzberg">
    <title>Microarray Analysis</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Microarray Analysis</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.html">File Upload</a></li>
            <li class="active"><a href="Download.html"> Download </a></li>
          </ul>
        </div>
      </div>
    </nav>


    </script>
    <div class="container">

      <div class="starter-template">
        <h1>Downloads </h1>
        <button type="button" class="btn btn-primary btn-lg">
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
      </button>
      </div>
    </div>





  </body>
</html>