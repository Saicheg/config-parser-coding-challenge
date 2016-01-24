class ConfigLinesFilter

  COMMENT_REGEXP = /;[\s\w]*\z/

  def filter(lines)
    lines.map { |line| remove_comment_and_strip(line) }.
          reject { |line| line.nil? || line == '' }
  end

  def remove_comment_and_strip(line)
    line.sub(COMMENT_REGEXP, '').strip
  end

end
