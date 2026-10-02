class Clibox < Formula
  desc "Native utilities for configuration, processes, and file workflows"
  homepage "https://oss.delino.io/clibox/"
  version "0.3.6"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.6/clibox-darwin-arm64.tar.gz"
    sha256 "446f440ecc146de58765e26ca0cce3c91be7a6d924da737ac5b08fa3affd75d2"
  else
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.6/clibox-darwin-amd64.tar.gz"
    sha256 "36abeddc29903502aef97daac6491fdccbcf51d1bdd4a7f412b0141394213f2a"
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
