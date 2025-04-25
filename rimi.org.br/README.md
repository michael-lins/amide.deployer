# malvins.deployer
# Kamal Base Deploy Skeleton

## Requirements
- Ruby + Kamal
- Docker
- nginx
- Certbot
- rclone for backup

## Steps
1. Clone this repo
2. Replace placeholder values
3. Run Kamal init & deploy
4. Setup nginx & certbot
5. Schedule `backup.sh` with crontab

## Helper Scripts
- `deploy.sh` — wraps basic Kamal commands for easy usage.
- `Makefile` — run commands like `make deploy`, `make setup`, or `make backup` without remembering arguments.

---

This is a minimal setup. Extend it for other stacks (WordPress, Node, etc.).
