(node['brew']['add_repositories'] || []).each do |repo|
  execute "Add Repository: #{repo}" do
    command "brew tap #{repo}"
    not_if "brew tap | grep '^#{repo}$'"
  end
end
