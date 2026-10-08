class Clibox < Formula
  desc "Native utilities for configuration, processes, and file workflows"
  homepage "https://oss.delino.io/clibox/"
  version "0.3.7"
  license "Apache-2.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.7/clibox-darwin-arm64.tar.gz"
    sha256 "087dc4af5223a105229aeea53edeadee5655714bf90e466245f7fbc50a634407"
  else
    url "https://github.com/delinoio/oss/releases/download/clibox@v0.3.7/clibox-darwin-amd64.tar.gz"
    sha256 "2bba3d090ccfe0010609f9ea4ac22a6fbbdfce4806fce0b3ff6d00cb09a03c64"
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
