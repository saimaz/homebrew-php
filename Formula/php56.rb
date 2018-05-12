require File.expand_path("../../Abstract/abstract-php", __FILE__)

class Php56 < AbstractPhp
  init
  desc "PHP Version 5.6"
  include AbstractPhpVersion::Php56Defs

  url PHP_SRC_TARBALL
  sha256 PHP_CHECKSUM[:sha256]
  revision 11

  head PHP_GITHUB_URL, :branch => PHP_BRANCH

  def php_version
    "5.6"
  end

  def php_version_path
    "56"
  end
end
