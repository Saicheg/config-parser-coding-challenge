require 'recursive-open-struct'

class ConfigFileParser

  attr_reader :file_path, :overrides
  attr_accessor :group_splitter, :group_parser, :override_picker

  def initialize(file_path, overrides=[], group_splitter: ConfigGroupSplitter.new,
                                          group_parser: ConfigGroupParser.new,
                                          override_picker: ConfigGroupOverridePicker.new)

    raise ArgumentError, 'File does not exist' unless File.exist?(file_path)

    @file_path = file_path
    @overrides = overrides.map(&:to_sym)
    @group_splitter = group_splitter
    @group_parser = group_parser
    @override_picker = override_picker
  end

  def parse
    config = {}

    File.open(file_path, 'r') do |config_file|
      groups = group_splitter.split(config_file)
      groups.each { |name, data| config[name] = group_parser.parse(data) }
      config = override_picker.pick(config, overrides)
    end

    RecursiveOpenStruct.new(config)
  end
end
