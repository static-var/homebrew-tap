class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.5/build-brief_0.0.5_darwin_arm64.tar.gz"
      sha256 "89d92d63b5d1e684532b956466db256101c4f3c88ed0e43664b21e9f4a78f95b"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.5/build-brief_0.0.5_darwin_amd64.tar.gz"
      sha256 "55a138e3b819792d9220bc05b789a5cfa420904f1b2ed8786f79628520c4558c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.5/build-brief_0.0.5_linux_arm64.tar.gz"
      sha256 "4b0d7c0c42fbee790a0f6e05db7b4a84b6c806af45ec20fea2a1c1152278db99"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.5/build-brief_0.0.5_linux_amd64.tar.gz"
      sha256 "286d84cd1a1099bbe83552f39a7712fccc280838a44d85802eca5c1cedf89fdd"
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
