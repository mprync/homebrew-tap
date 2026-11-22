class GitGraft < Formula
  desc "Faster, lighter replacement for git worktree, built for coding agents"
  homepage "https://github.com/mprync/git-graft"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.2.0/git-graft-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb964b558485e40dc4f01bfdeea09b36b914c8d735a76346a67a4a63954bf8b5"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.2.0/git-graft-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "3e9571904cce647ab21dae5741e45b007fe1d49a248749fdd68674263e7ba09f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.2.0/git-graft-0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c48fb181d63885cd5f83ef1aececaae07fef233c6921da640c05b95c9f16a85"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.2.0/git-graft-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "10da2726d23c9fb4669d96c9e45b66c45187bf74ae3cf1c7505de269cca586c6"
    end
  end

  # git-graft needs Git 2.46 or newer at runtime.
  depends_on "git"

  def install
    bin.install "git-graft"
    man1.install "git-graft.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-graft --version")
    # Git finds `git-graft` on PATH and runs it as `git graft`.
    ENV.prepend_path "PATH", bin
    assert_match version.to_s, shell_output("git graft --version")
  end
end
