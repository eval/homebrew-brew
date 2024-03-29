class Bbang < Formula
  desc "Render the README's Links-section in the terminal"
  homepage "https://github.com/eval/bbangsearch"
  url "https://github.com/eval/bbangsearch/releases/download/v0.7.0/bbang-bb.jar"
  sha256 "96e8b822bbb22e49c8aadb7d606cd92f62208108e0d486585bd20d4b613d2bb3"
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
