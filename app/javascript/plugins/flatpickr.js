import flatpickr from 'flatpickr';
import { French } from 'flatpickr/dist/l10n/fr.js';

const initFlatpickr = () => {
  flatpickr('.adminDateTime', {
    mode: 'range',
    allowInput: true,
    dateFormat: 'd-m-Y',
    locale: French,
    // minDate: "today"
  });

  flatpickr('.newDateTime', {
    allowInput: true,
    dateFormat: 'd-m-Y',
    locale: French,
    minDate: 'today',
  });
};
export { initFlatpickr };
