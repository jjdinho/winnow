import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "email", "password", "password_confirmation",
     "emailContainer", "passwordContainer", "keywordContainer",
     "frequencyContainer", "sourcesContainer" ]

  submitEmail() {
    console.log('here')
    const emailContainer = this.emailContainerTarget
    const passwordContainer = this.passwordContainerTarget
    console.log(emailContainer)
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

  get password() {
    return this.passwordTarget.value
  }

  get password_confirmation() {
    return this.password_confirmationTarget.value
  }
}
