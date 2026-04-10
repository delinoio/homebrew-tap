class WithWatch < Formula
  desc "Watch command inputs and rerun commands when they change"
  homepage "https://github.com/delinoio/oss"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.3/with-watch-darwin-amd64.tar.gz"
      sha256 "0cb049ad4e32272b0f9ef4e1382a0d451dbb44b79b218ee5266bbed317ef8923"
    else
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.3/with-watch-darwin-arm64.tar.gz"
      sha256 "c6871a08ced50b2de6cf29fb1a26c78f9ff586780c444b7edf0af8b76d02b430"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.3/with-watch-linux-amd64.tar.gz"
      sha256 "4ff21d85fa6051597f47cd4587ddadc3d759ecc8807f467bd14dfb138a64cd9d"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.3/with-watch-linux-arm64.tar.gz"
      sha256 "e6db41054cbc3fb6b1c82e77969ad8d521545ab16f5be2e3e15341963fd171fb"
    else
      odie "with-watch prebuilt distribution currently supports Linux amd64 and arm64 only"
    end
  end

  def install
    bin.install "with-watch"
  end

  test do
    assert_predicate bin/"with-watch", :exist?
  end
end
