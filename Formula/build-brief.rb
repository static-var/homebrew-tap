class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.8/build-brief_0.0.8_darwin_arm64.tar.gz"
      sha256 "57396f501cfc618d95e495a6f73bb63e133034c6bec91ee39af54933efd3612a"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.8/build-brief_0.0.8_darwin_amd64.tar.gz"
      sha256 "75073edea1fdf72501a960cfa54528cc107d16021d6a6e34b790ec309c3a5165"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.8/build-brief_0.0.8_linux_arm64.tar.gz"
      sha256 "e94c48540171431aa5b180016295b3d0894ffef413589d6118db5002db621f1a"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.8/build-brief_0.0.8_linux_amd64.tar.gz"
      sha256 "d3b1f5cfb5d715158e70ee38f5c479123265abfaa76ccd44ac71f574e9793852"
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
