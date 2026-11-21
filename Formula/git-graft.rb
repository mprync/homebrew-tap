class GitGraft < Formula
  desc "Faster, lighter replacement for git worktree, built for coding agents"
  homepage "https://github.com/mprync/git-graft"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.1.0/git-graft-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "38e09a213c8aa415498f5fa3657fa29cb6e7d7dfc218e5c53a8a393ce3165ad1"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.1.0/git-graft-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec9db271824c6c3fcac0f702faee99db0e7942a7bc2be84662addfcb0462c8cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.1.0/git-graft-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57b93ee4f5fdc1ad2ae72d4264ab5b1ed3cd7d5c0f182bb0c955525d9fb60222"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.1.0/git-graft-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f6431fe2a0979333365b74f9fb987deb7eb4d5cbe9211cba74ee2ac870681985"
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
