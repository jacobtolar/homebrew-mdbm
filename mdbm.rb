require "formula"

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

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
    ENV.deparallelize  # if your formula fails when building in parallel
    # ENV['PATH'] = ENV['PATH'] + ":/usr/local/bin"
    system "make", "install", "PREFIX=#{prefix}" # if this fails, try separate make/make install steps
    system "mkdir", "-p", "#{prefix}/lib"
    system "mv", "#{prefix}/lib64/libmdbm.so.4", "#{prefix}/lib/libmdbm.so.4"
    system "mv", "#{prefix}/lib64/libmdbm.so", "#{prefix}/lib/libmdbm.so"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test mdbm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system %w{mdbm_create /tmp/test.mdbm}
  end
end
