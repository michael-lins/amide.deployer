# AMIDE Deployer

Infrastructure repo for AMIDE-related projects.

## Managed Projects

### ✅ RIMI (rimi.org.br)
- OJS 3.x
- Dockerized
- Kamal-based deploy
- MariaDB, PHP-FPM, nginx
- Let's Encrypt SSL via certbot

## How to Deploy

```bash
cd rimi
make setup
make deploy
```

## How to Restore a Backup
Transfer `ojs_backup.sql` and `ojs_files_backup.tar.gz` to the server, then:

```bash
bash restore_rimi_backup.sh
```

### 🔜 Upcoming
- `adoteumfilho/` — Prayer group Rails app
- `amide-wp/` — Main AMIDE WordPress
- `ceam/` — Spin-off educational site
- `ead/` — Moodle platform

---

Want to contribute or need help? Contact the infra team.

