class WithWatch < Formula
  desc "Watch command inputs and rerun commands when they change"
  homepage "https://github.com/delinoio/oss"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.4/with-watch-darwin-amd64.tar.gz"
      sha256 "60b2bdbda9eb4d6dc3164e0202f380ed8b04671713b9e8ba1e8031007b69b52e"
    else
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.4/with-watch-darwin-arm64.tar.gz"
      sha256 "b3534630136e8d2ac821c51328c912a2e360cf9bba8193232a8cc0ed5168910a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.4/with-watch-linux-amd64.tar.gz"
      sha256 "a56c7d112efe27a1035858f5b2acdac86b91ff3dbd6876fff10c11e8bf820943"
    elsif Hardware::CPU.arm?
      url "https://github.com/delinoio/oss/releases/download/with-watch@v0.1.4/with-watch-linux-arm64.tar.gz"
      sha256 "2040473a18fdcec081b984da40b1c86c203e7e10cf1e96ac88d2df580c1ee5a2"
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
