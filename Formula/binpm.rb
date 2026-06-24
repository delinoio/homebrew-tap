class Binpm < Formula
  desc "Node-free binary package manager for release assets"
  homepage "https://github.com/delinoio/oss"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.0/binpm-darwin-amd64.tar.gz"
      sha256 "ee4d1e672fad47e1bd25c0118c22c3dc2c0920410dad3c74e2ae876031938921"
    else
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.0/binpm-darwin-arm64.tar.gz"
      sha256 "9835d23178118bfce22d087f5d71e00ff4c5f528a1b5a82abd3cd489dc3ddda0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.0/binpm-linux-amd64.tar.gz"
      sha256 "1362b3448a5fd27273434b7e9b7e6e461e63d5c7b31c666f4b94af8cfb23324e"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.0/binpm-linux-arm64.tar.gz"
      sha256 "4edfcfda1532d6758ab7d0cc3129325bc4a461ae6f2b30ad08ff6f8db1fd91d6"
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
