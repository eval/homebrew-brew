class Bbang < Formula
  desc "Render the README's Links-section in the terminal"
  homepage "https://github.com/eval/bbangsearch"
  url "https://github.com/eval/bbangsearch/releases/download/v0.6.0/bbang-bb.jar"
  sha256 "0d77be172759f13263c11730a7b0ccfeea85d5a54d85ce9648deb8523c6b015d"
  license "MIT"
  head "https://github.com/eval/bbangsearch/releases/download/unstable/bbang-bb.jar"

  depends_on "borkdude/brew/babashka"

  def install
    libexec.install "bbang-bb.jar"

    (bin/"bbang").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/bbang-bb.jar" "$@"
    EOS
  end

  test do
    `bbang -v`
  end
end
