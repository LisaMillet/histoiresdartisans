const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    fontFamily: {
      monospace: ['Be Vietnam Pro', 'sans-serif'],
      sans: ['Roboto Mono', 'monospace'],
    },

    colors: {
      'dark-green': '#002428',
      'green': '#00594F',
      'dark-orange': '#963900',
      'orange': '#B94700',
      'beige': '#F2E7DD',
    },

    extend: {
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
