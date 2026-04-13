class BrewUse < Formula
  desc "Homebrew mirror source manager - quickly switch between mirrors"
  homepage "https://github.com/yurongcode/brew-use"
  url "https://github.com/yurongcode/brew-use/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_UPDATE_AFTER_RELEASE"
  license "MIT"
  head "https://github.com/yurongcode/brew-use.git", branch: "main"

  def install
    bin.install "bin/brew-use"
  end

  def caveats
    <<~EOS
      Add the following line to your shell profile (~/.zshrc or ~/.bashrc):

        eval "$(brew-use init)"

      Then reload your shell:

        source ~/.zshrc

      Usage:
        brew-use list       # List available mirrors
        brew-use tuna       # Switch to TUNA mirror
        brew-use default    # Reset to official source
    EOS
  end

  test do
    assert_match "brew-use", shell_output("#{bin}/brew-use --version")
  end
end
