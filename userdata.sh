#!/bin/bash

cd /home/ubuntu/
git clone https://github.com/hithesh24r/personal-cloud.git
mv /home/ubuntu/personal-cloud/* /home/ubuntu/
sudo rm -rf personal-cloud
chmod +x /home/ubuntu/script.sh
. script.sh
