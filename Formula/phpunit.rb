require File.expand_path("../../Abstract/abstract-php-phar", __FILE__)

class Phpunit < AbstractPhpPhar
  init
  desc "Programmer-oriented testing framework for PHP"
  homepage "https://phpunit.de"
  url "https://phar.phpunit.de/phpunit-7.3.1.phar"
  sha256 "fd89749ab7c12b947607a899f9496436f6648564f7501f380f4d8a2fe6dcc391"

  bottle :unneeded

  def phar_file
    "phpunit-#{version}.phar"
  end

  test do
    shell_output("#{bin}/phpunit --version").include?(version)
  end
end
