if node['homebrew']['upgrade']
  execute 'Upgrade Homebrew' do
    command 'brew upgrade'
  end
else
  Itamae.logger.info('Execution skipped Upgrade brew because of not true upgrade')
end
