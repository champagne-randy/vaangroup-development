# Rodmap for icenetwork.org

This Doc lists ideas and next steps for the next releases of this project




### Next minor release

The tech debt list for version 0.1.x


#### Refactor Partials dir
* rename `views\partials` dir to `views\_partials`
* update all references in `views\index.jade`
* update `ingores` list in `app.coffee` and `app.production.coffee`


#### Refactor Single template
* rename `views\single.jade` to `views\_single.jade`
* update `roots-wordpress` extension configs in `app.coffee` and `app.production.coffee`
* update `ingores` list in `app.coffee` and `app.production.coffee`
* define reqs and design the template for single posts (may not be applicable for this project!)
* update `jade` template render each post according to design specs


#### Update JS and CSS pipelines
* this will output relative paths making it easier to reference main files in sub directories
* update `!= css()` to `!= css(/)`
* update `!= js()` to `!= js(/)`


#### Refactor Stylus files
* refactor css rules so they won't break upon concatenation
* update `css_pipeline` to concat all rules in one file


#### Hunt down and destroy the cursed black line
* find css rule that's adding a black border at the bottom of each section
* Note: It seems to be inconsistent (it's not always visible when I zoom). Is this a device/browser specific issue?






### Next major release

The tech debt list for version 1.x.x


#### Update Roots build recipe

* build a `.json` file that models the site-map (pages and copy)
* setup unit or end-to-end tests to verify that there are html files for each page sepcified in the '.json' specs
* create `.jade` templates and configure them to fetch copy for each page from site-map model
* add plugin to CMS to enable product owners to reset the site to the latest stable build.
* Note: this will essentially be a factory reset type thing


