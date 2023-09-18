import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-prospect"
export default class extends Controller {

  static targets = [
    'divForm',
    'downloadButton'
  ]

  connect() {
    console.log('hellooooooooooo')
  }

  toggleForm(event) {
    event.preventDefault()
    const btn = event.target

    this.divFormTargets.forEach(div => {
      if (div.dataset.id === btn.dataset.id) {
        btn.classList.add('hidden')
        div.classList.remove('hidden')
      } else {
        this.downloadButtonTargets.forEach(btnDL => {
          if (btnDL !== btn) btnDL.classList.remove('hidden')
        });
        div.classList.add('hidden')
      }
    });
  }
}
