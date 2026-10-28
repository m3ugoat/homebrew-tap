# Mediagg's Homebrew tap

Mediagg for Mac, installed with [Homebrew](https://brew.sh):

```sh
brew tap m3ugoat/tap
brew trust m3ugoat/tap
brew install --cask m3ugoat/tap/mediagg
```

Homebrew installs from a tap of its own only once you trust it (`brew trust`); this one holds the
Mediagg cask and nothing else.

Mediagg plays music, podcasts, films, shows and audiobooks from your Mac, your media servers and
podcast feeds. It is the same signed and notarised app as the download on
[mediagg.app](https://mediagg.app/get/#mac), for macOS 13 or later, Apple silicon and Intel.

**Updates come from the app itself** (Settings → Updates), so `brew upgrade` leaves it alone
(`auto_updates`). `brew uninstall --cask mediagg` removes the app; add `--zap` to remove its
settings and library as well.

## For maintainers

After each Mac release is published: `./bump.sh`, review the change to `Casks/mediagg.rb`, commit
it as `Mediagg X.Y.Z` and push. Check with `brew audit --cask --online m3ugoat/tap/mediagg`.
