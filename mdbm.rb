require "formula"

class Mdbm < Formula
  homepage "http://yahooeng.tumblr.com/post/104861108931/mdbm-high-speed-database"
  url "https://github.com/yahoo/mdbm/archive/osx.tar.gz"
  sha1 "8454f14d98043acfd1fbc0659369ce3b9c1e3a8f"
  version "4.11.2"

  depends_on "coreutils"
  depends_on "cppunit"
  depends_on "readline"
  depends_on "openssl"

  def install
    system "make", "install", "PREFIX=#{prefix}"
    system "mkdir", "-p", "#{prefix}/lib"
    system "mv", "#{prefix}/lib64/libmdbm.so.4", "#{prefix}/lib/libmdbm.so.4"
    system "mv", "#{prefix}/lib64/libmdbm.so", "#{prefix}/lib/libmdbm.so"
  end

  test do
    system %w{mdbm_create /tmp/test.mdbm}
  end
end
