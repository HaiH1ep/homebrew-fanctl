class Fanctl < Formula
  desc "Command-line tool for controlling Apple Silicon Mac fan speeds"
  homepage "https://github.com/HaiH1ep/fanctl"
  version "0.2.0"
  url "https://github.com/HaiH1ep/fanctl/releases/download/v#{version}/fanctl-v#{version}-arm64-macos.tar.gz"
  sha256 "395a65d834e0236bb0fc504a3cdd1835da1e2f7947bd58537a843bb787364cfb"

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
