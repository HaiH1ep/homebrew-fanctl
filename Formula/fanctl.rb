class Fanctl < Formula
  desc "Command-line tool for controlling Apple Silicon Mac fan speeds"
  homepage "https://github.com/haihiepnguyen/fanctl"
  version "0.2.0"
  url "https://github.com/haihiepnguyen/fanctl/releases/download/v#{version}/fanctl-v#{version}-arm64-macos.tar.gz"
  # Replace with actual sha256 after first release:
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
