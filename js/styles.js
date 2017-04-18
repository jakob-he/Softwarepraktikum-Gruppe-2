function showDiv() {
  document.getElementById("checkboxes").style.display = "block";
}



function analyizeall() {
  var analysis = new XMLHttpRequest();
  analysis.open("post", "php_script/Qualitycontrol.php");
  analysis.send("go");

  analysis.onload = function() {
    var analysisdata = this.responseText;

    document.getElementById('dropzone').innerHTML = "<b>Analysis running..<b>";
  }
}

function analyizeplots() {
  var analysis = new XMLHttpRequest();
  analysis.open("post", "php_script/justplots.php");
  analysis.send("go");

  analysis.onload = function() {
    var analysisdata = this.responseText;

    document.getElementById('dropzone').innerHTML = "<b>Analysis running..<b>";
  }
}
