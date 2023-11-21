class BbangAT060 < Formula
  desc "Render the README's Links-section in the terminal"
  homepage "https://github.com/eval/bbangsearch"
  url "https://github.com/eval/bbangsearch/releases/download/v0.6.0/bbang-bb.jar"
  sha256 "5a108bc0e0e1c7e8d4be90b7f997f5d7d630c1215e75b36ed5c1b5fb3208cbaf"
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
