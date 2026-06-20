class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.1.0/build-brief_0.1.0_darwin_arm64.tar.gz"
      sha256 "93df69ad954c13645df3f2b43d798b6bb76120e139c8e1cc3e95030f0d275d1d"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.1.0/build-brief_0.1.0_darwin_amd64.tar.gz"
      sha256 "af0f72f4879f547e6b8a18a2f4c04b57da611f4e2fe6da80df83b765f4e009a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.1.0/build-brief_0.1.0_linux_arm64.tar.gz"
      sha256 "b3041225317c448eb877f1756268a43b5b98fa848b49d2a13aafeeea5ba9a330"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.1.0/build-brief_0.1.0_linux_amd64.tar.gz"
      sha256 "d238348765fc33eac094949c3f4672345da36309e167c55ef24bd33c26a2b383"
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
