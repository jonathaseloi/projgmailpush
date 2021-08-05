const { environment } = require('@rails/webpacker')
const CopyPlugin = require('copy-webpack-plugin')

const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)

environment.plugins.prepend(
  'Copy',
  new CopyPlugin({
    patterns: [
      {
        context: './node_modules/tinymce/',
        from: '**/*.(min.js|min.css|woff)',
        to: './tinymce/[path][name].[ext]'
      }
    ]
  })
)

module.exports = environment
