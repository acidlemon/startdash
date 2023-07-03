node[:users].each do |username|
  additional_group = ["sudo"]
  if node[:use_docker] then
    additional_group.push("docker")
  end
  
  user "create user #{username}" do
    username username
    shell "/bin/bash"
    create_home true
  end
  
  additional_group.each do |group|
    execute "add #{group}" do
      only_if "id #{username}"
      not_if "getent group #{group} | grep #{username}"
      command "usermod #{username} -aG #{group}"
    end
  end
  
  if node[:platform] == "darwin" then
    homedir = "/Users/#{username}"
  else
    homedir = "/home/#{username}"
  end
  
  directory "#{homedir}" do
    mode "0755"
    owner username
    group username
  end
  directory "#{homedir}/.ssh" do
    mode "0700"
    owner username
    group username
  end
  
  http_request "#{homedir}/.ssh/authorized_keys" do
    url "https://github.com/#{username}.keys"
    path "#{homedir}/.ssh/authorized_keys"
    owner username
    mode "0600"
  end
  
end



