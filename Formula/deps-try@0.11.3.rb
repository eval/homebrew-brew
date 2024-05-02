class DepsTryAT0113 < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.11.3/deps-try-bb.jar"
  sha256 "fcd4a2f207aa3f13f4abe77e85447fe5d98be00b6902cb97afdd9990bf6880dc"
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
