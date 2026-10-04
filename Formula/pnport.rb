class Pnport < Formula
  desc "Run subprocesses through an installed Yarn Plug'n'Play filesystem"
  homepage "https://oss.delino.io/pnport"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :sequoia
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.0/pnport-darwin-x64.tar.gz"
      sha256 "6e59aa1eba046f9266fdebe4b1f9514b0991cf28a7c05a61077dcd5c04aac56d"
    else
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.0/pnport-darwin-arm64.tar.gz"
      sha256 "a82dd53d1ed1311675769770dffada6e43463627018b42832709436e859e965c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.0/pnport-linux-x64-gnu.tar.gz"
      sha256 "321b5a586dae325bcf80996733fb8ad06c39c01b91d643a15201a30bf892b705"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.0/pnport-linux-arm64-gnu.tar.gz"
      sha256 "cbe24ee32d3ff8ac7104c0c84f738da5bda84a04e1350b3bc74988d891f60413"
    else
      odie "pnport supports Linux x64 and arm64 only"
    end
  end

  def install
    bin.install "pnport"
    prefix.install "LICENSE"
    prefix.install "LICENSE.fspy"
    if OS.mac?
      bin.install "libpnport_preload.dylib"
    else
      bin.install "libpnport_preload.so"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pnport --version")
  end
end
