if node['homebrew']['upgrade']
  execute 'Upgrade Homebrew' do
    command 'brew upgrade'
  end
end
