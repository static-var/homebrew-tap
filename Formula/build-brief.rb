class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.7/build-brief_0.0.7_darwin_arm64.tar.gz"
      sha256 "dddc7964104c4c27cc4a0dbc075e8d288c9154ce4983fd45fd0cfd8fb2f8eee8"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.7/build-brief_0.0.7_darwin_amd64.tar.gz"
      sha256 "2875394c9c949be337dd6e0ff5027b1538fc29db105356da20c926a4777df045"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.7/build-brief_0.0.7_linux_arm64.tar.gz"
      sha256 "823afc5826c1b4d91a7ee889d7925bc6991583526c9088ac0e306422ef596c8c"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.7/build-brief_0.0.7_linux_amd64.tar.gz"
      sha256 "1840b23a57a80355e1a8780c582f5175bcc0580bce7117ab4ec0f344ed5ea6df"
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
