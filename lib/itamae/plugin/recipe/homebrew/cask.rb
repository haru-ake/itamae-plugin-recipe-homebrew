if node[:platform] == 'darwin'
  (node['brew']['install_apps'] || []).each do |app|
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

    execute "Install application: #{formula}" do
      command "brew cask install #{options} #{formula}".gsub(/\s+/, ' ')
      not_if "brew cask list #{name}"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support cask")
end
