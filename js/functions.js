var upload = function(files) {
  var formData = new FormData(),
    xhr = new XMLHttpRequest(),
    x;

  for (x = 0; x < files.length; x = x + 1) {
    formData.append("file[]", files[x]);
  }

  xhr.onload = function() {
    var uploaddata = this.responseText;

    if (uploaddata=="OK"){
    document.getElementById("dropzone").style.display = "none";
    document.getElementById("Options").style.display = "block";
    maketable();
  }
  }


  xhr.open("post", "./php_script/upload.php");
  xhr.send(formData);

}


function clickupload(evt) {
   var files = evt.target.files;
   upload(files);
}


function showDiv() {
  document.getElementById("checkboxes").style.display = "block";
}



function analyizeall() {
  saveinput();
  var analysis = new XMLHttpRequest();
  analysis.open("post", "php_script/Qualitycontrol.php");
  analysis.send("go");

  analysis.onload = function() {
    var analysisdata = this.responseText;

    document.getElementById("tabelle").style.display = "none";
    document.getElementById("Options").style.display = "none";
    document.getElementById("dropzone").style.display = "block";
  }
}

function analyizeplots() {
  saveinput();
  var analysis = new XMLHttpRequest();
  analysis.open("post", "php_script/justplots.php");
  analysis.send("go");

  analysis.onload = function() {
    var analysisdata = this.responseText;

    document.getElementById("tabelle").style.display = "none";
    document.getElementById("Options").style.display = "none";
    document.getElementById("dropzone").style.display = "block";
  }
}

function customize() {
  saveinput();
  saveinput2();
  var analysis = new XMLHttpRequest();
  analysis.open("post", "php_script/customize.php");
  analysis.send("go");

  analysis.onload = function() {
    var analysisdata = this.responseText;

    document.getElementById("tabelle").style.display = "none";
    document.getElementById("Options").style.display = "none";
    document.getElementById("dropzone").style.display = "block";
  }
}

function saveinput() {
 var input = document.getElementById("tabelle").getElementsByTagName('input');
 var vals = "";
 for (var i=0, n=input.length;i<n;i++)
 {
       vals += "\n"+input[i].checked;
 }
if (vals) vals = vals.substring(1);

$.ajax({
        type: "POST",
        url: "php_script/saveinput.php",
        data: {data : vals},
        cache: false,


    });

}

function saveinput2() {
 var input = document.getElementById("checkboxes").getElementsByTagName('input');
 console.log(input);
 var vals = "";
 for (var i=0, n=input.length;i<n;i++)
 {
       vals += "\n"+input[i].checked;
 }
if (vals) vals = vals.substring(1);

$.ajax({
        type: "POST",
        url: "php_script/saveinput2.php",
        data: {data : vals},
        cache: false,


    });

}

function maketable(){
var tabelle = document.getElementById('tabelle');
list = new XMLHttpRequest();

list.onload = function() {
  var data = this.responseText;
  data = JSON.parse(data);
  var arr = $.map(data, function(el) { return el });
  length =arr.length;

  var i;
          for(i=0;i<length;i++){
          temp = document.createElement("div");
          temp.className = 'row';
          tabelle.appendChild(temp);
          temp = document.createElement('div');
          temp.className = 'question';
          temp.innerHTML = arr[i];
          tabelle.appendChild(temp);
          temp = document.createElement('div');
          temp.className = 'switch';
          temp.innerHTML = '<input id="cmn-toggle-'+i.toString()+'" class="cmn-toggle cmn-toggle-yes-no" type="checkbox"> <label for="cmn-toggle-'+i.toString()+'" data-on="Group 2" data-off="Group 1"></label>';
          tabelle.appendChild(temp);
        }
}
          list.open("post","php_script/listdir.php");
          list.send("k");
        }
