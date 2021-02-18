(node['homebrew']['packages'] || []).each do |package|
  case package
  when String
    formula = package
    options = ''
  when Hash
    formula = package['name']
    options = package['options'] || ''
  else
    raise("Unknown type: #{package.class}")
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

  execute "Install package: #{formula}" do
    command "brew install #{options} #{formula}".gsub(/\s+/, ' ')
    not_if "brew list #{name}"
  end
end
