class ConfigLineValueNumberParser
  NUMBER_REGEXP = /\A[[:digit:]]+\z/

  def parse(value)
    value.to_i
  end

end
