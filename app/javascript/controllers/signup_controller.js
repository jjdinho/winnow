import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailContainer", "passwordContainer", "email" ]

  connect() {
    console.log('working')
  }

  submitEmail(e) {
    e.preventDefault();
    const emailContainer = this.emailContainerTarget
    const passwordContainer = this.passwordContainerTarget
    emailContainer.classList.add("hide");
    passwordContainer.classList.remove("hide");
  }

  submitPassword() {

  }

  submitKeyword() {

  }

  submitFrequency() {

  }

  submitSources() {

  }

  get email() {
    return this.emailTarget.value
  }
}
