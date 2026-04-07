class Nodeup < Formula
  desc "Rust-based Node.js version manager"
  homepage "https://github.com/delinoio/oss"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.11/nodeup-darwin-amd64.tar.gz"
      sha256 "e18021566fd0b2045f0f87f43fda9be45af0deca54f8d007813c4e803acb21d1"
    else
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.11/nodeup-darwin-arm64.tar.gz"
      sha256 "85818457ce6b7bb1de87bc493dbc0762a80a829f6fbd703cf3db853265eb7fd9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.11/nodeup-linux-amd64.tar.gz"
      sha256 "2838040fd9cfd29aff5f2c84bc17363dab7e439b381a7386af74d5b598992f72"
    else
      odie "nodeup prebuilt distribution currently supports Linux amd64 only"
    end
  end

  def install
    bin.install "nodeup"
  end

  test do
    assert_predicate bin/"nodeup", :exist?
    assert_match version.to_s, shell_output("#{bin}/nodeup --version").strip
  end
end
