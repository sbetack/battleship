$(document).on('ready', function() {
  console.log("hey");
  $(document).on("click", ".ship", function(){
    $(".ship").removeClass("active")
    $(this).addClass("active")
    var shipLength = $(this).attr('data-ship-length');
    $("#ship_length").val(shipLength)
    console.log($("#ship_length"))
  });
}) 
