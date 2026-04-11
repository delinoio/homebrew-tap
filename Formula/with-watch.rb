class WithWatch < Formula
  desc "Watch command inputs and rerun commands when they change"
  homepage "https://github.com/delinoio/oss"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.5/with-watch-darwin-amd64.tar.gz"
      sha256 "e84ea912bc0b3dd572603084275a8fd530248ca419a1274774f14657844831f4"
    else
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.5/with-watch-darwin-arm64.tar.gz"
      sha256 "63ebe74c07990198a7d8540a1add14e2d1bcc83a224498fddd2488c1c5661735"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.5/with-watch-linux-amd64.tar.gz"
      sha256 "4f09bb3a39733eda0cee66cd6e8226e0ce196fd03d966eb83407999d6343b5e9"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.5/with-watch-linux-arm64.tar.gz"
      sha256 "12b44b09a7940cd49d65e8427e3716baf223769e8d48f9d0cebf293be5edb1db"
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
