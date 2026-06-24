class Nodeup < Formula
  desc "Rust-based Node.js version manager"
  homepage "https://github.com/delinoio/oss"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.2.0/nodeup-darwin-amd64.tar.gz"
      sha256 "dfae2f60f0a6a8d485808210624119dd3cc3c146e53f87016a8182cbe2b3674a"
    else
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.2.0/nodeup-darwin-arm64.tar.gz"
      sha256 "9ba6e02147632f4241a4cd21c177d65e1655e1687f9a29b5c8023adae980695c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.2.0/nodeup-linux-amd64.tar.gz"
      sha256 "23bb902638df36121731c4c9b4a4318dcc4aa279e695f6fa7749d8670ced6251"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.2.0/nodeup-linux-arm64.tar.gz"
      sha256 "517c94c482565994781aeed753550d72893ecd15aba5b4e772f35594be93a401"
    else
      odie "nodeup prebuilt distribution currently supports Linux amd64 and arm64 only"
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
