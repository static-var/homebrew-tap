class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.3/build-brief_0.0.3_darwin_arm64.tar.gz"
      sha256 "73d6ec597845115e35ed19a293cd3e37daa44d3d5b419f0ed4730b71ec6001f1"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.3/build-brief_0.0.3_darwin_amd64.tar.gz"
      sha256 "5ae497fc7eda274a20e5b53ae274ec58edbb6a4a0d9bb72914a1da1090dfb520"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.3/build-brief_0.0.3_linux_arm64.tar.gz"
      sha256 "6963959843d61e0f5ea75ec1597fa5e1fd15896434846c98751c48d2edd19a1b"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.3/build-brief_0.0.3_linux_amd64.tar.gz"
      sha256 "29b7dc8f7b556fe5ce53ca570474e3e2955a6db1968ff707def7485179098e84"
    end
  end

  def install
    binary = Dir["build-brief_*/build-brief"].find { |path| File.file?(path) }
    raise "build-brief binary not found in archive" unless binary

    bin.install binary => "build-brief"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/build-brief --version")
  end
end
