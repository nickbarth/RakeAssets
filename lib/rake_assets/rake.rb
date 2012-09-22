require 'bundler'
Bundler.require

require 'rake_assets'

namespace :assets do
  desc 'compile assets'
  task :compile => [:check, :compile_js, :compile_css] do
  end

  desc 'check config'
  task :check do
    @rake_assets ||= RakeAssets.new
    @rake_assets.check
  end

  desc 'compile javascript'
  task :compile_js do
    @rake_assets ||= RakeAssets.new
    @rake_assets.compile_js
  end

  desc 'compile css'
  task :compile_css do
    @rake_assets ||= RakeAssets.new
    @rake_assets.compile_css
  end
end
