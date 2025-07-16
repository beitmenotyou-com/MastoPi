# MastoPi Installation Guide

Welcome to MastoPi! This guide will walk you through setting up your own lightweight, federated social platform. Whether you’re a beginner or an experienced sysadmin, you’ll find step-by-step instructions, troubleshooting tips, and best practices here.

---

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Quick Start (Docker)](#quick-start-docker)
3. [YunoHost Setup](#yunohost-setup)
4. [Manual Setup (Advanced)](#manual-setup-advanced)
5. [First Run & Onboarding](#first-run--onboarding)
6. [Best Practices](#best-practices)
7. [Troubleshooting](#troubleshooting)
8. [FAQ](#faq)

---

## Prerequisites

- **Hardware:** Raspberry Pi 4/5 (2GB+ RAM recommended), or any x86/ARM server
- **OS:** Linux (Debian/Ubuntu/Raspberry Pi OS recommended)
- **Software:**
  - Docker & Docker Compose *(recommended)*
  - Or YunoHost *(for easy app management)*
  - Or Ruby 3.2+, Node.js 18+, PostgreSQL/SQLite, Redis (optional)
- **Network:** Static IP or dynamic DNS, open ports 80/443
- **Domain:** Custom domain (recommended for federation)

---

## Quick Start (Docker)

### 1. Clone the Repository
```sh
git clone https://github.com/youruser/mastopi.git
cd mastopi
```

### 2. Configure Environment
Copy `.env.sample` to `.env` and edit as needed:
```sh
cp .env.sample .env
nano .env
```
Set your domain, email, and database settings.

### 3. Build and Run
```sh
cd docker
docker-compose up --build
```

### 4. Access Your Instance
- Open `http://your-domain.com` in your browser.
- The onboarding wizard will guide you through domain, email, federation, and admin setup.

---

## YunoHost Setup

1. **Install YunoHost** on your server: [YunoHost Install Guide](https://yunohost.org/)
2. **Add the MastoPi app** (when available):
   - From the YunoHost admin panel, search for "MastoPi" and install.
   - Or, use the command line:
     ```sh
     yunohost app install https://github.com/youruser/mastopi_ynh
     ```
3. **Follow the web onboarding wizard** after install.

---

## Manual Setup (Advanced)

1. **Install dependencies:** Ruby, Node.js, PostgreSQL/SQLite, Redis (optional)
2. **Clone the repo:**
   ```sh
   git clone https://github.com/youruser/mastopi.git
   cd mastopi/backend
   ```
3. **Install gems and JS packages:**
   ```sh
   bundle install
yarn install
   ```
4. **Configure environment:**
   ```sh
   cp .env.sample .env
   nano .env
   ```
5. **Setup database:**
   ```sh
   RAILS_ENV=production bundle exec rails db:setup
   ```
6. **Precompile assets:**
   ```sh
   RAILS_ENV=production bundle exec rails assets:precompile
   ```
7. **Start the server:**
   ```sh
   RAILS_ENV=production bundle exec rails s
   ```
8. **(Optional) Start Sidekiq:**
   ```sh
   bundle exec sidekiq
   ```

---

## First Run & Onboarding

- Visit your instance in a browser.
- The onboarding wizard will walk you through:
  1. **Domain setup** (with Cloudflare tips)
  2. **Email (SMTP) setup**
  3. **Federation test**
  4. **Admin user creation**
- After onboarding, you’ll land on the dashboard.

**Diagram: Onboarding Flow**
```
flowchart TD
  A[Welcome] --> B[Domain Setup]
  B --> C[Email Setup]
  C --> D[Federation Test]
  D --> E[Admin User]
  E --> F[Dashboard]
```

---

## Best Practices
- **Back up your `.env` and database** regularly.
- **Use HTTPS** (Let’s Encrypt or Cloudflare Origin Certs).
- **Set up email notifications** for admin alerts.
- **Monitor disk space** (especially for media uploads).
- **Update regularly** using the admin dashboard or `docker/helpers/update.sh`.
- **Limit user/media quotas** for small hardware.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Docker won’t start | Check Docker logs: `docker-compose logs` |
| Can’t access web UI | Ensure ports 80/443 are open and DNS is set up |
| Email not sending | Double-check SMTP settings in `.env` |
| Federation test fails | Make sure your domain is public and ports are open |
| Media uploads fail | Check disk space and file size limits |
| Onboarding wizard stuck | Restart the server and clear browser cache |

---

## FAQ

**Q: Can I run MastoPi on a Raspberry Pi 4 with 2GB RAM?**
A: Yes! It’s designed for low-powered hardware. Limit user/media quotas for best results.

**Q: How do I update my instance?**
A: Use the admin dashboard’s update button or run `docker/helpers/update.sh`.

**Q: How do I enable HTTPS?**
A: Use Let’s Encrypt, Cloudflare, or your own certs. See the [Theming Guide](theming.md) for details.

**Q: Where can I get help?**
A: Visit our [GitHub Discussions](https://github.com/youruser/mastopi/discussions) or join the Fediverse hashtag #MastoPi.

---

## Screenshots & Diagrams

> **[Insert screenshots of onboarding, dashboard, and settings here]**

---

For more, see the [Upgrade Guide](upgrade.md), [Theming Guide](theming.md), and [Developer Guide](developing.md).
