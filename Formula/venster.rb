class Venster < Formula
  desc "Render the README's Links-section in the terminal"
  homepage "https://github.com/eval/venster"
  url "https://github.com/eval/venster/releases/download/v0.1.0/venster-bb.jar"
  sha256 "f25846fbc34834bfebfa695a2ca9cfe6bdb33afd146d48968128f0defe072342"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/unstable/venster-bb.jar"

  depends_on "borkdude/brew/babashka"
  depends_on "glow"

  def install
    libexec.install "venster-bb.jar"

    (bin/"venster").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/venster-bb.jar" "$@"
    EOS
  end

  test do
    `venster -v`
  end
end
