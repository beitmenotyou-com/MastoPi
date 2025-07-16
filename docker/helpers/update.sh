#!/bin/bash
# Update script for Mastopi
# Pulls latest code, updates dependencies, runs migrations, restarts containers

echo "[MastoPi] Updating..."
git pull origin main || exit 1
bundle install || exit 1
yarn install || npm install || true
RAILS_ENV=production bundle exec rails db:migrate || exit 1
docker-compose down && docker-compose up -d
