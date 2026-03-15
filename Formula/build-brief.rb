class BuildBrief < Formula
  desc "Reduce noisy Gradle output into concise build summaries"
  homepage "https://github.com/static-var/build-brief"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v#{version}/build-brief_#{version}_darwin_arm64.tar.gz"
      sha256 "d977f68814c525b2f389cbb8f44d14c1734458f559f6cd894a918dde4afdd29a"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v#{version}/build-brief_#{version}_darwin_amd64.tar.gz"
      sha256 "e9ce150dcf42a8d6900a3a44d86c7b97012bc00ee1fccc7311ff28e3e7fa81df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/static-var/build-brief/releases/download/v#{version}/build-brief_#{version}_linux_arm64.tar.gz"
      sha256 "23c87add4d5b137313fd56bcfbfd9056f677dfcd72d14082149c7e807086a873"
    elsif Hardware::CPU.intel?
      url "https://github.com/static-var/build-brief/releases/download/v#{version}/build-brief_#{version}_linux_amd64.tar.gz"
      sha256 "557946f9b697018d99562cba7a161080f6f666060f84d397f1c0621a184bccd1"
    end
  end

  def install
    binary = Dir["**/build-brief"].find { |path| File.file?(path) }
    raise "build-brief binary not found in archive" unless binary

    bin.install binary => "build-brief"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/build-brief --version")
  end
end
