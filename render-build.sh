#!/bin/bash
set -e

# Install pnpm
npm install -g pnpm

# Install dependencies
pnpm install

# Create build and core directories if they don't exist
mkdir -p build core

# Build the application
pnpm build

# Copy core games to build directory
if [ -d "core" ] && [ "$(ls -A core)" ]; then
  cp -r core/* build/ || true
fi

echo "Build complete!"
