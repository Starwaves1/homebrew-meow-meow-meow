class MeowMeowMeow < Formula
  desc "Print ASCII cats to your terminal - now with meow counting!"
  homepage "https://github.com/Starwaves1/meow-meow-meow"
  url "https://github.com/Starwaves1/meow-meow-meow/archive/refs/tags/meow_meow.tar.gz"
  version "meow_meow"
  sha256 ""  # Will be filled by setup.sh
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Test basic functionality
    output = shell_output("#{bin}/meow 2>&1")
    assert_match "meow", output.downcase
    
    # Test count flag
    output = shell_output("#{bin}/meow -c 2 2>&1")
    assert_match "meow", output.downcase
  end

  def caveats
    <<~EOS
      meow-meow-meow has been installed!
      
      Try it out:
        meow                  # Print one cat
        meow meow meow       # Print three cats
        meow -c 5            # Print five cats
        meow -l              # Be literally this cat
        meow --help          # See all options
    EOS
  end
end
