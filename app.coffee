axis           = require 'axis'
rupture        = require 'rupture'
autoprefixer   = require 'autoprefixer-stylus'
css_pipeline   = require 'css-pipeline'
browserify     = require 'roots-browserify'
babelify       = require 'babelify'
image_pipeline = require 'roots-image-pipeline'
cmsEndpoint    = ''


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
    css_pipeline(files: 'assets/css/*.styl')
    browserify
      files: 'assets/js/main.es6'
      sourceMap: true
      transform: babelify
      out: 'js/main.js'
    image_pipeline(files: "assets/img/**", out: 'img', compress: true)
    
  ]


  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  jade:
    pretty: true
