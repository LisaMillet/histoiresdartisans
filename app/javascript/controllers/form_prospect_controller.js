import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-prospect"
export default class extends Controller {

  static targets = [
    'divForm',
    'downloadButton',
    'form',
    'input',
    'buttonForm'
  ]

  bannedDomains = [
    // 'yopmail.com',
    // 'jokemail.com'
  ]
  emailRegexp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  validEmail = false

  connect() {
    console.log('Form Prospect Connected')
  }

  toggleForm(event) {
    event.preventDefault()
    const btn           = event.target
    const form          = this.formTargets.find(formProspect => formProspect.dataset.id === btn.dataset.id)
    this.activeFormID   = btn.dataset.id

    this.divFormTargets.forEach(div => {
      if (div.dataset.id === btn.dataset.id) {
        btn.classList.add('hidden')
        div.classList.remove('hidden')
      } else {
        this.downloadButtonTargets.forEach(btnDL => {
          if (btnDL !== btn) btnDL.classList.remove('hidden')
        });
        div.classList.add('hidden')
        form.reset()
        this.validEmail = false
      }
    });
  }

  verifyEmail(event) {
    const email         = event.target.value.trim()
    const [, domain]    = email.split('@')

    if (!this.bannedDomains.includes(domain) && this.emailRegexp.test(email) ) {
      this.validEmail = true
    } else {
      this.validEmail = false
    }
  }

  enableButton(event) {
    const inputs      = this.inputTargets.filter(input => input.dataset.id === this.activeFormID)
    const lastName    = inputs.find(input => input.id === 'prospect_last_name').value
    const firstName   = inputs.find(input => input.id === 'prospect_first_name').value
    const company     = inputs.find(input => input.id === 'prospect_company').value
    const btn         = this.buttonFormTargets.find(button => button.dataset.id = this.activeFormID)

    if (firstName && lastName && company && this.validEmail) {
      btn.disabled = false
    } else {
      btn.disabled = true
    }
  }
}
