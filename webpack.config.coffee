webpack = require('webpack')

module.exports = {
  devtool: 'eval-cheap-module-source-map'
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
}
