class Clibox < Formula
  desc "Native utilities for configuration, processes, and file workflows"
  homepage "https://oss.delino.io/clibox/"
  version "0.3.4"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.4/clibox-darwin-arm64.tar.gz"
    sha256 "476f6689fb63bc804530d4167b6182b58aea2765b1f77f3b7b6862acb6c8a33f"
  else
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.4/clibox-darwin-amd64.tar.gz"
    sha256 "feb80232e8ba9cecf2edd3f94981f9cfaa3560e8325608c6511ffcdd7d47e2f8"
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
