cask "mediagg" do
  version "0.4.2"
  sha256 "6e7cebbd66a25dc60cec6b71798eade306dab269bfb529de62f9aadd8d61e419"

  url "https://github.com/m3ugoat/mediagg-releases/releases/download/mediagg-for-mac/Mediagg-#{version}.dmg",
      verified: "github.com/m3ugoat/mediagg-releases/"
  name "Mediagg"
  desc "Music, podcasts, films and audiobooks from your device, media servers and feeds"
  homepage "https://mediagg.app/"

  livecheck do
    url "https://github.com/m3ugoat/mediagg-releases/releases/download/mediagg-for-mac/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :ventura

  app "Mediagg.app"

  zap trash: [
    "~/Library/Application Support/app.mediagg.desktop",
    "~/Library/Caches/app.mediagg.desktop",
    "~/Library/HTTPStorages/app.mediagg.desktop",
    "~/Library/Preferences/app.mediagg.desktop.plist",
    "~/Library/Saved Application State/app.mediagg.desktop.savedState",
    "~/Library/WebKit/app.mediagg.desktop",
  ]
end
