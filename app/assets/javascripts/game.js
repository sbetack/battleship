$(document).ready(function() {
  console.log("ready")
  $(".block").on('click', function(e){
    debugger;
    e.preventDefault();
    e.stopPropagation();
    console.log("clicked!")
    $(this).css("color", "red")
  })
}) 
