class Runmoor < Formula
  desc "Local manager for disposable GitHub Actions runners"
  homepage "https://oss.delino.io/runmoor/"
  url "https://github.com/delinoio/oss/releases/download/runmoor@v0.2.0/runmoor-darwin-arm64.tar.gz"
  version "0.2.0"
  sha256 "291b689e95c217d2440140cfb395cb75605105d3e59d8c69dbd60209490221bc"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "runmoor"
    doc.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      Install Tart and prepare your runner images separately.
      Installation does not configure runners or register or start a service.
      Use Runmoor's explicit service commands after configuring it.
    EOS
  end

  test do
    assert_match "Apache License", (prefix/"LICENSE").read
    assert_match "runmoor #{version} (", shell_output("#{bin}/runmoor version")
    assert_match "Usage:", shell_output("#{bin}/runmoor --help")
  end
end
