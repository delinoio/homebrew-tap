class Clibox < Formula
  desc "Native utilities for configuration, processes, and file workflows"
  homepage "https://oss.delino.io/clibox/"
  version "0.3.8"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.8/clibox-darwin-arm64.tar.gz"
    sha256 "3cb83e119c23b53143e51428e51d7c2c3b1493ab69285da23cb28828610016c6"
  else
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.8/clibox-darwin-amd64.tar.gz"
    sha256 "03f18669c4c6f0c5f2e03eb70fe29a93e1ad33f3bf1ca2b7dc024ecdc08efbdb"
  end

  def install
    bin.install "clibox"
    prefix.install "LICENSE", "NOTICE", "LICENSE.fspy"
  end

  test do
    assert_equal "clibox #{version}", shell_output("#{bin}/clibox --version").strip
    assert_match "Usage:", shell_output("#{bin}/clibox --help")
    assert_match "Apache License", (prefix/"LICENSE").read
    assert_match "VoidZero", (prefix/"LICENSE.fspy").read
    (testpath/"input.txt").write("homebrew fixture")
    encoded = shell_output("#{bin}/clibox base64 encode --input=#{testpath}/input.txt").strip
    assert_equal "aG9tZWJyZXcgZml4dHVyZQ==", encoded
  end
end
