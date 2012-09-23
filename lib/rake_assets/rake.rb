require 'bundler'
Bundler.require

require 'rake_assets'

namespace :assets do
  desc 'Compiles both CSS and Javascript'
  task :compile => [:check, :compile_js, :compile_css] do
  end

  desc 'Checks that the configuration paths are valid'
  task :check do
    @rake_assets ||= RakeAssets.new
    @rake_assets.check
  end

  desc 'Compiles Javascript files into a single minified Javascript file'
  task :compile_js do
    @rake_assets ||= RakeAssets.new
    @rake_assets.compile_js
  end

  desc 'Compiles CSS files into a single minified CSS file'
  task :compile_css do
    @rake_assets ||= RakeAssets.new
    @rake_assets.compile_css
  end
end
