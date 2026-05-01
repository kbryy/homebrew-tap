class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "06d939d394adb18dd7b04af65b2a6774a950fa8643d18ee6295a87abedf3df4c"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "5834c04f8accd958e5f92d7a8173da3216d90d1d6ad5671cd5ae0b27568e1fd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "e4f683ab66baa71f6a926a6fa2623d41cff53a41e13c225c9b73e61c0464282d"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "8dc462793dc6b99a37681a4cba621cb1fbf73817f8bdd7813bc0a3c0d50aa27b"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
    chmod 0755, bin/"cc-shisa"
    generate_completions_from_executable(bin/"cc-shisa", "completion")
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
