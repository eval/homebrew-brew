class DepsTryAT070 < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.7.0/deps-try-bb.jar"
  sha256 "0c247d688b386032a8df35dc3df7ca08881d16e11ab988d3e239cbdc8d7a003f"
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
