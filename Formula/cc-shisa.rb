class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "38b42a169a9656edf322d725f72301a3e2525666145e6d22828098f62c1a5647"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "187778fde2329bfd77bbd0356ff9a804c8a123b7c19dbc3f9385b91bafe71d14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "fb4b62d271c89f3bb5724791f19592c01ae1a2290beb568ce490a3050a57a0bb"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "e0110547acc12f6e8545cfffe6255015bf5bbdbaa9351797fac667faf430f938"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
