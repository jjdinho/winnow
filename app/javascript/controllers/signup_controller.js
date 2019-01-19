 import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailContainer", "passwordContainer", "email",
    "keywordContainer", "frequencyContainer", "sourcesContainer",
    "progressBarOne", "progressBarTwo", "progressBarThree", "progressBarFour",
    "progressBarContainer" ]

  connect() {
    console.log('working')
    const passwordInput = document.querySelector("#inputPassword");
    const keywordInput = document.querySelector("#inputKeyword");
    const dailyRadio = document.querySelector("#daily");
    const weeklyRadio = document.querySelector("#weekly");
    const monthlyRadio = document.querySelector("#monthly");


  }

  submitEmail(e) {
    e.preventDefault();
    const emailContainer = this.emailContainerTarget;
    const passwordContainer = this.passwordContainerTarget;
    const progressBarOne = this.progressBarOneTarget;
    const progressBarContainer = this.progressBarContainerTarget;
    let input = document.querySelector("#inputPassword");

    setTimeout(function(){
      input.focus();
    }, 1000);

    // fade animation
    this.fadeOutElement(emailContainer);
    this.removeHideAndFadeInElement(passwordContainer);

    setTimeout(function(){
      progressBarContainer.style.opacity = "1";
      progressBarOne.style.width = "100%";
    }, 500);

    // end animation
  }

  submitPassword(e) {
    e.preventDefault();
    const passwordContainer = this.passwordContainerTarget;
    const keywordContainer = this.keywordContainerTarget;
    const progressBarTwo = this.progressBarTwoTarget;
    let input = document.querySelector("#inputKeyword");
    let blurry = document.querySelector("#inputPassword");

    blurry.blur();

    setTimeout(function(){
      input.focus();
    }, 1000);

    // fade animation

    this.fadeOutElement(passwordContainer);
    this.removeHideAndFadeInElement(keywordContainer);

    setTimeout(function(){
      progressBarTwo.style.width = "100%";
    }, 500);

    // end animation
  }

  submitKeyword(e) {
    e.preventDefault();
    const keywordContainer = this.keywordContainerTarget;
    const frequencyContainer = this.frequencyContainerTarget;
    const progressBarThree = this.progressBarThreeTarget;
    let blurry = document.querySelector("#inputKeyword");
    // let input = document.querySelector("#inputKeyword");

    blurry.blur();

    // setTimeout(function(){
    //   input.focus();
    // }, 1000);

    // fade animation

    this.fadeOutElement(keywordContainer);
    this.removeHideAndFadeInElement(frequencyContainer);

    setTimeout(function(){
      progressBarThree.style.width = "100%";
    }, 500);

    // end animation
  }

  submitFrequency(e) {
    e.preventDefault();
    const frequencyContainer = this.frequencyContainerTarget;
    const sourcesContainer = this.sourcesContainerTarget;
    const progressBarFour = this.progressBarFourTarget;
    // let input = document.querySelector("#inputFrequency");

    // setTimeout(function(){

    //   input.focus();
    // }, 1000);

    // fade animation

    this.fadeOutElement(frequencyContainer);
    this.removeHideAndFadeInElement(sourcesContainer);

    setTimeout(function(){
      progressBarFour.style.width = "100%";
    }, 500);

    // end animation
  }

  submitSources() {

  }

  listenForEnter() {
    // Not working properly...
    const passwordInput = document.querySelector("#inputPassword");
    const keywordInput = document.querySelector("#inputKeyword");
    const dailyRadio = document.querySelector("#daily");
    const weeklyRadio = document.querySelector("#weekly");
    const monthlyRadio = document.querySelector("#monthly");

    document.addEventListener("keyup", function(event) {
      event.preventDefault();
      if (event.keyCode === 13) {
        if (passwordInput === document.activeElement) {
          document.getElementById("submitPasswordBtn").click();
        } else if (keywordInput === document.activeElement) {
          document.getElementById("submitKeywordBtn").click();
        } else if ((dailyRadio || weeklyRadio || monthly) === document.activeElement) {
          document.getElementById("submitFrequencyBtn").click();
        }
      }
    });

  }

  // animations
  fadeOutElement(element) {
    element.classList.add('animated', 'fadeOutRight');
    setTimeout(function(){
      element.classList.add('hide');
    }, 500);
  }

  removeHideAndFadeInElement(element) {
    setTimeout(function(){
      element.classList.remove("hide");
      element.classList.add('animated', 'fadeInLeft');
    }, 500);
  }

  get email() {
    return this.emailTarget.value
  }
}
