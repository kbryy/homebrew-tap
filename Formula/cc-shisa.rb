class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "a5116c4848da761a8d2d7a1167a40e9cee478535530a77bb7d72546de7d106e3"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "f404191d6f25ac240e3dfb49439578e0decf92e005e47c9ddbf6a733b9140900"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "a6a766ce8b149c33c02ad7b96d7a1af390ffe9eb5c19d291c46d5129f3675002"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "771dd99df7990bb9e7d1062dcf52e04cddc32e87ed3b5914c3fbf9c85830d33f"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
