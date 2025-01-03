class MultiDelogo < Formula
  desc "Detect and remove logos from videos"
  homepage "https://github.com/wernerturing/multi-delogo"
  url "https://github.com/wernerturing/multi-delogo.git"
  version "2.4.0"
  license "GPL-3.0-or-later"
  sha256 "80ff11873ec0e73d9e38b0eb2ffb1586621f0b804093b990e49fdb546476ed6e"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gettext"
  depends_on "glibmm"
  depends_on "goocanvas"
  depends_on "gtkmm3"
  depends_on "opencv"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-silent-rules",
                          *std_configure_args
    system "make", "install"
  end

  test do
    system "#{bin}/multi-delogo", "--version"
  end
end
