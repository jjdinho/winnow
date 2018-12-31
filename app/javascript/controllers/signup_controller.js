import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "emailContainer", "passwordContainer", "email",
    "keywordContainer", "frequencyContainer", "sourcesContainer" ]

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

  get email() {
    return this.emailTarget.value
  }
}
