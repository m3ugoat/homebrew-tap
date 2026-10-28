#!/bin/sh
# Moves Casks/mediagg.rb to the Mediagg for Mac release that is out now: the version in the release's
# latest.json, and the SHA-256 of that version's .dmg, downloaded here and checked.
#
#   ./bump.sh            # then review, commit "Mediagg X.Y.Z" and push
#
# Run it after the release is published (the .dmg and latest.json on mediagg-for-mac), never before:
# the cask names a file people download the moment the commit is pushed.
set -eu

here="$(cd "$(dirname "$0")" && pwd)"
cask="$here/Casks/mediagg.rb"
base="https://github.com/m3ugoat/mediagg-releases/releases/download/mediagg-for-mac"

version="$(curl -fsSL "$base/latest.json" | python3 -c 'import json, sys; print(json.load(sys.stdin)["version"])')"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
curl -fsSL -o "$work/Mediagg.dmg" "$base/Mediagg-$version.dmg"
hdiutil verify -quiet "$work/Mediagg.dmg"
sum="$(shasum -a 256 "$work/Mediagg.dmg" | cut -d' ' -f1)"

sed -i '' -e "s/^  version \".*\"$/  version \"$version\"/" -e "s/^  sha256 \".*\"$/  sha256 \"$sum\"/" "$cask"
echo "Casks/mediagg.rb: $version, sha256 $sum"
