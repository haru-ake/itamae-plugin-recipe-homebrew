enable_update = node['brew']['enable_update'] ? node['brew']['enable_update'] : false
if enable_update
  execute 'Update Homebrew' do
    command 'brew update'
  end
else
  Itamae.logger.info('Execution skipped Update brew because of not true enable_update')
end
