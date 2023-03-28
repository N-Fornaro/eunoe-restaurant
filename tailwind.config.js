/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'green-pastel': '#5e6738',
        'lightgreen-pastel': '#a8baa2',
        'red-pastel': '#9c5741',
        'pink-pastel': '#b97456',
      },
      fontFamily: {
        sans: ['Roboto', 'sans-serif'],
        body: ['Roboto', 'sans-serif'],
        mono: ['ui-monospace', 'monospace'],
      },
    },
  },
  corePlugins: {
    preflight: false,
  },
  plugins: [require('@tailwindcss/forms')],
};
