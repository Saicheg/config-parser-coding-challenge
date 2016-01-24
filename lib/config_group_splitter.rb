class ConfigGroupSplitter

  GROUP_LINE_REGEXP = /\A\[(\w+)\]\s*\z/
  GROUP_NAME_REGEXP_INDEX = 1

  def initialize
    @current_group_name = nil
    @current_group_data = []
    @groups = {}
  end

  def split(file)
    while line = file.gets
      parse_line(line)
    end
    complete_current_group
    @groups
  end

  protected

  def parse_line(line)
    if new_group_defined?(line)
      complete_current_group unless no_group_in_progress?
      start_new_group_processing(line)
    else
      add_current_line_to_group_data(line)
    end
  end

  def new_group_defined?(line)
    !!GROUP_LINE_REGEXP.match(line)
  end

  def no_group_in_progress?
    @current_group_name.nil?
  end

  def complete_current_group
    @groups[@current_group_name.to_sym] = @current_group_data
  end

  def start_new_group_processing(line)
    name = GROUP_LINE_REGEXP.match(line)[GROUP_NAME_REGEXP_INDEX]
    @current_group_name = name
    @current_group_data = []
  end

  def add_current_line_to_group_data(line)
    @current_group_data << line
  end

end
