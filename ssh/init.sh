#!/usr/bin/env/bash 


python3 -m venv venv 
source venv/bin/activate
pip install --upgrade kalm

export VAULT_TOKEN="1password"
export VAULT_FORMAT=json
export VAULT_ADDR=https://vault.openknowit.com

sudo apt update && sudo apt install gpg
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install -y vault


kalm vault signssh


