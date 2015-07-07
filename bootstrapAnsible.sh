apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
echo "[local]" >> /etc/ansible/hosts
echo "127.0.0.1" >> /etc/ansible/hosts