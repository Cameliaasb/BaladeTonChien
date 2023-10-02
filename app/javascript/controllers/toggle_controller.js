import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["filters", "filter"]
  connect() {
    console.log("Toggle controller")
  }

  boom() {
    this.filtersTarget.classList.toggle("bg-white");
    this.filterTargets.forEach (filter => filter.classList.toggle("d-none")) ;
  }
}
