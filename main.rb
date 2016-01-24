files = Dir[File.expand_path('./../../lib/**/*.rb', __FILE__)].each { |f| require(f) }

def load_config(file_path, overrides=[])
  ConfigFileParser.new(file_path, overrides).parse
end
