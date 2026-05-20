class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://bb.staticvar.dev"
  version "0.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.11/build-brief_0.0.11_darwin_arm64.tar.gz"
      sha256 "162bf3fe0e0d73a0f8d0cd5ed588b28035ded3e822224ec1fd6a3793966a4aea"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.11/build-brief_0.0.11_darwin_amd64.tar.gz"
      sha256 "e93cc98ce4c5be527c8c73af9e5194622c9358ce23980a4b27449de0ac971d83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.11/build-brief_0.0.11_linux_arm64.tar.gz"
      sha256 "4ca4b06905e1828265d9f77e9b6faeaedd9006a1d216745a30f2756fd9bd16bd"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v0.0.11/build-brief_0.0.11_linux_amd64.tar.gz"
      sha256 "b331416db40ec479096fd7c8c3176839b11d8c6c0dfde16ebfcbbca4cf696b76"
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
