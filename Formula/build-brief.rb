class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.6/build-brief_0.0.6_darwin_arm64.tar.gz"
      sha256 "989d0852a44d0b9f5fad36e8c65507ee58dcd6e773e59dd2e021cd34989fd30b"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.6/build-brief_0.0.6_darwin_amd64.tar.gz"
      sha256 "8760cdd87ea399c0088a1e2d9329821b732cc851d77cf05ec340cbe87902b3f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.6/build-brief_0.0.6_linux_arm64.tar.gz"
      sha256 "36b954e15ee43d02fadd0855d4800a342f998cc92b8cb75b34f33f539cba9e54"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.6/build-brief_0.0.6_linux_amd64.tar.gz"
      sha256 "bb003f0dccc9fdf956226db4c04726f8a41aa0a51f9c748db4f73bfa6e408e83"
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
