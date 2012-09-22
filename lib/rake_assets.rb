require 'rake_assets/version'

require 'sprockets'
require 'uglifier'
require 'yui/compressor'

class RakeAssets
  def initialize(settings = {})
    @settings = {
      env:          Sprockets::Environment.new(File.dirname(__FILE__)) { |env| env.logger = Logger.new(STDOUT) },
      root:         File.dirname(__FILE__),
      js_path:      'app/assets/scripts',
      js_compiled:  File.dirname(__FILE__) + '/public/scripts/application.js',
      css_path:     'app/assets/styles',
      css_compiled: File.dirname(__FILE__) + '/public/css/style.css',
      # Uglifier Config - https://github.com/lautis/uglifier
      uglifier:     { mangle: true }, 
      # Ruby-YUI Compressor Config - https://github.com/sstephenson/ruby-yui-compressor
      yuicomp:      {} 
    }.merge(settings)
  end

  def check
    unless File.directory? @settings[:root]
      raise "Root path (#{@settings[:root]}) was not found."
    end

    unless File.directory? File.join(@settings[:root], @settings[:js_path])
      raise "Javascript path (#{@settings[:css_path]}) was not found."
    end

    unless File.directory? File.dirname(@settings[:js_compiled])
      raise "Javascript compiled path (#{File.dirname @settings[:js_compiled]}) was not found."
    end

    unless File.directory? File.join(@settings[:root], @settings[:css_path])
      raise "Style path (#{@settings[:css_path]}) was not found."
    end

    unless File.directory? File.dirname(@settings[:css_compiled])
      raise "Style compiled path (#{File.dirname @settings[:css_compiled]}) was not found."
    end
  end
  
  def compile_js
    @settings[:env].js_compressor = Uglifier.new(@settings[:uglifier])
    @settings[:env].append_path(@settings[:js_path])
    @settings[:env].find_asset('application').write_to(@settings[:js_compiled])
  end

  def compile_css
    @settings[:env].css_compressor = YUI::CssCompressor.new(@settings[:yuicomp])
    @settings[:env].append_path(@settings[:css_path])
    @settings[:env].find_asset('application').write_to(@settings[:css_compiled])
  end
end