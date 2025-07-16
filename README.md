# MastoPi

A lightweight, federated, X-style social platform for individuals and small communities.

---

## About This Project

**MastoPi is a hard fork of [Mastodon](https://github.com/mastodon/mastodon).**

- All core Mastodon features are included.
- MastoPi adds:
  - X-style UI and theming (see `theme/`)
  - PWA support, E2E encrypted DMs, onboarding wizard, and more
  - Enhanced documentation (see `docs/`)
  - Docker/YunoHost support and optimizations for Raspberry Pi

**This repository contains the full Mastodon codebase plus all Mastopi-specific changes.**

### Where to Find Mastopi Customizations
- `theme/` — Custom SCSS, icons, and layout
- `docs/` — User and developer documentation
- `docker/` — Docker Compose and helpers
- `scripts/` — Setup scripts
- `app/`, `config/`, etc. — Core Mastodon code (with Mastopi changes)

### Keeping Upstream Attribution
- Mastodon is AGPLv3 licensed. See `LICENSE` for details.
- Original Mastodon authors are credited; MastoPi additions are marked in code and docs.

---

## Getting Started

See [docs/install.md](docs/install.md) for setup instructions.

## Contributing

See [docs/developing.md](docs/developing.md) for development and contribution guidelines.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a summary of Mastopi-specific changes.
