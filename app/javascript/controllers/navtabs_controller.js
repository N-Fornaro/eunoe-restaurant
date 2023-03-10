import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navtabs"
export default class extends Controller {
  static targets = ["tab1", "tab2", "lunch", "dinner"]

  connect() {
  }

  displayLunch() {
    this.tab1Target.classList.add("tab-active", "bg-red-pastel", "text-white")
    this.lunchTarget.classList.remove("hidden")

    this.tab2Target.classList.remove("tab-active", "bg-red-pastel", "text-white")
    this.dinnerTarget.classList.add("hidden")
  }

  displayDinner(){
    this.tab2Target.classList.add("tab-active", "bg-red-pastel", "text-white")
    this.dinnerTarget.classList.remove("hidden")

    this.tab1Target.classList.remove("tab-active", "bg-red-pastel", "text-white")
    this.lunchTarget.classList.add("hidden")
  }
}
