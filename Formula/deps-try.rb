class DepsTry < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.3.9/deps-try.zip"
  sha256 "d2ed407df7f77614e781e58718ba1027b987ae66fc2f2766953a0ac8c3155bb9"
  license "MIT"
  head "https://github.com/eval/deps-try/releases/download/unstable/deps-try.zip"

  depends_on "borkdude/brew/babashka"
  depends_on "clojure/tools/clojure"

  def install
    with_env(
      "CLJ_CACHE" => ".cpcache",
    ) do
      system "bb", "uberjar", "deps-try.jar", "-m", "eval.deps-try"
    end
    libexec.install "deps-try.jar"

    (bin/"deps-try").write <<~EOS
      #!/bin/sh
      exec "#{Formula["babashka"].opt_bin}/bb" "#{libexec}/deps-try.jar" "$@"
    EOS
  end

  test do
    `deps-try -v`
  end
end
