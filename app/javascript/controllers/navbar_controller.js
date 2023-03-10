import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['burger', 'button'];
  connect() {}

  burgerMenu(event) {
    if (event.currentTarget.id === 'burger-open') {
      this.burgerTarget.setAttribute('aria-expanded', 'true');
      event.currentTarget.id = 'burger-close';
      this.buttonTarget.innerHTML =
        "<svg xmlns='http://www.w3.org/2000/svg' class='w-5 h-5' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2'><path stroke-linecap='round' stroke-linejoin='round' d='M6 18L18 6M6 6l12 12'/></svg>";
    } else {
      this.burgerTarget.setAttribute('aria-expanded', 'false');
      event.currentTarget.id = 'burger-open';
      this.buttonTarget.innerHTML =
        "<svg xmlns='http://www.w3.org/2000/svg' class='w-5 h-5' fill='none' viewBox='0 0 24 24' stroke='currentColor' stroke-width='2'><path stroke-linecap='round' stroke-linejoin='round' d='M4 6h16M4 12h16M4 18h16'/></svg>";
    }
  }
}
