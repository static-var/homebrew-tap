class Nearleaf < Formula
  desc "Your Nearleaf note and drawing in the terminal, for you and your coding agents"
  homepage "https://nearleaf.page"
  version "1.1.2"

  on_macos do
    depends_on arch: :arm64

    url "https://downloads.nearleaf.page/cli/1.1.2/nearleaf_1.1.2_darwin_arm64.tar.gz"
    sha256 "1f1935970826415dcf0ff2efee602d9fac27de935b9be498d495fb122dac91fd"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.nearleaf.page/cli/1.1.2/nearleaf_1.1.2_linux_arm64.tar.gz"
      sha256 "6507aa6972a6c63e9efb6d1ffc26fc80ff4cdfca6786f30ab5214b9d1bbe90fc"
    elsif Hardware::CPU.intel?
      url "https://downloads.nearleaf.page/cli/1.1.2/nearleaf_1.1.2_linux_amd64.tar.gz"
      sha256 "eaaea04d4e4153f1b6790b1ea34d41017e822aa04e1253e557fc1a55d4f94e91"
    end
  end

  def install
    bin.install "nearleaf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nearleaf --version")
  end
end
