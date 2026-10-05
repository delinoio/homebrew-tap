class Pnport < Formula
  desc "Run subprocesses through an installed Yarn Plug'n'Play filesystem"
  homepage "https://oss.delino.io/pnport"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :sequoia
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.2/pnport-darwin-x64.tar.gz"
      sha256 "cf221d5bb0f2bd5207773fb07499677588b34a8f8596ddb5af34a66853e70970"
    else
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.2/pnport-darwin-arm64.tar.gz"
      sha256 "7f91f792f79227a468e26af455162cad8405bf11ab0d20296e2316f2a2b3afa1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.2/pnport-linux-x64-gnu.tar.gz"
      sha256 "8b7de8d296358809e5ae2729281abc41dfcbf44cbfb211fdabd8ecdf96685431"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/pnport@v0.1.2/pnport-linux-arm64-gnu.tar.gz"
      sha256 "eb3766d1720afc13754143a9bf56d4aaf40f1245e1a3b44474da575637e1597c"
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
