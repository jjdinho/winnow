function fadeOut_alert() {
    if($(".alert").length) {
        setTimeout(function() {
            $(".alert").fadeOut();
        }, 2000)
    }
}

document.addEventListener("DOMContentLoaded",function(){
  fadeOut_alert();
});
