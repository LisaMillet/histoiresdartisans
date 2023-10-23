import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-prospect"
export default class extends Controller {

  static targets      = [
    'divForm',
    'downloadButton',
    'form',
    'input',
    'buttonForm',
    'validMark',
    'invalidMark'
  ]

  bannedDomains       = [
    // 'yopmail.com',
    // 'jokemail.com'
  ]
  emailRegexp         = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  validEmail          = false


  connect() {
    console.log('Form Prospect Connected')
  }

  toggleForm(event) {
    event.preventDefault()
    const btn           = event.target
    const form          = this.formTargets.find(formProspect => formProspect.dataset.id === btn.dataset.id)
    this.activeFormID   = btn.dataset.id
    const btnForm       = this.buttonFormTargets.find(button => button.dataset.id === this.activeFormID)
    const validMark     = this.validMarkTargets.find(mark => mark.dataset.id === this.activeFormID)
    const invalidMark   = this.invalidMarkTargets.find(mark => mark.dataset.id === this.activeFormID)

    this.divFormTargets.forEach(div => {
      if (div.dataset.id === btn.dataset.id) {
        btn.classList.add('hidden')
        div.classList.remove('hidden')
      } else {
        this.downloadButtonTargets.forEach(btnDL => {
          if (btnDL !== btn) btnDL.classList.remove('hidden')
        });
        invalidMark.classList.add('hidden')
        validMark.classList.add('hidden')
        div.classList.add('hidden')
        this.validEmail   = false
        btnForm.disabled  = true
      }
    });
  }

  verifyEmail(event) {
    const email         = event.target.value.trim()
    const [, domain]    = email.split('@')
    const validMark     = this.validMarkTargets.find(mark => mark.dataset.id === this.activeFormID)
    const invalidMark   = this.invalidMarkTargets.find(mark => mark.dataset.id === this.activeFormID)

    if (!this.bannedDomains.includes(domain) && this.emailRegexp.test(email)) {
      invalidMark.classList.add('hidden')
      validMark.classList.remove('hidden')
      this.validEmail = true
    } else {
      validMark.classList.add('hidden')
      invalidMark.classList.remove('hidden')
      this.validEmail = false
    }
  }

  enableButton(event) {
    const inputs      = this.inputTargets.filter(input => input.dataset.id === this.activeFormID)
    const lastName    = inputs.find(input => input.id === 'prospect_last_name').value
    const firstName   = inputs.find(input => input.id === 'prospect_first_name').value
    const company     = inputs.find(input => input.id === 'prospect_company').value
    const btn         = this.buttonFormTargets.find(button => button.dataset.id === this.activeFormID)

    if (firstName && lastName && company && this.validEmail) {
      btn.disabled = false
    } else {
      btn.disabled = true
    }
  }

  fillInputsAfterSubmit() {
    const inputs      = this.inputTargets.filter(input => input.dataset.id === this.activeFormID)
    const email       = inputs.find(input => input.id === 'prospect_email').value
    const lastName    = inputs.find(input => input.id === 'prospect_last_name').value
    const firstName   = inputs.find(input => input.id === 'prospect_first_name').value
    const company     = inputs.find(input => input.id === 'prospect_company').value
    const position    = inputs.find(input => input.id === 'prospect_position').value
    const newsletter    = inputs.find(input => input.id === 'prospect_newsletter').checked

    const otherInputs = this.inputTargets.filter(input => input.dataset.id !== this.activeFormID)

    otherInputs.forEach(input => {
      if (input.id === 'prospect_email') {
        input.value = email
      } else if (input.id === 'prospect_last_name') {
        input.value = lastName
      } else if (input.id === 'prospect_first_name') {
        input.value = firstName
      } else if (input.id === 'prospect_company') {
        input.value = company
      } else if (input.id === 'prospect_position') {
        input.value = position
      } else if (input.id === 'prospect_newsletter') {
        input.checked = newsletter
      }
    })
  }
}
