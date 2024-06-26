#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install wget -y

# removing the applications if they are previously installed
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

cd /home/ubuntu/
mkdir /home/ubuntu/photoprism
wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.deb
sudo apt-get install ./mount-s3.deb
mount-s3 --cache personal-cloud-hithesh24r /home/ubuntu/photoprism/

docker compose -f nginx.yaml up -d
docker compose -f photoprism.yaml up -d
