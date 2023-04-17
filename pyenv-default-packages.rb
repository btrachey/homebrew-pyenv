class PyenvDefaultPackages < Formula
  homepage "https://github.com/btrachey/pyenv-default-packages"
  head "https://github.com/btrachey/pyenv-default-packages.git"
  url "https://github.com/btrachey/pyenv-default-packages/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "fbbfdda598143243a6cb01632fb195f0de00faa425032fd50800181b0784f364"

  depends_on "pyenv"
  depends_on "pyenv-virtualenv" => :recommended

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    assert shell_output("pyenv hooks install").include? "default-packages.bash"
    if build.with? "pyenv-virtualenv"
      assert shell_output("pyenv hooks virtualenv").include? "default-packages.bash"
    end
  end
end
