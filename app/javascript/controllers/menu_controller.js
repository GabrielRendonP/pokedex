import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["add"]

  close() {
    document.querySelector('.modal-section').remove()
    this.element.remove()
    this.modalTurboFrame.src = null
  }
  
  escClose(event) {
    if (event.key === 'Escape') this.close()
  }

  get modalTurboFrame() {
    return document.querySelector("turbo-frame[id='modal']")
  }

  pickIcon(e) {
    console.log('helohelo')
  }
}