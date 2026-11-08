class Binpm < Formula
  desc "Node-free binary package manager for release assets"
  homepage "https://github.com/delinoio/oss"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.5/binpm-darwin-amd64.tar.gz"
      sha256 "627b9d2153fe3edf61d05d824f54f35e96751fe7b34d5bb37d79ed9f8e42017b"
    else
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.5/binpm-darwin-arm64.tar.gz"
      sha256 "d712459645e74169c552d899e3f35d1a444086bfbdd629f136780387cc492f08"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.5/binpm-linux-amd64.tar.gz"
      sha256 "8d592332e2c086b3e478d65b54622af7077bbc8bfc179d78e8be964e3eed2e33"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.5/binpm-linux-arm64.tar.gz"
      sha256 "e236325504dd2430bc74b6ca6ce188bd34547faea78f8534d71ab091f6243ee6"
    else
      odie "binpm prebuilt distribution currently supports Linux amd64 and arm64 only"
    end
  end

  def install
    bin.install "binpm"
  end

  test do
    assert_predicate bin/"binpm", :exist?
    assert_match version.to_s, shell_output("#{bin}/binpm --version").strip
  end
end
