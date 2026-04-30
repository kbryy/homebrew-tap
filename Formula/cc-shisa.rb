class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "5c74abff8e6fa372d749461af47d685dec78597857aa7673d2d0674cc7b3f5ed"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "4dafaf6437e4426b3b97577d38a507c5ee8ac8d69155e39557b760f3062aed64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "211365e333f1c8c96d057c6eb8676c5b3626f50ec3654d403132402e7bc6253f"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "13f99f0b49ee0d7d00497f99d6ca0d49e0ebba4c33edf24b93ae8f560c7984c0"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
