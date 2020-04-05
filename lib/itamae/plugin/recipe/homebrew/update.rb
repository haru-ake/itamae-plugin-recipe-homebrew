if node['homebrew']['update']
  execute 'Update Homebrew' do
    command 'brew update'
  end
else
  Itamae.logger.info('Execution skipped Update brew because of not true update')
end
