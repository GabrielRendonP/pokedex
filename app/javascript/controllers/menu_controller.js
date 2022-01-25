import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["add"]

  close() {
    document.querySelector('.pokeball-icon').classList.remove('open')
    document.querySelector('.pokeball-icon').classList.toggle('close')
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

  openPoke(e) {
    document.querySelector('.pokeball-icon').classList.remove('close')
    document.querySelector('.pokeball-icon').classList.toggle('open')
  }
}