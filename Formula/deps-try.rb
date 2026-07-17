class DepsTry < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.13.0/deps-try-bb.jar"
  sha256 "220355eb01ec45607a82d6cc7390df64787471ac150c424b2bdd40ddaa951d40"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/unstable/deps-try-bb.jar"

  depends_on "babashka"
  depends_on "clojure"

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
