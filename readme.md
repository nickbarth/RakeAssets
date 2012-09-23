# RakeAssets
RakeAssets is a small Ruby Gem that contains some simple configurable Rake Tasks and dependancies for making compiling assets using Sprockets faster and easier.

# How To Use

Install the gem 

    gem install rake-assets

Add a require to your `Rakefile`

    require 'rake_assets/rake'

Now you will have some rake tasks to compress and minify your CSS and Javascript assets.

    rake -T

    rake assets:compile       # Compiles both CSS and Javascript
    rake assets:check         # Checks the configuration paths for RakeAssets are valid
    rake assets:compile_js    # Compiles Javascript files into a single minified Javascript file
    rake assets:compile_css   # Compiles CSS files into a single minified CSS file

To configure them just initialize a new instance of RakeAssets to override the default paths.

    @rake_assets = RakeAssets.new js_path:      'app/assets/scripts',                        # Location of application.js
                                  js_compiled:  "#{Dir.pwd}/public/scripts/application.js",  # Path to compile JS too
                                  css_path:     'app/assets/styles',                         # Path of application.css file
                                  css_compiled: "#{Dir.pwd}/public/css/style.css",           # Path to compile CSS too

### License
MIT &copy; 2012 Nick Barth
