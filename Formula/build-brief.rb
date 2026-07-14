class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.0/build-brief_0.2.0_darwin_arm64.tar.gz"
      sha256 "d5c888a13664d444a74fc890cc44864af423da8d64f0025f4f88781b15625ac5"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.0/build-brief_0.2.0_darwin_amd64.tar.gz"
      sha256 "62e868a6b4e3b002d79d4b7cfb0a273145d97d6d6ccb6537ca8179c6ab3aede6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.0/build-brief_0.2.0_linux_arm64.tar.gz"
      sha256 "0edf34ad7462a2dd08ebba47788c18911871d6a544d112be5bb83870503e6a4d"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.2.0/build-brief_0.2.0_linux_amd64.tar.gz"
      sha256 "1f6c8756b1d172ae23296915956319ade7cb55a554170ec6ea389217ffd09815"
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
