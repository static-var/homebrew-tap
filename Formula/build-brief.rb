class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.2/build-brief_0.0.2_darwin_arm64.tar.gz"
      sha256 "1b7d6973da2517a419f24a8e0c2460e2b6841d9de5f96f823cfe67153e253c1f"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.2/build-brief_0.0.2_darwin_amd64.tar.gz"
      sha256 "30255b648c861b2c8e89f6cc001196755090a403723290b31a0095e294e35112"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.2/build-brief_0.0.2_linux_arm64.tar.gz"
      sha256 "ef8e755d8bf0ba6004f49f3b8c458a90e7322b6f098b8163ecd3cbae1fd82ca3"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.2/build-brief_0.0.2_linux_amd64.tar.gz"
      sha256 "3254d3285b90193c49e2287318824c05282d6682681af62c5817717731081447"
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
