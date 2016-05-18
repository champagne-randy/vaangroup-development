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
    'views/includes/**', 
    '**/layout.*', 
    '**/_*', 
    '.gitignore', 
    'ship.*conf',
    '**/*.jpg_orig.jpg',
    '.DS_Store'
  ]

  extensions: [
    css_pipeline(files: 'assets/css/*.styl', minify: true, hash: true)
    
    # temporarily replaced browserify with js_pipeline
    #browserify
    #  files: 'assets/js/main.es6'
    #  sourceMap: true
    #  transform: babelify
    #  out: 'js/main.js'
    js_pipeline(files: 'assets/js/**/*')

    # temporarily disabled image compression during development
    #image_pipeline(files: "assets/img/**", out: 'img', compress: true)
    #image_pipeline(files: "assets/img/**", out: 'img')
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
