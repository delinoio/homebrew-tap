class Nodeup < Formula
  desc "Rust-based Node.js version manager"
  homepage "https://github.com/delinoio/oss"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.12/nodeup-darwin-amd64.tar.gz"
      sha256 "d459d6bccdd81729ccce3c43fc426576d89c6241f891f7ec636a20d48440065e"
    else
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.12/nodeup-darwin-arm64.tar.gz"
      sha256 "e1d5ce2691fd650a10b88b74880e9cc179e16611b39bcca797e5e3faf2c16473"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.12/nodeup-linux-amd64.tar.gz"
      sha256 "95a6bc1d5958151275d5517fb45019e05713181809f0d622c0e0b5ca8535dd89"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/nodeup@v0.1.12/nodeup-linux-arm64.tar.gz"
      sha256 "afca7dfb79cf4d62f55441d5b832c5b97eec00ced44fe693c5f0178bfeccc9d6"
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
