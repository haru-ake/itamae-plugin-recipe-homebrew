if node[:platform] == 'darwin'
  (node['homebrew']['cask_packages'] || []).each do |app|
    case app
    when String
      formula = app
      options = ''
    when Hash
      formula = app['name']
      options = app['options'] || ''
    else
      raise("Unknown type: #{app.class}")
    end

    name = formula.split('/').last
    if name.nil? || name.empty?
      msg = "Invalid value in node attributes: #{formula}"
      if RUBY_ENGINE == 'mruby'
        MItamae.logger.warn(msg)
      else
        Itamae.logger.warn(msg)
      end

      next
    end

    execute "Install cask package: #{formula}" do
      command "brew install --cask #{options} #{formula}".gsub(/\s+/, ' ')
      not_if "brew list --cask #{name}"
    end
  end
else
  msg = "#{node[:platform]} is not support cask"
  if RUBY_ENGINE == 'mruby'
    MItamae.logger.info(msg)
  else
    Itamae.logger.info(msg)
  end
end
