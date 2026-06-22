class Binpm < Formula
  desc "Node-free binary package manager for release assets"
  homepage "https://github.com/delinoio/oss"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.1.1/binpm-darwin-amd64.tar.gz"
      sha256 "4d3bd9926cfa57969a26430f91a03ff3e22474e22246c1d18d76f8df22e57540"
    else
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.1.1/binpm-darwin-arm64.tar.gz"
      sha256 "3d5eefd8623dacbb3695dd74746500196b8b3849435aeca4350cea8627f1efbd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.1.1/binpm-linux-amd64.tar.gz"
      sha256 "f5cc6680d25b8fa65935ecd9413af04740300a9524f0e71925fb8e3202245009"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.1.1/binpm-linux-arm64.tar.gz"
      sha256 "ee0f860c14571b35cc20f41bff2191459713443bc1c7065df28df4e29cc9cc93"
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
