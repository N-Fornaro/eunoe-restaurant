import flatpickr from 'flatpickr';
import { French } from 'flatpickr/dist/l10n/fr.js';

const initFlatpickr = () => {
  flatpickr('.dateTime', {
    allowInput: true,
    dateFormat: 'd-m-Y',
    locale: French,
    // minDate: "today"
  });
};
export { initFlatpickr };
