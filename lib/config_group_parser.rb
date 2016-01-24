class ConfigGroupParser
  def initialize(lines_filter: ConfigLinesFilter.new, line_parser: ConfigLineParser.new, line_mapper: ConfigLineMapper.new)
    @lines_filter = lines_filter
    @line_parser = line_parser
    @line_mapper = line_mapper
  end

  def parse(lines)
    # Converts each line to array of name + value
    lines = @lines_filter.filter(lines)
    # Parses each value according it's format
    params = lines.map { |line| @line_parser.parse(line) }
    # Maps multiple options to hash like { path: { default: '123', ubuntu: '123' }
    config = @line_mapper.map(params)

    config
  end
end
