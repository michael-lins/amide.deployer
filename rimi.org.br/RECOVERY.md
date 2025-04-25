# 📖 RIMI Disaster Recovery Playbook

## 1. Provision a Clean Server
- Ubuntu 22.04 LTS
- Install Docker, Docker Compose, Kamal
- Point DNS `rimi.org.br` to the new server

## 2. Clone AMIDE Deployer Repo
```bash
git clone git@github.com:amide-org/amide.deployer.git
cd amide.deployer/rimi
```

## 3. Deploy Infrastructure
```bash
make setup
make deploy
```

## 4. Restore Backup

### Upload Backup Files
```bash
scp db_rimi_YYYY-MM-DD-HH-MM.sql root@server:/root/
scp files_rimi_YYYY-MM-DD-HH-MM.tar.gz root@server:/root/
```

### SSH into Server
```bash
ssh root@your.new.server
```

### Restore Files
```bash
mkdir restore_tmp
tar xzvf files_rimi_YYYY-MM-DD-HH-MM.tar.gz -C restore_tmp
docker cp restore_tmp/files/ $(docker ps -qf name=app):/var/www/html/files
rm -rf restore_tmp
```

### Restore Database
```bash
docker exec -i $(docker ps -qf name=db) mysql -u root -p<your_secret_password> ojs < db_rimi_YYYY-MM-DD-HH-MM.sql
```

## 5. Fix Permissions
```bash
docker exec $(docker ps -qf name=app) chown -R www-data:www-data /var/www/html/files
```

## 6. Reissue SSL Certificate (If Needed)
```bash
sudo certbot --nginx -d rimi.org.br
```

# 🧐 Important Notes
- Keep 7–14 days of backups minimum.
- Test restore every 3 months.
- If disaster, manually recover `/files/` and DB dumps if server partially alive.

# 💪 Quick Cheat Sheet
```bash
git clone amide.deployer
make setup
make deploy
scp backup files
restore DB and files
fix permissions
certbot renew if needed
```

