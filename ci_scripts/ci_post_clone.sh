#!/bin/bash
set -euo pipefail

# Xcode Cloud runs this after cloning the repository and before it opens the project.
# We use it to generate CocoaPods support files that the Xcode project references.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

if ! command -v pod >/dev/null 2>&1; then
  gem install cocoapods --no-document
fi

pod install --repo-update
