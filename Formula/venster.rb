class Venster < Formula
  desc "Render the README's Links-section in the terminal"
  homepage "https://github.com/eval/venster"
  url "https://github.com/eval/venster/releases/download/v0.2.0/venster-bb.jar"
  sha256 "0d77be172759f13263c11730a7b0ccfeea85d5a54d85ce9648deb8523c6b015d"
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
