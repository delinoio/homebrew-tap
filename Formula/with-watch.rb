class WithWatch < Formula
  desc "Watch command inputs and rerun commands when they change"
  homepage "https://github.com/delinoio/oss"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.1/with-watch-darwin-amd64.tar.gz"
      sha256 "55302464dd0bb306a94c8c24107846d9463a97c6bfc4ce70709cf169232cc020"
    else
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.1/with-watch-darwin-arm64.tar.gz"
      sha256 "7f1154bd3cb2d4a5fc83ed1d1fe9008afbd076eeaa4b3dd001ecf70631a7f62d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.1/with-watch-linux-amd64.tar.gz"
      sha256 "b070ff6a061b1ce9b1d8bd002d9b3b86c6b7b7ea2a7aec2a3a20019844755e9b"
    else
      odie "with-watch prebuilt distribution currently supports Linux amd64 only"
    end
  end

  def install
    bin.install "with-watch"
  end

  test do
    assert_predicate bin/"with-watch", :exist?
  end
end
