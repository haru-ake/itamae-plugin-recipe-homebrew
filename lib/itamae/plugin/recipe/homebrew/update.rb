if node['homebrew']['update']
  execute 'Update Homebrew' do
    command 'brew update'
  end
end
