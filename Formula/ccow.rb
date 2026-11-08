class Ccow < Formula
  desc "Copy-on-write build caches for Git worktrees"
  homepage "https://oss.delino.io/cachecow/"
  url "https://github.com/delinoio/oss/releases/download/ccow@v0.1.0/ccow-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "730744028eded87dd60c35364607e2ceb72464a1ac55631aeb36e04c0e9fe46c"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "ccow"
    prefix.install "LICENSE", "NOTICE"
  end

  test do
    assert_equal "ccow #{version}", shell_output("#{bin}/ccow --version").strip
    assert_match "ccow run [--preset cargo|rspack|rsbuild]", shell_output("#{bin}/ccow --help")
    assert_match "Apache License", (prefix/"LICENSE").read
  end
end
