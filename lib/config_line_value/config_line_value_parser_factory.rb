class ConfigLineValueParserFactory

  class << self
    def factory(value)
      if ConfigLineValueBooleanParser::BOOLEAN_VALUES.include?(value)
        boolean_parser
      elsif ConfigLineValueStringParser::WRAPPING_QUOTES_REGEXP.match(value)
        string_parser
      elsif ConfigLineValueNumberParser::NUMBER_REGEXP.match(value)
        number_parser
      elsif ConfigLineValueArrayParser::ARRAY_REGEXP.match(value)
        array_parser
      else
        string_parser
      end
    end

    def boolean_parser
      @boolean_parser ||= ConfigLineValueBooleanParser.new
    end

    def string_parser
      @string_parser ||= ConfigLineValueStringParser.new
    end

    def number_parser
      @number_parser ||= ConfigLineValueNumberParser.new
    end

    def array_parser
      @array_parser ||= ConfigLineValueArrayParser.new
    end
  end

end
