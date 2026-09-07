cask "speech-md" do
  version "0.6.0"
  sha256 "7f2fd5a236bdccf88f525e6aa0e43bd2e8006440e9f02b33b53c710556f2f100"

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
