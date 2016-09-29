webpack = require('webpack')
CopyWebpackPlugin = require('copy-webpack-plugin')

prod = 'production' is process.env.NODE_ENV
entries = [
  {
    entry: './lib/index.coffee'
    resolve:
      root: ['lib']
      extensions: ['', '.js', '.coffee']
    output:
      path: 'dist/'
      filename: 'finity.js'
      library: 'finity'
      libraryTarget: 'umd'
    module:
      loaders: [
        { test: /\.coffee$/, loader: 'coffee-loader' }
      ]
    plugins: [
      new CopyWebpackPlugin([context: 'lib/locales', from: '*.js', to: '../locales/'])
    ]
  }
]

if prod
  entries.push({
    entry: './lib/index.coffee'
    resolve:
      root: ['lib']
      extensions: ['', '.js', '.coffee']
    output:
      path: 'dist/'
      filename: 'finity.min.js'
      library: 'finity'
      libraryTarget: 'umd'
    module:
      loaders: [
        { test: /\.coffee$/, loader: 'coffee-loader' }
      ]
    plugins: [
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.UglifyJsPlugin(minimize: true,  compress: warnings: false)
    ]
  })

module.exports = entries
