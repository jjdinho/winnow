 import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailContainer", "formContainer", "email",
    "progressBar" ]

  connect() {
    console.log('working')
    const progressBar = this.progressBarTarget
    if (progressBar) {
      setTimeout(function(){
        progressBar.style.width = "100%";
      }, 250);
    }
  }

  submitEmail(e) {
    e.preventDefault();
    const formContainer = this.formContainerTarget;
    const nav = document.querySelector(".nav-container")


    // fade animation
    this.fadeOutRightElement(formContainer);
    this.fadeOutUpElement(nav);

    // end animation
    setTimeout(function(){
      window.location = 'home_2'
    }, 500);
  }

  submitPassword(e) {
    e.preventDefault();
    const formContainer = this.formContainerTarget;


    // fade animation
    this.fadeOutRightElement(formContainer);

    // setTimeout(function(){
    //   progressBarContainer.style.opacity = "1";
    //   progressBarOne.style.width = "100%";
    // }, 500);

    // end animation
    setTimeout(function(){
      window.location = 'home_3'
    }, 500);
  }

  submitKeyword(e) {
    e.preventDefault();
    const formContainer = this.formContainerTarget;


    // fade animation
    this.fadeOutRightElement(formContainer);

    // setTimeout(function(){
    //   progressBarContainer.style.opacity = "1";
    //   progressBarOne.style.width = "100%";
    // }, 500);

    // end animation
    setTimeout(function(){
      window.location = 'home_4'
    }, 500);
  }

  submitFrequency(e) {
    e.preventDefault();
    const formContainer = this.formContainerTarget;


    // fade animation
    this.fadeOutRightElement(formContainer);

    // setTimeout(function(){
    //   progressBarContainer.style.opacity = "1";
    //   progressBarOne.style.width = "100%";
    // }, 500);

    // end animation
    setTimeout(function(){
      window.location = 'home_5'
    }, 500);
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
  fadeOutRightElement(element) {
    element.classList.add('animated', 'fadeOutRight');
    setTimeout(function(){
      element.classList.add('hide');
    }, 500);
  }

  fadeOutUpElement(element) {
    element.classList.add('animated', 'fadeOutUp');
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
