import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-removal"
export default class extends Controller {
  connect() {
  }

  remove() {
    this.element.remove()
  }
}
