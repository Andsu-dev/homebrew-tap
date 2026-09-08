cask "speech-md" do
  version "0.8.0"
  sha256 "00ac4f43e6df8537a57b08525a7bac0ab643b9fe49f0d5af30babbb4cf76088b"

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
