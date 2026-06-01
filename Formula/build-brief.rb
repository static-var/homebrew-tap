class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.12/build-brief_0.0.12_darwin_arm64.tar.gz"
      sha256 "b06caa3d5ae583b774f0c73582f3cff2a435af447e0bd978c5a01580df1936a5"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.12/build-brief_0.0.12_darwin_amd64.tar.gz"
      sha256 "51fc8f72d0ab2a3dd369ecf792765eea61e925f4cb6757052bc339560075f797"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.12/build-brief_0.0.12_linux_arm64.tar.gz"
      sha256 "62a27c8f26bc7fdad3bea4c816a5522779813f0d4e5ebbb0b757595a91409b90"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.12/build-brief_0.0.12_linux_amd64.tar.gz"
      sha256 "96fc7cfab133fcd718be0ad1fa2c1e0662b7d83e2710ad84674eeb55b80f542d"
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
