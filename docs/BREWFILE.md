# Brewfile

All packages installed via `brew bundle --global`. To update after installing new tools, run:

```sh
brew bundle dump --file=~/.Brewfile --force
```

---

## CLI Tools

| Package | What it does |
|---|---|
| `atuin` | Replaces shell history with a searchable SQLite store |
| `bat` | `cat` replacement with syntax highlighting and line numbers |
| `eza` | `ls` replacement with icons, git status, and tree view |
| `fd` | Fast and user-friendly alternative to `find` |
| `ffind` | Fuzzy file finder |
| `fzf` | General-purpose fuzzy finder used across shell, vim, and tmux |
| `gh` | GitHub CLI — manage PRs, issues, and repos from the terminal |
| `git-delta` | Syntax-highlighted diff pager for git |
| `jq` | JSON processor for the command line |
| `lazygit` | Terminal UI for git |
| `mactop` | macOS system monitor (CPU, GPU, memory) in the terminal |
| `ripgrep` | Extremely fast `grep` replacement |
| `starship` | Cross-shell prompt |
| `stow` | Symlink manager for dotfiles |
| `tldr` | Simplified man pages with practical examples |
| `tmux` | Terminal multiplexer — split panes, sessions, windows |
| `vim` | Terminal text editor |
| `wget` | File downloader |
| `zoxide` | Smarter `cd` with frecency tracking (`z <dir>`) |
| `zsh-autosuggestions` | Ghost-text command suggestions from history |
| `mole` | SSH tunnel manager |
| `direnv` | Loads/unloads environment variables per directory |
| `ast-grep` | Structural code search and rewrite tool |
| `memo` | Quick command-line note taking |

## Media & Documents

| Package | What it does |
|---|---|
| `ffmpeg` | Audio/video converter and processor |
| `ghostscript` | PDF and PostScript interpreter |
| `tectonic` | Modern LaTeX compiler |

## Languages & Runtimes

| Package | What it does |
|---|---|
| `bash` | Latest version of Bash (macOS ships an outdated one) |
| `go` | Go programming language |
| `julia` | Julia programming language |
| `lua@5.4` | Lua scripting language |
| `luarocks` | Lua package manager |
| `node` | Node.js JavaScript runtime |
| `php` | PHP runtime |
| `composer` | PHP dependency manager |

## Kubernetes & DevOps

| Package | What it does |
|---|---|
| `kubernetes-cli` | `kubectl` — Kubernetes command-line tool |
| `xcodegen` | Generate Xcode projects from a YAML spec |

## System Monitoring

| Package | What it does |
|---|---|
| `asitop` | Apple Silicon performance monitor (CPU, GPU, ANE) |
| `cmatrix` | The Matrix-style terminal animation |

---

## macOS Apps (Casks)

### Development

| App | What it does |
|---|---|
| `ghostty` | Terminal emulator |
| `iterm2` | Alternative terminal emulator |
| `docker-desktop` | Docker container runtime and GUI |
| `jetbrains-toolbox` | Manager for JetBrains IDEs (IntelliJ, etc.) |
| `macvim-app` | Vim with a native macOS GUI |
| `codex` | OpenAI Codex CLI |
| `codex-app` | OpenAI Codex desktop app |
| `claude` | Anthropic Claude desktop app |
| `claude-code` | Claude Code CLI |

### Utilities

| App | What it does |
|---|---|
| `logi-options+` | Logitech mouse and keyboard customization |
| `home-assistant` | Home automation dashboard |
| `vlc` | Media player |
| `handbrake-app` | Video transcoder |
| `bambu-studio` | 3D printing slicer for Bambu Lab printers |

### Fonts

| Font | What it does |
|---|---|
| `font-jetbrains-mono-nerd-font` | Main terminal font with Nerd Font icons |
| `font-hack-nerd-font` | Alternative monospace Nerd Font |
