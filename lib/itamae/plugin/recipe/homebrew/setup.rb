unless node[:platform] == 'darwin'
  ['/home/linuxbrew', "#{ENV['HOME']}"].each do |path|
    ENV['PATH'] += ":#{path}/.linuxbrew/bin"
  end
end

ENV['CI'] = 'yes'
