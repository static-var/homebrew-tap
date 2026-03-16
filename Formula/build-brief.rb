class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.4/build-brief_0.0.4_darwin_arm64.tar.gz"
      sha256 "75b5091f5485101ff0a24edc519ec0b6775edeb5c98b66916ac061d239ddde4e"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.4/build-brief_0.0.4_darwin_amd64.tar.gz"
      sha256 "dfe457f87412c700f03e6dbdf3013d09dd50e9e8e72130e7f58298398055e068"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.4/build-brief_0.0.4_linux_arm64.tar.gz"
      sha256 "08c6048997186eb5b85400f80223da2fafc1c3b6242a63fe8a8c549f614edb9f"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.4/build-brief_0.0.4_linux_amd64.tar.gz"
      sha256 "32e3a9dd1e3383c1c027bae9ef31e6ed037e8dce5a6c11821035a7cd72a9a977"
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
