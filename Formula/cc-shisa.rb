class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "524a9bedf30a99027caa253f6dd5dba672aae817997734a47ea8c2cb315be607"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "435040edd37cc57416196bf16f53c6b16926d8f5e19c0dca0ce2865d694b0392"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "47932ed81ca94856ececc881a23f1be421fc6ebb832d75fe6db952e6f69caea2"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "4144032b1a4a59f140a0f5dd0db26653ff1822f3fb4f5c68859c09488d37ab18"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
