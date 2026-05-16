class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.10/build-brief_0.0.10_darwin_arm64.tar.gz"
      sha256 "5b60b43780b543ae461c255595ae9747a19e3edda11b20d463fb0e5b7d6b4c53"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.10/build-brief_0.0.10_darwin_amd64.tar.gz"
      sha256 "ed86baae18301d63a24771d5a8417745e11e850043a261ce218b27343b33e6dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.10/build-brief_0.0.10_linux_arm64.tar.gz"
      sha256 "6309585fd7538b2123409ae8658809784bfcf90c2ba13ea5c166c804c0b394bf"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.10/build-brief_0.0.10_linux_amd64.tar.gz"
      sha256 "8b4370c491bf375e6f700c5cc71d1c0812a289144f5a6ba8002b9bd2c5a05139"
    end
  end

  def install
    binary = ["build-brief", *Dir["build-brief_*/build-brief"].sort].find { |path| File.file?(path) }
    raise "build-brief binary not found in archive" unless binary

    bin.install binary => "build-brief"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/build-brief --version")
  end
end
