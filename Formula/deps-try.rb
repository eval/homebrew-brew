class DepsTry < Formula
  desc "Try out Clojure libraries on rebel-readline"
  homepage "https://github.com/eval/deps-try"
  url "https://github.com/eval/deps-try/releases/download/v0.12.0/deps-try-bb.jar"
  sha256 "42f7f9f59690620a9b6d5a92df337a9a46f9a71ec6b01a167ce9966c454badda"
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
