if node[:platform] == 'darwin'
  (node['homebrew']['services'] || []).each do |service|
    execute "Start service: #{service}" do
      command "brew services start #{service}"
      not_if "brew services | grep '^#{service} ' | grep ' started '"
    end
  end
else
  msg = "#{node[:platform]} is not support service"
  if RUBY_ENGINE == 'mruby'
    MItamae.logger.info(msg)
  else
    Itamae.logger.info(msg)
  end
end
