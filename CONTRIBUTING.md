# Contributing to MastoPi

Thank you for your interest in contributing! Please read these guidelines to help us maintain a clear, collaborative, and high-quality project.

---

## Commit Messages & Changelog Process

We use a **dual changelog system** to keep both developers and users informed:

### 1. Conventional Commits & `standard-version`
- All commits should follow the [Conventional Commits](https://www.conventionalcommits.org/) format:
  - `feat: add onboarding wizard`
  - `fix: correct DM encryption bug`
  - `docs: update install guide`
  - `chore: update dependencies`
- We use [`standard-version`](https://github.com/conventional-changelog/standard-version) to:
  - Bump versions
  - Generate a detailed, developer-focused `CHANGELOG.md`
  - Tag releases

### 2. GitHub PR/Issue Changelog
- For each major release, we also run [`github_changelog_generator`](https://github.com/github-changelog-generator/github-changelog-generator) to:
  - Summarize merged PRs and closed issues
  - Generate user-friendly release notes (added to the top of `CHANGELOG.md` or in `RELEASE_NOTES.md`)

### 3. Release Workflow
- For every release:
  1. Ensure all commits use Conventional Commits.
  2. Run `npm run release` to update the changelog and version.
  3. Run `github_changelog_generator -u youruser -p mastopi` to update user-facing notes.
  4. Push changes and tags to GitHub.

---

## Submitting Pull Requests
- Fork the repo and create a feature branch.
- Make your changes and add tests.
- Use Conventional Commits for all commit messages.
- Run tests locally before submitting.
- Submit a pull request to the `dev` branch.
- For UI changes, include before/after screenshots.
- Respond to code review feedback promptly.

---

## Questions?
- Open an issue, join GitHub Discussions, or use the #MastoPi hashtag.
