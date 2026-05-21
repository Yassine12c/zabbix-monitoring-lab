ll
ls /
ls /
docker --version
docker compose version
docker run hello-world
mkdir zabbix && cd zabbix
nano docker-compose.yml
docker compose up -d
docker ps
ip a
sudo apt update
sudo apt upgrade -y
sudo apt update
docker --version
sudo apt update
docker --version
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
o gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
ls -la /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
inet a
net a
ip a
ip addr
ping 172-31-26-50
ping 172.31.26.50
hostname -I
curl ifconfig.me
curl ifconfig
curl ifconfig.me
sudo apt install zabbix-agent -y
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo apt install zabbix-agent -y
sudo nano /etc/zabbix/zabbix_agentd.conf
wget https://repo.zabbix.com/zabbix/7.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest_7.4+ubuntu24.04_all.deb
wget https://repo.zabbix.com/zabbix/7.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_latest_7.4+ubuntu24.04_all.deb
wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.4-1+ubuntu24.04_all.deb
sudo dpkg -i zabbix-release_7.4-1+ubuntu24.04_all.deb
sudo apt update
sudo apt install zabbix-agent -y
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
sudo ss -tulpn | grep 10050
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo ss -tulpn | grep 10050
sudo systemctl status zabbix-agent
zabbix_get -s 127.0.0.1 -p 10050 -k agent.ping
sudo apt install zabbix-get -y
zabbix_get -s 127.0.0.1 -p 10050 -k agent.ping
sudo grep -E "^(Server|ServerActive|Hostname)[^a-z]" /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
sudo grep -E "^(Server|ServerActive|Hostname)[^a-z]" /etc/zabbix/zabbix_agentd.conf
sudo ss -tulpn | grep 10050
sudo ufw status
sudo iptables -L INPUT -n | grep 10050
curl -v telnet://127.0.0.1:10050
sudo tail -50 /var/log/zabbix/zabbix_server.log
sudo systemctl status zabbix-server
ssh ubuntu@13.220.182.244
docker ps
docker network inspect bridge | grep Gateway
ip route | grep docker0
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo grep -n "^Server" /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/^Server=127.0.0.1/Server=127.0.0.1,172.17.0.1/' /etc/zabbix/zabbix_agentd.conf
sudo nano /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-server
sudo systemctl status zabbix-agent
docker exec zabbix-zabbix-server-1 sh -c "nc -zv 172.17.0.1 10050"
sudo grep -n "^Server=" /etc/zabbix/zabbix_agentd.conf
sudo sed -i 's/^Server=127.0.0.1$/Server=127.0.0.1,172.17.0.1/' /etc/zabbix/zabbix_agentd.conf
sudo grep -n "^Server=" /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
docker exec zabbix-zabbix-server-1 sh -c "nc -zv 172.17.0.1 10050"
sudo tail -f /var/log/zabbix/zabbix_agentd.log
sudo sed -i 's/^Server=127.0.0.1,172.17.0.1/Server=127.0.0.1,172.17.0.1,172.18.0.2/' /etc/zabbix/zabbix_agentd.conf
sudo grep "^Server=" /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl status zabbix-agent
docker logs zabbix-zabbix-server-1 --tail 50
docker inspect zabbix-zabbix-server-1 | grep IPAddress
docker network ls
docker network inspect zabbix_default | grep -A 10 "Containers"
cat docker-compose.yml
find / -name "docker-compose.yml" 2>/dev/null
cat /home/ubuntu/zabbix/docker-compose.yml
nano /home/ubuntu/zabbix/docker-compose.yml
cd /home/ubuntu/zabbix
docker compose down
docker compose up -d
docker network rm zabbix_default
docker compose up -d
docker inspect zabbix-zabbix-server-1 | grep IPAddress
docker ps
hydra -l Administrator -P /tmp/passwords.txt rdp://172.31.21.206 -V -f
docker logs zabbix-zabbix-server-1 --tail 30
sudo nano /etc/ssh/sshd_config
sudo systemctl restart ssh
ubuntu@ip-172-31-26-50:~$ hydra -l ubuntu -P ~/passwords.txt ssh://172.31.16.197
Hydra v9.6 (c) 2023 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).
Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2026-05-20 09:25:58
[WARNING] Many SSH configurations limit the number of parallel tasks, it is recommended to reduce the tasks: use -t 4
[DATA] max 10 tasks per 1 server, overall 10 tasks, 10 login tries (l:1/p:10), ~1 try per task
[DATA] attacking ssh://172.31.16.197:22/
[ERROR] target ssh://172.31.16.197:22/ does not support password authentication (method reply 4).
ubuntu@ip-172-31-26-50:~$
sudo tail -f /var/log/auth.log
sudo nano /etc/ssh/sshd_config
sudo systemctl restart ssh
sudo tail -f /var/log/auth.log
ubuntu@ip-172-31-26-50:~$
ls .var
ls /var
ls /var/log
ls /var/log/auth.log
ls -l /var/log/auth.log
sudo chmod 644 /var/log/auth.log
ls -l /var/log/auth.log
sudo usermod -aG adm zabbix
sudo systemctl restart zabbix-agent
sudo -u zabbix cat /var/log/auth.log
grep ServerActive /etc/zabbix/zabbix_agentd.conf
sudo tail -f /var/log/auth.log
