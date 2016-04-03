(function() {
  var message = "I got loaded!";
  document.addEventListener("DOMContentLoaded", function(event) {
  if (console) {
      console.log(message);
    } else {
      alert(message);
    }
  });
}());
