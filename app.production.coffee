axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
css_pipeline = require 'css-pipeline'
#js_pipeline  = require 'js-pipeline'
browserify   = require 'roots-browserify'
babelify     = require 'babelify'
wordpress    = require 'roots-wordpress'
cmsEndpoint  = 'php-randytest2016.rhcloud.com'


module.exports =
  ignores: [
    'README.md', 
    'ROADMAP.md', 
    'LICENSE',
    'bower*', 
    'bower_components/**', 
    'views/partials/**', 
    '**/layout.*', 
    '**/_*', 
    '.gitignore', 
    'ship.*conf',
    '**/*.jpg_orig.jpg',
    '.DS_Store'
  ]

  extensions: [
    css_pipeline(files: 'assets/css/*.styl', minify: true, hash: true)
    #js_pipeline(files: 'assets/js/*.coffee', out: 'js/app.js', minify: true, hash: true)
    browserify
      files: 'assets/js/main.es6'
      sourceMap: false
      transform: babelify
      out: 'js/main.js'
    wordpress
      site: cmsEndpoint
      post_types:
        post: { template: 'views/single.jade' }
    
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
