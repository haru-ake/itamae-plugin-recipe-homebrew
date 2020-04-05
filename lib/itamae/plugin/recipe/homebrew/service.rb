if node[:platform] == 'darwin'
  (node['homebrew']['services'] || []).each do |service|
    execute "Start service: #{service}" do
      command "brew services start #{service}"
      not_if "brew services | grep '^#{service} ' | grep ' started '"
    end
  end
else
  Itamae.logger.info("#{node[:platform]} is not support service")
end
