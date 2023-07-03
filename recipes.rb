if node[:use_docker] then
  include_recipe 'docker.rb'
end
include_recipe 'users.rb'
