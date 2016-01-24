class ConfigGroupOverridePicker

  def pick(config, overrides)
    config.each do |group, values|
      values.each do |param, value|
        if value.is_a?(Hash)
          key = (value.keys & overrides).last || :default
          overrided_value = config[group][param][key]
          config[group][param] = overrided_value
        end
      end
    end
  end

end
