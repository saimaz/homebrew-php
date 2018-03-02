require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Protobuf < AbstractPhp72Extension
  init
  desc "Google's language-neutral, platform-neutral, extensible mechanism for serializing structured data."
  homepage "https://pecl.php.net/package/protobuf"
  url "https://pecl.php.net/get/protobuf-3.5.1.1.tgz"
  sha256 "5f7bb3921b312d4fd7d1d6a56a7d90d63ade5e0821a07c6da56d2d2ba17df027"

  depends_on "protobuf"

  def install
    Dir.chdir "protobuf-#{version}"
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/protobuf.so"
    write_config_file if build.with? "config-file"
  end
end
