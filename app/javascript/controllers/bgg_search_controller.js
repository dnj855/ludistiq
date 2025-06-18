// app/javascript/controllers/bgg_search_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  timeout = null

  connect() {
    console.log("Stimulus 'bgg-search' a été connecté à :", this.element)
  }

  search(event) {
    console.log("Événement détecté :", event.type)

    clearTimeout(this.timeout)
    console.log("Timeout précédent annulé.")

    this.timeout = setTimeout(() => {
      console.log("300ms écoulées. Soumission du formulaire...")
      this.element.requestSubmit()
    }, 300)
  }
}