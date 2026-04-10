class WithWatch < Formula
  desc "Watch command inputs and rerun commands when they change"
  homepage "https://github.com/delinoio/oss"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.2/with-watch-darwin-amd64.tar.gz"
      sha256 "fed3578acc19c744dbae1222fec0be9642fac162a995182fe3e767c84d6eef92"
    else
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.2/with-watch-darwin-arm64.tar.gz"
      sha256 "10edb0e01a48a9a0137c5044cf66d88ea89cfc563b68632b088584dd5b512626"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.2/with-watch-linux-amd64.tar.gz"
      sha256 "644885a434a041622160b1b7972bf1f66a753cb52d10ea3cef90db6596379d79"
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
