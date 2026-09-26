class MultiDelogo < Formula
  desc "Detect and remove logos from videos"
  homepage "https://github.com/wernerturing/multi-delogo"
  url "https://github.com/wernerturing/multi-delogo/releases/download/v2.6.0/multi-delogo-2.6.0.tar.xz"
  sha256 "cb014e9e1747ad9a355744472886cb77dd4ba94a44c41236ba13e7ca56caf5f1"
  head "https://github.com/wernerturing/multi-delogo.git"
  version "2.6.0"
  license "GPL-3.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gettext"
  depends_on "glibmm@2.90"
  depends_on "gtkmm4"
  depends_on "opencv@4"

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
