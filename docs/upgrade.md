# MastoPi Upgrade & Maintenance Guide

Keep your MastoPi instance secure, stable, and up-to-date with this comprehensive guide. Whether you’re upgrading via the admin dashboard or the command line, you’ll find step-by-step instructions, troubleshooting tips, and best practices here.

---

## Table of Contents
1. [Why Upgrade?](#why-upgrade)
2. [Backup Before You Begin](#backup-before-you-begin)
3. [Upgrade Methods](#upgrade-methods)
   - [Admin Dashboard (Recommended)](#admin-dashboard-recommended)
   - [Command Line (CLI)](#command-line-cli)
4. [Restoring from Backup](#restoring-from-backup)
5. [Troubleshooting Upgrades](#troubleshooting-upgrades)
6. [Best Practices](#best-practices)
7. [FAQ](#faq)

---

## Why Upgrade?
- **Security:** Get the latest patches and vulnerability fixes.
- **Features:** Access new features and improvements.
- **Stability:** Benefit from bug fixes and performance enhancements.

---

## Backup Before You Begin
**Always back up your data before upgrading!**

### What to Back Up
- `.env` file (environment variables)
- Database (PostgreSQL/SQLite)
- Media uploads (e.g., `public/system/`)

### How to Back Up (Docker Example)
```sh
cp .env backup/.env.backup
cp -r backend/public/system backup/system_backup
# For SQLite:
cp backend/db/production.sqlite3 backup/
# For PostgreSQL:
docker exec -t mastopi-db pg_dump -U <dbuser> <dbname> > backup/db_backup.sql
```

---

## Upgrade Methods

### Admin Dashboard (Recommended)
1. Log in as an admin.
2. Go to **Settings > Updates**.
3. If an update is available, click **Update Now**.
4. The system will:
   - Pull the latest code
   - Update dependencies
   - Run migrations
   - Restart services
5. You’ll see a success or error message when done.

**Diagram: Admin Update Flow**
```
flowchart LR
  A[Check for Update] --> B[Download & Install]
  B --> C[Run Migrations]
  C --> D[Restart Services]
  D --> E[Done]
```

### Command Line (CLI)
1. SSH into your server.
2. Run the update script:
   ```sh
   cd mastopi/docker
   ./helpers/update.sh
   ```
3. Watch for errors and confirm the site is running after the update.

---

## Restoring from Backup

### If Something Goes Wrong
1. Stop all services:
   ```sh
   docker-compose down
   ```
2. Restore your backups:
   - `.env`: Copy your backup over the current file.
   - Media: Restore `public/system/`.
   - Database:
     - For SQLite:
       ```sh
       cp backup/production.sqlite3 backend/db/production.sqlite3
       ```
     - For PostgreSQL:
       ```sh
       docker exec -i mastopi-db psql -U <dbuser> <dbname> < backup/db_backup.sql
       ```
3. Start services:
   ```sh
   docker-compose up -d
   ```
4. Check your site and logs for issues.

---

## Troubleshooting Upgrades

| Problem | Solution |
|---------|----------|
| Update fails | Check logs in the admin dashboard or run `docker-compose logs` |
| Site won’t start | Ensure `.env` and database are restored correctly |
| Media missing | Restore `public/system/` from backup |
| Database migration error | Restore backup and contact support/community |
| Rollback needed | Use your backup files to restore the previous state |

---

## Best Practices
- **Schedule regular backups** (automate if possible).
- **Test updates on a staging server** before production.
- **Monitor disk space** and logs after updates.
- **Keep your OS and Docker up to date**.
- **Read release notes** for breaking changes or manual steps.

---

## FAQ

**Q: How do I know when an update is available?**
A: The admin dashboard will notify you, or check the [GitHub releases](https://github.com/youruser/mastopi/releases).

**Q: Can I skip versions?**
A: It’s best to update sequentially, but the updater will handle most version jumps. Always back up first.

**Q: What if I lose my `.env` or database?**
A: Restore from your latest backup. If you have no backup, recovery may not be possible.

**Q: Where can I get help?**
A: Visit [GitHub Discussions](https://github.com/youruser/mastopi/discussions) or the #MastoPi hashtag.

---

## Screenshots & Diagrams

> **[Insert screenshots of the update process, backup/restore, and error messages here]**

---

For more, see the [Install Guide](install.md), [Theming Guide](theming.md), and [Developer Guide](developing.md).
