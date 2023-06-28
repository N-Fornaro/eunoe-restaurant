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
    disable: [
        function(date) {
            // return true to disable
            return date.getDay() === 1
        },
    ],
    // "locale": {
    //     "firstDayOfWeek": 1 // start week on Monday
    //   }
  });
};
export { initFlatpickr };
