import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["filters", "filter"]
  connect() {
  }

  // if you want to make the filter icon clickable just add a
  // data-action:click->toggle#display
  // add d-none to class if filter icon clickable in application_helper.rb
  display() {
    this.filtersTarget.classList.toggle("bg-white");
    this.filterTargets.forEach (filter => filter.classList.toggle("d-none")) ;
  }
}
