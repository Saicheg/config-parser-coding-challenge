class ConfigLineValueStringParser
  WRAPPING_QUOTES_REGEXP=/(\A[\"\'])|[\"\']\z/

  def parse(value)
    value.gsub(WRAPPING_QUOTES_REGEXP, '').strip
  end

end
