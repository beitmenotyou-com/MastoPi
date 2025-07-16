# MastoPi Developer Guide

Welcome, developer! This guide will help you set up a local environment, understand the codebase, contribute features or fixes, and follow best practices for MastoPi.

---

## Table of Contents
1. [Local Development Setup](#local-development-setup)
2. [Codebase Structure](#codebase-structure)
3. [Theming & Plugins](#theming--plugins)
4. [Testing](#testing)
5. [Coding Standards](#coding-standards)
6. [Submitting Pull Requests](#submitting-pull-requests)
7. [Troubleshooting](#troubleshooting)
8. [FAQ](#faq)

---

## Local Development Setup

### 1. Clone the Repository
```sh
git clone https://github.com/beitmenotyou-com/mastopi.git
cd mastopi
```

### 2. Install Dependencies
- **Ruby:** 3.2+
- **Node.js:** 18+
- **Yarn or npm**
- **PostgreSQL or SQLite**
- **Redis** (optional)

### 3. Setup Environment
```sh
cp .env.sample .env
nano .env
```

### 4. Install Gems and JS Packages
```sh
cd backend
bundle install
yarn install
```

### 5. Setup Database
```sh
RAILS_ENV=development bundle exec rails db:setup
```

### 6. Start the App
```sh
RAILS_ENV=development bundle exec rails s
```

### 7. (Optional) Start Sidekiq
```sh
bundle exec sidekiq
```

### 8. Access the App
- Visit `http://localhost:3000` in your browser.
- Use the onboarding wizard to create your first admin user.

---

## Codebase Structure

```
mastopi/
├── backend/         # Rails app (API, web, jobs)
│   ├── app/
│   ├── config/
│   └── ...
├── theme/           # SCSS, icons, theming
├── docker/          # Docker Compose, helpers
├── scripts/         # Setup scripts
├── docs/            # Documentation (MkDocs)
└── .github/         # Issue templates, CI
```

- **Controllers:** `backend/app/controllers/`
- **Models:** `backend/app/models/`
- **Views:** `backend/app/views/`
- **Jobs:** `backend/app/jobs/`
- **Services:** `backend/app/services/`
- **Theming:** `theme/`
- **Plugins:** (future) `plugins/`

---

## Theming & Plugins
- See the [Theming Guide](theming.md) for SCSS and icon customization.
- Plugin system is planned for future releases. Watch for updates in `plugins/`.

---

## Testing

### 1. Backend (RSpec)
```sh
cd backend
bundle exec rspec
```

### 2. Frontend (Jest or npm test)
```sh
cd backend
npm test
# or
yarn test
```

### 3. Accessibility (axe-core, pa11y)
- Run accessibility tests on key pages.

### 4. Continuous Integration
- All PRs are tested via GitHub Actions (see `.github/workflows/ci.yml`).

---

## Coding Standards
- Follow [Ruby style guide](https://rubystyle.guide/) and [Airbnb JS style guide](https://github.com/airbnb/javascript).
- Use descriptive commit messages.
- Write clear, maintainable code with comments where needed.
- Ensure all tests pass before submitting a PR.

---

## Submitting Pull Requests
1. Fork the repo and create a feature branch.
2. Make your changes and add tests.
3. Run all tests locally.
4. Submit a pull request to the `dev` branch.
5. For UI changes, include before/after screenshots.
6. Respond to code review feedback promptly.

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| App won’t start | Check logs, verify `.env` and dependencies |
| DB errors | Ensure database is running and credentials are correct |
| Styles not updating | Recompile assets, clear browser cache |
| Tests failing | Run tests locally, check error output |

---

## FAQ

**Q: Can I use Docker for development?**
A: Yes! Use `docker-compose up` for a full stack, but local dev is often faster for code changes.

**Q: How do I add a new theme?**
A: Add your SCSS and icons to `theme/`, import in `mastopi.scss`, and test locally.

**Q: How do I contribute a plugin?**
A: Watch for updates in the `plugins/` directory and follow the plugin guide (coming soon).

**Q: Where can I get help?**
A: Open an issue, join GitHub Discussions, or use the #MastoPi hashtag.

---

## Screenshots & Diagrams

> **[Insert diagrams of code structure, sample PR workflow, and test results here]**

---

For more, see the [Install Guide](install.md), [Upgrade Guide](upgrade.md), and [Theming Guide](theming.md).
