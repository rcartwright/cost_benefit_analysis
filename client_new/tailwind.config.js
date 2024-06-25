/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'success-light': '#C5E1A5',
        'danger-light': '#FFCDD2',
        'success-dark': '#28602B',
        'danger-dark': '#CC2020',
      },
    },
  },
  plugins: [],
}

