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
      Itamae.logger.warn('Invalid value in node attributes')
      next
    end

    execute "Install cask package: #{formula}" do
      command "brew install --cask #{options} #{formula}".gsub(/\s+/, ' ')
      not_if "brew list --cask #{name}"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support cask")
end
