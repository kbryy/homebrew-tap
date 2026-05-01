class CcShisa < Formula
  desc "Static-analysis PreToolUse hook for Claude Code's Bash tool"
  homepage "https://github.com/kbryy/cc-shisa"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-arm64"
      sha256 "e2aab956ce64378f9606b2c3d4d198960afed90d8f40f97796f2af5bc94155fe"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-darwin-x64"
      sha256 "ae698e895a084397698a027b6234271fc508b6b3ad026f84d035f8f39864212b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-arm64"
      sha256 "f1c000de9c30ddb8d15cb7f48f791e250311eeab6cd578fd0633bbab6fbd72ad"
    else
      url "https://github.com/kbryy/cc-shisa/releases/download/v#{version}/cc-shisa-linux-x64"
      sha256 "b33206a0ab6c66b48d27aab650ccfaef67f632ab9257393204f5e4a453917f3f"
    end
  end

  def install
    bin.install Dir["cc-shisa-*"].first => "cc-shisa"
    generate_completions_from_executable(bin/"cc-shisa", "completion")
  end

  test do
    assert_match(/^\d+\.\d+\.\d+/, shell_output("#{bin}/cc-shisa version"))
  end
end
