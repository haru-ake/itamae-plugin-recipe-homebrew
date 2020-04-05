(node['homebrew']['links'] || []).each do |app|
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

  execute "Link formula: #{formula}" do
    command "brew link #{options} #{formula}".gsub(/\s+/, ' ')
    not_if "brew link --dry-run #{formula} 2>&1 | grep ' Already linked'"
  end
end
