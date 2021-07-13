module.exports = {
  theme: {
    fontFamily: {
      body: ['Metropolis'],
      mono: ['ui-monospace', 'SFMono-Regular', 'Menlo', 'Monaco', 'Consolas', "Liberation Mono", "Courier New", 'monospace']
    },
    extend: {
      colors: {
        spina: {
          light: '#ff583c',
          DEFAULT: '#ff3a1e',
          dark: '#e11c00'
        }
      }
    }
  },
  variants: {
    boxShadow: ['active'],
    extend: {
      backgroundColor: ['even', 'checked']
    }
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms')
  ]
}
