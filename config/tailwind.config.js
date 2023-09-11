const {colors: defaultTheme} = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    fontFamily: {
      monospace: ['Roboto Mono', 'monospace'],
      sans: ['Be Vietnam Pro', 'sans-serif'],
    },
    colors: {
    'dark-green': '#002428',
    'green': '#00594F',
    'dark-orange': '#963900',
    'orange': '#B94700',
    'beige': '#F2E7DD',
    'red' : '#F05252',
  },
  extend: {
    width: {
      '128': '32rem',
      '320': '40rem',
    },
    height: {
      '128': '32rem',
      '320': '40rem',
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')
  ],
},
}
