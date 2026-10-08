class Runmoor < Formula
  desc "Local manager for disposable GitHub Actions runners"
  homepage "https://oss.delino.io/runmoor/"
  url "https://github.com/delinoio/oss/releases/download/runmoor@v0.2.9/runmoor-darwin-arm64.tar.gz"
  version "0.2.9"
  sha256 "fe27968a1890c06b5c81c59ff21c0484cb6075191ced1288e9a02586ef1eaaa0"
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
