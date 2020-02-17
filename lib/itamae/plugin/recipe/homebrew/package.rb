(node['brew']['install_packages'] || []).each do |package|
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
    Itamae.logger.warn('Invalid value in node attributes')
    next
  end

  execute "Install package: #{formula}" do
    command "brew install #{options} #{formula}".gsub(/\s+/, ' ')
    not_if "brew list #{name}"
  end
end
