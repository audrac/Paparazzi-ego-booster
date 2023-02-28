import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["value"]

  connect() {
  }
  display(event) {
    this.valueTarget.innerText = event.currentTarget.value
  }
}
