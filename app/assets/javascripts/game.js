$(document).on('ready', function() {
  console.log("hey");
  $(document).on("click", ".ship", function(){
    $(".ship").removeClass("active-ship")
    $(this).addClass("active-ship")
    var shipLength = $(this).attr('data-ship-length');
    $("#ship_length").val(shipLength)
    console.log($("#ship_length"))
  });
  // $(document).on("click", ".block", function(){
  //   console.log("clicked")
  //   var overlay = $(this).children()[0]
  //   console.log(overlay)
  //   $(overlay).addClass("active-spot")
  // })
}) 
