require File.expand_path("../../language/php", __FILE__)
require File.expand_path("../../Requirements/php-meta-requirement", __FILE__)

class Behat < Formula
  include Language::PHP::Composer

  desc "BDD framework for PHP to help you test business expectations"
  homepage "http://behat.org/"
  url "https://github.com/Behat/Behat/archive/v3.4.3.tar.gz"
  version "3.4.3"
  sha256 "c34565c1681e580f2e80a2fcefed0e532bfa76b5701c836a9341cea6a95794d5"
  head "https://github.com/Behat/Behat.git"

  depends_on PhpMetaRequirement

  def install
    php_modules = Utils.popen_read("php -m")
    raise "php must be re-compiled, in order to have mbstring support" unless php_modules.include?("mbstring")

    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"bin/envoy"
  end

  test do
    system bin/"behat", "--version"
  end
end
