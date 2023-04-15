class DepsTryAT039 < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.3.9/deps-try-bb.jar"
  sha256 "d8338c15db553880ec64afd20dbf524ba19a31c892adab0e5d5799073950fa98"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/unstable/deps-try-bb.jar"

  depends_on "borkdude/brew/babashka"
  depends_on "clojure/tools/clojure"

  def install
    libexec.install "deps-try-bb.jar"

    (bin/"deps-try").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/deps-try-bb.jar" "$@"
    EOS
  end

  test do
    `deps-try -v`
  end
end
