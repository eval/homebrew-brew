class DepsTryAT038 < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.3.8/deps-try.jar"
  sha256 "19e7bdc992115823f461b5e005af55d5a64b004b49181c9321370b23536d8a70"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/unstable/deps-try.jar"

  depends_on "borkdude/brew/babashka"
  depends_on "clojure/tools/clojure"

  def install
    libexec.install "deps-try.jar"

    (bin/"deps-try").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/deps-try.jar" "$@"
    EOS
  end

  test do
    `deps-try -h`
  end
end
