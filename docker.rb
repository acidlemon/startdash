if node[:platform] == "debian"  then
  package "apt-transport-https"
  package "ca-certificates"
  package "curl"
  package "gnupg2"
  package "software-properties-common"

  directory "/etc/apt/keyrings" do
    mode "0755"
  end

  execute "install docker gpg key" do
    command "curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && chmod a+r /etc/apt/keyrings/docker.gpg"
    not_if "test -f /etc/apt/keyrings/docker.gpg"
  end

  file "/etc/apt/sources.list.d/docker.list" do
    content "deb [arch=#{`dpkg --print-architecture | tr -d '\n'`} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian #{`lsb_release -cs | tr -d '\n'`} stable"
    mode "0644"
  end

  execute "apt update" do
    command "apt update"
  end

  package "docker-ce"
  package "docker-ce-cli"
  package "containerd.io"
  package "docker-buildx-plugin"
  package "docker-compose-plugin"
end

if node[:platform] == "ubuntu" then
  package "apt-transport-https"
  package "ca-certificates"
  package "curl"
  package "gnupg2"
  package "software-properties-common"

  directory "/etc/apt/keyrings" do
    mode "0755"
  end

  execute "install docker gpg key" do
    command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && chmod a+r /etc/apt/keyrings/docker.gpg"
    not_if "test -f /etc/apt/keyrings/docker.gpg"
  end

  file "/etc/apt/sources.list.d/docker.list" do
    content "deb [arch=#{`dpkg --print-architecture | tr -d '\n'`} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu #{`lsb_release -cs | tr -d '\n'`} stable"
    mode "0644"
  end

  execute "apt update" do
    command "apt update"
  end

  package "docker-ce"
  package "docker-ce-cli"
  package "containerd.io"
  package "docker-buildx-plugin"
  package "docker-compose-plugin"
end