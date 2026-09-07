cask "speech-md" do
  version "0.4.0"
  sha256 "026782b9d2f92fbec67b5ccc8caaef671f5b042fcfc3cc0fa754baa4a6120cf5"

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
