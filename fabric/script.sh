sudo apt-get update
sudo apt-get install -y wget curl git
wget -qO- https://get.docker.com/ | sh
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
