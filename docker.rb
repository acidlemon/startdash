if node[:platform] == "debian"  then
  package "apt-transport-https"
  package "ca-certificates"
  package "curl"
  package "gnupg2"
  package "software-properties-common"

  execute "install docker gpg key" do
    command "curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && add-apt-repository  \"deb [arch=amd64] https://download.docker.com/linux/debian \
$(lsb_release -cs) \
stable\" && apt-get update"
  end

  package "docker-ce"
  package "docker-ce-cli"
  package "containerd.io"
end

if node[:platform] == "ubuntu" then
   package "apt-transport-https"
  package "ca-certificates"
  package "curl"
  package "gnupg2"
  package "software-properties-common"

  execute "install docker gpg key" do
    command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && add-apt-repository  \"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable\" && apt-get update"
  end

  package "docker-ce"
  package "docker-ce-cli"
  package "containerd.io"
end