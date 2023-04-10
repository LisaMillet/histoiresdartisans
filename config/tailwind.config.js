module.exports = {
  purge: ['./app/**/*.html.erb', './app/helpers/**/*.rb', './app/javascript/**/*.js'],
  darkMode: false, // ou 'media' ou 'class'
  theme: {
    extend: {
      padding: {
        '2': '0.5rem',
      },
      margin: {
        '8': '2rem',
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
