import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".dateTime", {
    allowInput: true,
    dateFormat: "d-m-Y",
    minDate: "today"
  });
}
export { initFlatpickr };
