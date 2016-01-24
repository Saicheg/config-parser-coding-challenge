class ConfigLineValueArrayParser
  ARRAY_REGEXP = /\A(.+\,)+.+\z/

  def parse(value)
    value.split(',').map(&:strip)
  end

end
