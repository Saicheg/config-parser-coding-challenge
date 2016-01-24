require 'active_support/ordered_hash'

class ConfigLineMapper
  MULTIPLE_OPTIONS_REGEXP = /\A(\w+)\<(\w+)\>\z/

  def map(params)
    config, optional = map_single_params_and_filter_optional(params)
    config = join_optional(config, optional)

    config
  end

  def map_single_params_and_filter_optional(params)
    config = {}
    optional = []

    params.each do |name, value|
      if MULTIPLE_OPTIONS_REGEXP.match(name)
        optional << [name, value]
        next
      end
      config[name.to_sym] = value
    end

    [config, optional]
  end

  def join_optional(config, optional)
    grouped = optional.group_by { |name, _| name.match(MULTIPLE_OPTIONS_REGEXP)[1].to_sym }

    grouped.each do |original_name, data|
      raise ArgumentError, "No default value for #{original_name}" if config[original_name].nil?

      default = config[original_name]

      config[original_name] = ActiveSupport::OrderedHash.new
      config[original_name][:default] = default

      data.each do |name, value|
        option = name.match(MULTIPLE_OPTIONS_REGEXP)[2].to_sym
        config[original_name][option] = value
      end
    end

    config
  end
end
