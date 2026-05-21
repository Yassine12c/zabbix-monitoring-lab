# 🛡️ Zabbix Monitoring Lab — Détection d'attaque Brute Force

> Projet de monitoring réseau avec Zabbix 7.4, Docker, et détection d'attaques Brute Force RDP sur Windows.

---

## 📋 Description

Ce projet met en place un environnement de monitoring complet avec :
- **Zabbix Server** déployé via Docker
- **Agent Zabbix** sur Linux et Windows
- **Détection d'attaque Brute Force** via les logs de sécurité Windows (Event ID 4625)
- **Alertes email** via Gmail

---

## 🏗️ Architecture
AWS EC2 — Zabbix Server (172.31.16.197)
│
├── Zabbix Agent (host) → port 10050
│
└── Docker (172.18.0.0/16)
├── zabbix-server  172.18.0.2  → port 10051
├── zabbix-web     172.18.0.3  → port 8080
└── zabbix-db      172.18.0.4  → PostgreSQL 5432
Clients monitorés:
├── Linux-Client   172.31.26.50   ✅ Agent Zabbix
└── Windows-client 172.31.21.206  ✅ Agent Zabbix (actif)

---

## ⚙️ Installation

### Étape 1 — Déploiement Zabbix avec Docker

```bash
mkdir ~/zabbix && cd ~/zabbix
docker compose up -d
docker ps
```

### Étape 2 — Configuration Agent Linux

```bash
sudo nano /etc/zabbix/zabbix_agentd.conf
```

```ini
Server=127.0.0.1,172.17.0.1,172.18.0.2
ServerActive=127.0.0.1
Hostname=Zabbix server
```

```bash
sudo systemctl restart zabbix-agent
```

### Étape 3 — Dashboard Zabbix
Data collection → Hosts → Zabbix server → Interfaces
127.0.0.1  →  172.17.0.1
Port: 10050

### Étape 4 — Configuration Agent Windows

```ini
LogFile=C:\Program Files\Zabbix Agent\zabbix_agentd.log
Server=172.31.16.197
ServerActive=172.31.16.197
Hostname=Windows-client
Include=C:\Program Files\Zabbix Agent\zabbix_agentd.d\
```

```powershell
Restart-Service "Zabbix Agent"
```

### Étape 5 — AWS Security Group
Port 10051 ouvert → 0.0.0.0/0

---

## 🔴 Scénario d'attaque Brute Force

### Étape 1 — Créer l'item sur Windows-client
Data collection → Hosts → Windows-client → Items → Create item
Name:     Windows Security Failed Logins
Type:     Zabbix agent (active)
Key:      eventlog[Security,,,,4625]
Interval: 30s

### Étape 2 — Créer le Trigger
Name:       Brute Force détecté sur Windows
Severity:   High
Expression: count(/Windows-client/eventlog[Security,,,,4625],5m)>=3
Mode:       Multiple

### Étape 3 — Lancer l'attaque depuis Linux-Client

```bash
sudo apt install hydra -y
hydra -l Administrator -P /tmp/passwords.txt rdp://172.31.21.206 -V -f -t 1
```

### Ou générer manuellement depuis Windows

```powershell
net use \\172.31.21.206\IPC$ /user:Administrator wrongpassword 2>$null
```

### Résultat
Monitoring → Problems
🔴 High — PROBLEM — Windows-client — Brute Force détecté sur Windows

---

## 📧 Configuration Alertes Gmail
Alerts → Media types → Create media type
Name:                Gmail Zabbix
SMTP server:         smtp.gmail.com
SMTP port:           587
Connection security: STARTTLS
Username:            ton-email@gmail.com
Password:            (mot de passe application Google)

---

## ✅ Résultat Final

| Composant | Statut |
|-----------|--------|
| Zabbix Server Docker | ✅ |
| Agent Linux-Client | ✅ ZBX Vert |
| Agent Windows-client | ✅ ZBX Vert |
| Agent Zabbix Server | ✅ ZBX Vert |
| Détection Brute Force | ✅ Alerte High |
| Notification Gmail | ✅ Configuré |

---

## 🔧 Commandes utiles

```bash
docker ps
docker logs zabbix-zabbix-server-1 --tail 50
sudo systemctl status zabbix-agent
sudo tail -f /var/log/zabbix/zabbix_agentd.log
docker exec zabbix-zabbix-server-1 sh -c "nc -zv 172.17.0.1 10050"
```

---

*Projet réalisé avec Zabbix 7.4.10 sur AWS EC2 Ubuntu 24.04*
