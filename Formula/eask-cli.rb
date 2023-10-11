require "language/node"

class EaskCli < Formula
  name "Eask CLI"
  desc "A set of command-line tools to build Emacs packages"
  homepage "https://emacs-eask.github.io/"
  license "GPLv3"

  url "https://registry.npmjs.org/@emacs-eask/cli/-/cli-#{version}.tgz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "node"

  def install
    bin.install "cli-#{version}"
  end
end
