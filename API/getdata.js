//syntax: $.getJSON(url, [data],[callback]);
//AJAX library
const uid = document.getElementById("userid");
const b1 = document.getElementById("b1");
const b2 = document.getElementById("b2");

function getFromServer(e) {
  e.preventDefault(); //prevent browser refresh
  $.getJSON("https://14a7a497-2769-4605-847f-f93b67228ba9.mock.pstmn.io/users/all", mydata);
}

function mydata(data) {
  var html_code = "<ul>";
  data.forEach(element => {
    html_code += "<li>" + element.user_id + " " + element.first_name
  });  
  html_code += "</ul>";
  $(".mypanel").html(html_code);
}

b1.addEventListener("click", getFromServer);
