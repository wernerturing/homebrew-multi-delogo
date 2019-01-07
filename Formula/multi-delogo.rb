class MultiDelogo < Formula
  desc "Detect and remove logos from videos"
  homepage "https://github.com/wernerturing/multi-delogo"
  url "https://github.com/wernerturing/multi-delogo.git",
      :branch => "opencv4"
  version "2.3.0"
  sha256 "80ff11873ec0e73d9e38b0eb2ffb1586621f0b804093b990e49fdb546476ed6e"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "boost" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gettext"
  depends_on "glibmm"
  depends_on "goocanvasmm"
  depends_on "gtkmm3"
  depends_on "opencv"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/multi-delogo", "--version"
  end
end
