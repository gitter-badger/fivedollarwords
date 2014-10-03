# See webpack.config.js for more examples:
# https://github.com/webpack/webpack-with-common-libs/blob/master/webpack.config.js

path = require 'path'
webpack = require 'webpack'

resolveBowerPath = (componentPath) ->
  path.join __dirname, "bower_components", componentPath

# webpack-dev-server options used in gulpfile
# https://github.com/webpack/webpack-dev-server

module.exports =

  contentBase: "#{__dirname}/src/"

  cache: true

  entry:
    app: './src/js/app'
    head: './src/js/head'

  output:
    path: path.join(__dirname, 'dist')
    publicPath: 'dist/'
    filename: '[name].js'
    chunkFilename: '[chunkhash].js'

  resolve:
    alias:
      app: path.join(__dirname, "app/app.js")
      # jquery: resolveBowerPath("/jquery/dist/jquery.js")
      backbone: resolveBowerPath("/backbone/backbone.js")
      "backbone.babysitter": resolveBowerPath("/backbone.babysitter/lib/backbone.babysitter.js")
      "backbone.wreqr": resolveBowerPath("/backbone.wreqr/lib/backbone.wreqr.js")
      fastclick: resolveBowerPath("/fastclick/lib/fastclick.js")
      marionette: resolveBowerPath("/marionette/lib/core/backbone.marionette.js")
      underscore: resolveBowerPath("/underscore/underscore.js")
    #   # "backbone.routefilter": resolveBowerPath("backbone.routeFilter/dist/backbone.routefilter.js")
    #   # "backbone.validation": resolveBowerPath("backbone.validation/dist/backbone-validation-amd.js")
    #   # "backbone.syphon": resolveBowerPath("backbone.syphon/lib/amd/backbone.syphon.js")
    #   # parse: path.join(__dirname, "public/javascripts/vendor/parse-1.2.17.js")

    extensions: ['', '.webpack.js', '.web.js', '.coffee', '.js', '.scss', '.sass']
    modulesDirectories: ['src', 'src/js', 'web_modules', 'bower_components', 'node_modules']

  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
      {
        test: /\.scss$/,
        loader: "style-loader!sass-loader?outputStyle=expanded&includePaths[]=./bower_components/foundation/scss/"
      }
      {
        test: /\.sass$/,
        loader: "style-loader!sass-loader?outputStyle=expanded&includePaths[]=./bower_components/foundation/scss/"
      }
      {
        # required to write 'require('./style.css')'
        test: /\.css$/
        loader: 'style-loader!css-loader'
      }
      # {
      #   test: /\.woff$/
      #   loader: 'url-loader?prefix=font/&limit=5000&minetype=application/font-woff'
      # }
      # {
      #   test: /\.ttf$/
      #   loader: 'file-loader?prefix=font/'
      # }
      # {
      #   test: /\.eot$/
      #   loader: 'file-loader?prefix=font/'
      # }
      # {
      #   test: /\.svg$/
      #   loader: 'file-loader?prefix=font/'
      # }
    ]

  plugins: [
    new webpack.HotModuleReplacementPlugin()
  ]
