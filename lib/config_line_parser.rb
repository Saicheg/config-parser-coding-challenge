class ConfigLineParser
  def parse(line)
    name, value = split_name_and_value(line)
    value_parser = ConfigLineValueParserFactory.factory(value)
    value = value_parser.parse(value)
    [name, value]
  end

  def split_name_and_value(line)
    line.split('=', 2).map(&:strip)
  end
end
