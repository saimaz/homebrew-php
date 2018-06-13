require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Grpc < AbstractPhp70Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.12.0.tgz"
  sha256 "1f311ec8ec71e98a88ba950ed97671f05d416fe7c44934d8f7ca5946666f98af"

  def install
    Dir.chdir "grpc-#{version}"
    safe_phpize
    system "./configure", "--enable-grpc=#{HOMEBREW_PREFIX}",
           "--prefix=#{prefix}", phpconfig,
           "CFLAGS=-Ithird_party/boringssl/include"
    system "make"
    prefix.install "modules/grpc.so"
    write_config_file if build.with? "config-file"
  end
end
