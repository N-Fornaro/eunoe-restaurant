/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  darkMode: 'class',
  theme: {
    safelist: [ 'animate-[fade-in-left_2s_ease-in-out]',
                'animate-[fade-in-right_2s_ease-in-out]',
                'animate-[fade-in-down_3s_ease-in-out]',
                'animate-[fade-in-up_3s_ease-in-out]'],
    extend: {
      colors: {
        'green-pastel': '#5e6737',
        'lightgreen-pastel': '#a5bea4',
        'red-pastel': '#904530',
        'pink-pastel': '#b9714f',
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
