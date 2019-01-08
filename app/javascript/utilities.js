$(document).ready(function(){
  $(".js-toggle-button").click(function(){
    $(this).children(".toggle-area").slideToggle('ease-in-out');
  });
});
