class ConfigLineValueBooleanParser
  TRUE_VALUES = %w(yes true 1)
  FALSE_VALUES = %w(no false 0)

  BOOLEAN_VALUES = [TRUE_VALUES, FALSE_VALUES].flatten

  def parse(value)
    TRUE_VALUES.include?(value)
  end

end
