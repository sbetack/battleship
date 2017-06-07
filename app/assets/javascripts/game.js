$(document).on('ready', function() {
  console.log("hey");
  $(document).on("click", ".overlay-box", function(){
    $(this).css("background-color", "yellow")
  });
}) 
