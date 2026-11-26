class GitGraft < Formula
  desc "Faster, lighter replacement for git worktree, built for coding agents"
  homepage "https://github.com/mprync/git-graft"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.3.0/git-graft-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "22f9ac63c82571ca227af5fd01fa93ae419ffc00d51f41e8ac3c2165fad600b8"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.3.0/git-graft-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "6cdcb76eb6c5dadec35bd19617038530b860179b262581dcdf39b5ab788fb31c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mprync/git-graft/releases/download/v0.3.0/git-graft-0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "26bb513884016f4c8af36f513cf40c05bf580c8c54238a1643ee8d8857f139e6"
    end
    on_intel do
      url "https://github.com/mprync/git-graft/releases/download/v0.3.0/git-graft-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "77298853929c5dc42975a0b358420fc60fd151a0b7213e4ee724b8be8c67710a"
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
