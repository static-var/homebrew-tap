class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.9/build-brief_0.0.9_darwin_arm64.tar.gz"
      sha256 "b70395dee093e375d42a43bfd2bdc4f401a4e3bd42512ac07776ea9476f76ce6"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.9/build-brief_0.0.9_darwin_amd64.tar.gz"
      sha256 "6c2e20ec81c10d5014291129d109ce6199b379ca650ee2314c71d7f4ace7d757"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.9/build-brief_0.0.9_linux_arm64.tar.gz"
      sha256 "d73b8610cd08d8e1a0e9b906b0933d750f857ea043644a537ab1faac5b9f3b39"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.9/build-brief_0.0.9_linux_amd64.tar.gz"
      sha256 "619ae2780535823729c1d7c2f068721dd30fc346aee386b0474867a8726ec7f3"
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
