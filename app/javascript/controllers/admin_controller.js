import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="admin"
export default class extends Controller {
  static targets = ['tab'];
  connect() {}

  tabs(event) {
    event.preventDefault();
    const activeLinkClasses = [
      'inline-flex',
      'p-4',
      'text-blue-600',
      'border-b-2',
      'border-blue-600',
      'rounded-t-lg',
      'active',
      'dark:text-blue-500',
      'dark:border-blue-500',
      'group',
    ];
    const inactiveLinkClasses = [
      'inline-flex',
      'p-4',
      'border-b-2',
      'border-transparent',
      'rounded-t-lg',
      'hover:text-gray-600',
      'hover:border-gray-300',
      'dark:hover:text-gray-300',
      'group',
    ];
    const activeSvgClasses = ['text-blue-600', 'dark:text-blue-500'];
    const inactiveSvgClasses = [
      'text-gray-400',
      'group-hover:text-gray-500',
      'dark:text-gray-500',
      'dark:group-hover:text-gray-300',
    ];

    this.tabTargets.forEach((tab) => {
      tab.querySelector('a').classList.remove(...activeLinkClasses);
      tab.querySelector('a').classList.add(...inactiveLinkClasses);
      tab.querySelector('svg').classList.remove(...activeSvgClasses);
      tab.querySelector('svg').classList.add(...inactiveSvgClasses);
    });

    event.currentTarget
      .querySelector('a')
      .classList.remove(...inactiveLinkClasses);
    event.currentTarget.querySelector('a').classList.add(...activeLinkClasses);
    event.currentTarget
      .querySelector('svg')
      .classList.remove(...inactiveSvgClasses);
    event.currentTarget.querySelector('svg').classList.add(...activeSvgClasses);

    this.tabTargets.forEach((tab) => {
      document
        .querySelector(`#active-${tab.id}`)
        .classList.replace('block', 'hidden');
    });

    const currentTab = event.currentTarget.id;
    document
      .querySelector(`#active-${currentTab}`)
      .classList.replace('hidden', 'block');
  }
}
