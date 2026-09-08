cask "speech-md" do
  version "0.7.0"
  sha256 "077d51be917ea2d9b0111677bcb7ea1f1716a2154b335c6bd7994bfa6ba9a4ef"

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
