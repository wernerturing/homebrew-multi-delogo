class MultiDelogo < Formula
  desc "Detect and remove logos from videos"
  homepage "https://github.com/wernerturing/multi-delogo"
  url "https://github.com/wernerturing/multi-delogo/releases/download/v2.5.0/multi-delogo-2.5.0.tar.xz"
  sha256 "2fe97c4c17ad90bad27133b925df4aafebb8175167e3fee9a26d93148d538d87"
  head "https://github.com/wernerturing/multi-delogo.git"
  version "2.5.0"
  license "GPL-3.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gettext"
  depends_on "glibmm"
  depends_on "goocanvas"
  depends_on "gtkmm3"
  depends_on "opencv"

  def install
    boost = Formula["boost"]

    system "./autogen.sh" if build.head?
    system "./configure", "--disable-silent-rules",
                          "--with-boost-libdir=#{boost.opt_lib}",
                          *std_configure_args
    system "make", "install"
  end

  test do
    system "#{bin}/multi-delogo", "--version"
  end
end
