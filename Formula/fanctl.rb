class Fanctl < Formula
  desc "Command-line tool for controlling Apple Silicon Mac fan speeds"
  homepage "https://github.com/HaiH1ep/fanctl"
  version "0.2.1"
  url "https://github.com/HaiH1ep/fanctl/releases/download/v#{version}/fanctl-v#{version}-arm64-macos.tar.gz"
  sha256 "254d90b37c31b5d6ab46fa139a874e86107a3e937cd87b6bd5cf6c2350b79180"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "fanctl"
  end

  def caveats
    <<~EOS
      fanctl requires sudo for setting fan speeds:
        sudo fanctl set 0 2000
        sudo fanctl reset

      Reading temperatures works without sudo:
        fanctl
        fanctl monitor
    EOS
  end

  test do
    assert_match "fanctl", shell_output("#{bin}/fanctl --help")
  end
end
