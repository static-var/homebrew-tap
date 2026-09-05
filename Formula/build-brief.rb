class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.1/build-brief_0.2.1_darwin_arm64.tar.gz"
      sha256 "70c2f451358bbc13503a13f7edbf78a69ce367aa0f616bdaec7a9076a4403c62"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.1/build-brief_0.2.1_darwin_amd64.tar.gz"
      sha256 "0d1abccb32dbe6d54b32aeff32910767a1fa29fee937371b4292ecfd974502a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.1/build-brief_0.2.1_linux_arm64.tar.gz"
      sha256 "d7cff9d55fe45736d671dc7a42b1a9ab126afad322b56acdcf3155d19c282212"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.1/build-brief_0.2.1_linux_amd64.tar.gz"
      sha256 "725a492380bdc6bad5882659c7ee5ffa253faf4631dc43cb2df6e7628055fac9"
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
