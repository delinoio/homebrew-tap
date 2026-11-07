class Binpm < Formula
  desc "Node-free binary package manager for release assets"
  homepage "https://github.com/delinoio/oss"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.4/binpm-darwin-amd64.tar.gz"
      sha256 "80aa0717c8b3d018313a9ee759caf28c59a4e2f6d2eab3e7864c5245d30c4e1a"
    else
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.4/binpm-darwin-arm64.tar.gz"
      sha256 "d9be803cd197f772df2817992c10dad6193d224461e0318369ed71106797d85c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.4/binpm-linux-amd64.tar.gz"
      sha256 "09220c651a84591ebd4d81ea6561cd93260e7b44bf58698142200bf4d4640f14"
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/delinoio/oss/releases/download/binpm@v0.2.4/binpm-linux-arm64.tar.gz"
      sha256 "8a884c9cf274707592b4e42e3aaff28907bd0a43d0e6bb8160a31a3ce56a2f79"
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
