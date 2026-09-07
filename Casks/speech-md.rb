cask "speech-md" do
  version "0.5.0"
  sha256 "944c5dae5aa936855312ec737a9e071a0ee96e86f7142a3e65ca9ef0a01ad222"

  url "https://github.com/Andsu-dev/speech.md/releases/download/v#{version}/speech.md-#{version}.zip"
  name "speech.md"
  desc "On-device voice transcription for macOS"
  homepage "https://github.com/Andsu-dev/speech.md"

  depends_on macos: :tahoe

  app "speech.md.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/speech.md.app"]
  end

  zap trash: "~/Library/Preferences/dev.anderson.speech-md.plist"
end
