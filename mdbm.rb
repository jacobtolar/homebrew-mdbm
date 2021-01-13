class Mdbm < Formula
  desc "super-fast memory-mapped key/value store."
  homepage "http://yahooeng.tumblr.com/post/104861108931/mdbm-high-speed-database"
  url "https://github.com/yahoo/mdbm/archive/v4.13.0.tar.gz", :fork_ok => true
  sha256 "99cec32e02639048f96abf4475eb3f97fc669541560cd030992bab155f0cb7f8"

  depends_on "coreutils"
  depends_on "cppunit"
  depends_on "readline"
  depends_on "openssl"

  def install
    ENV.delete "CC"
    ENV.delete "CXX"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    mdbm = "/tmp/test-brew.mdbm"
    system "mdbm_create", mdbm
    assert File.exist? mdbm
  end
end
