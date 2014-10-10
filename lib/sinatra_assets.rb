dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "sinatra_assets/generator"

unless defined?(Sass)
  require 'sass'
end

module SinatraAssets

  bourbon_path = File.expand_path("../../app/assets/stylesheets", __FILE__)
  ENV["SASS_PATH"] = [ENV["SASS_PATH"], bourbon_path].compact.join(File::PATH_SEPARATOR)

end