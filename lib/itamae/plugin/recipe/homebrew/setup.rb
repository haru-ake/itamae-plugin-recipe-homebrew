unless node[:platform] == 'darwin'
  ['/home/linuxbrew', "#{ENV['HOME']}"].each do |path|
    ENV['PATH'] += ":#{path}/.linuxbrew/bin"
  end
end

ENV['CI'] = 'yes'

if node['brew']['enable_auto_update'].nil? || node['brew']['enable_auto_update']
  ENV['HOMEBREW_NO_AUTO_UPDATE'] = nil
  ENV['HOMEBREW_AUTO_UPDATE_SECS'] = 86400
else
  ENV['HOMEBREW_NO_AUTO_UPDATE'] = 1
end
