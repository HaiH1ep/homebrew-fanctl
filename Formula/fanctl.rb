class Fanctl < Formula
  desc "Command-line tool for controlling Apple Silicon Mac fan speeds"
  homepage "https://github.com/haihiepnguyen/fanctl"
  version "0.1.0"
  url "https://github.com/haihiepnguyen/fanctl/releases/download/v#{version}/fanctl-v#{version}-arm64-macos.tar.gz"
  # Replace with actual sha256 after first release:
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

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
