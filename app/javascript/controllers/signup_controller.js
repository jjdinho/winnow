import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailContainer", "passwordContainer", "email",
    "keywordContainer", "frequencyContainer", "sourcesContainer",
    "progressBarOne", "progressBarTwo", "progressBarThree", "progressBarFour",
    "progressBarContainer" ]

  connect() {
    console.log('working')
  }

  submitEmail(e) {
    e.preventDefault();
    const emailContainer = this.emailContainerTarget;
    const passwordContainer = this.passwordContainerTarget;
    const progressBarOne = this.progressBarOneTarget;
    const progressBarContainer = this.progressBarContainerTarget;
    // fade animation
    this.fadeInElement(emailContainer);
    this.removeHideAndFadeInElement(passwordContainer);

    setTimeout(function(){
      progressBarContainer.style.opacity = "1";
      progressBarOne.style.width = "100%";
    }, 500);

    // end animation
    let input = document.querySelector("#inputPassword");
    this.listenForEnter(input);
  }

  submitPassword(e) {
    e.preventDefault();
    const progressBarTwo = this.progressBarTwoTarget;
    progressBarTwo.style.width = "100%";
    console.log('yolo');
  }

  submitKeyword(e) {
    e.preventDefault();
    const frequencyContainer = this.frequencyContainerTarget
    frequencyContainer.classList.remove('hide');
  }

  submitFrequency(e) {
    e.preventDefault();
    const sourcesContainer = this.sourcesContainerTarget
    sourcesContainer.classList.remove('hide');
  }

  submitSources() {

  }

  listenForEnter(input) {
    if (input === document.activeElement) {
      // Execute a function when the user releases a key on the keyboard
      input.addEventListener("keyup", function(event) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13) {
          // Trigger the button element with a click
          document.getElementById("submitPasswordBtn").click();
        }
      });
    }
  }
  // animations
  fadeInElement(element) {
    element.classList.add('animated', 'fadeOutRight');
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
