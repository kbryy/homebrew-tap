class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "0fa58986479394c7b23820fa8c8c4f0673c8d41e54a405cd08ae93b5aa7ab2c0"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "366c464ff88196176d6ac8b72d5592377f891d36061e025abd9f3076681c10b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "e716ae6f7edc0641665238ad751bb259ff8326a07e85329c9c2478d2e488c294"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "93d0cd61749130b46fad5a63725dc7dbf247d20d76ddb6808a1b5326a62e95c5"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
