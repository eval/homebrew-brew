class DepsTry < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.3.6/deps-try.jar"
  sha256 "8753ffbc526699744559177ac34bd6a1c74d991c82e387208b552cbaa2f7a738"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/nightly/deps-try.jar"

  depends_on "borkdude/brew/babashka"
  depends_on "clojure/tools/clojure"

  def install
    libexec.install "deps-try.jar"

    (bin/"deps-try").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/deps-try.jar"
    EOS
  end

  test do
    `deps-try -h`
  end
end
