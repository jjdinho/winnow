// function booleanCheckWinnowRadiosAndChecks() {
//   $(".winnow-radio-btn").click(function(cible){
//     if($(cible.target).is(':checked')){
//       $(cible.target).siblings('.boolean-check').css({ opacity: 1 });
//     }
//     else {
//       $(cible.target).siblings('.boolean-check').css({ opacity: 0 });
//     }
//   });
// }

// Solve on first load

$(document).ready(function(){
  $(".js-toggle-button").click(function(){
    $(this).children(".toggle-area").slideToggle('ease-in-out');
  });

  // booleanCheckWinnowRadiosAndChecks();
});
