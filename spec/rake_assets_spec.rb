require 'spec_helper'

describe RakeAssets do
  before(:each) do
    @writer = double(:writer)
    @sprockets = Struct.new(:js_compressor, :css_compressor).new
    @options = {
      root:         'ROOT_PATH',
      js_path:      'JS_PATH',
      js_compiled:  'JS_COMPILED_PATH',
      css_path:     'CSS_PATH',
      css_compiled: 'CSS_COMPILED_PATH'
    }
  end

  context 'on javascript compile' do
    it 'it calls sprockets correctly' do
      @writer.should_receive(:write_to).with('JS_COMPILED_PATH')
      @sprockets.should_receive(:append_path).with('JS_PATH')
      @sprockets.should_receive(:find_asset).with('application').and_return(@writer)

      @options[:env] = @sprockets
      @rake_assets = RakeAssets.new @options

      @rake_assets.compile_js
    end
  end

  context 'on css compile' do
    it 'it calls sprockets correctly' do
      @writer.should_receive(:write_to).with('CSS_COMPILED_PATH')
      @sprockets.should_receive(:append_path).with('CSS_PATH')
      @sprockets.should_receive(:find_asset).with('application').and_return(@writer)

      @options[:env] = @sprockets
      @rake_assets = RakeAssets.new @options

      @rake_assets.compile_css
    end
  end

  context 'on path check' do 
    it 'succeeds on valid paths' do
      @options = {
        root:         '/',
        js_path:      '/',
        js_compiled:  '/',
        css_path:     '/',
        css_compiled: '/'
      }
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should_not raise_error
    end

    it 'fails on invalid root' do
      @options[:root] = 'INVALID_PATH'
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should raise_error
    end

    it 'fails on invalid JS Path' do
      @options[:js_path] = 'INVALID_PATH'
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should raise_error
    end

    it 'fails on invalid JS Compile Path' do
      @options[:js_compiled] = 'INVALID_PATH'
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should raise_error
    end

    it 'fails on invalid CSS Path' do
      @options[:css_path] = 'INVALID_PATH'
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should raise_error
    end

    it 'fails on invalid CSS Compile Path' do
      @options[:css_compiled] = 'INVALID_PATH'
      @rake_assets = RakeAssets.new @options
      lambda { @rake_assets.check }.should raise_error
    end
  end
end
