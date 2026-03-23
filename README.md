# dotfiles

Personal shell, editor, and terminal configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## Fresh Install

**1. Install Homebrew**
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**2. Install stow and clone dotfiles**
```sh
brew install stow
git clone git@github.com:aodesser/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

**3. Stow all packages**
```sh
stow zsh bash tmux nvim ghostty atuin git-config starship brewfile claude
```

**4. Install everything from the Brewfile** — [see what gets installed](docs/BREWFILE.md)
```sh
brew bundle --global
```

**5. Apply macOS defaults** — [see what changes](docs/MACOS.md)
```sh
bash ~/.dotfiles/scripts/macos.sh
```

**6. Bootstrap tools (TPM, etc.)**
```sh
bash ~/.dotfiles/scripts/bootstrap.sh
```

**7. Set your Git identity** (not stored in the repo):
```sh
cat > ~/.gitconfig.local << 'EOF'
[user]
	name = Your Name
	email = you@example.com
EOF
```

### Manual steps after install

These can't be automated — do them once after everything above:

| Step | What to do |
|---|---|
| **SSH keys** | Copy from backup or generate new ones (`ssh-keygen -t ed25519`) — never commit private keys |
| **GitHub CLI** | `gh auth login` |
| **JetBrains Toolbox** | Open the app and install your IDEs |
| **1Password** | Sign in to restore credentials |
| **Claude / Ghostty** | Sign in if required |
| **tmux plugins** | If bootstrap failed, open tmux and press `Prefix+I` |

---

Each argument to `stow` is a package — it creates symlinks from that package's contents into `$HOME`.

### What gets symlinked

| Package | Symlink(s) created |
|---|---|
| `zsh` | `~/.zshrc`, `~/.zprofile` |
| `bash` | `~/.bash_profile` |
| `tmux` | `~/.config/tmux/tmux.conf` |
| `nvim` | `~/.config/nvim/init.lua` |
| `ghostty` | `~/.config/ghostty/config` |
| `atuin` | `~/.config/atuin/config.toml` |
| `git-config` | `~/.config/git/config`, `~/.config/git/ignore` |
| `starship` | `~/.config/starship.toml` |
| `brewfile` | `~/.Brewfile` |
| `claude` | `~/.claude/settings.json`, `~/.claude/statusline.sh` |

### To stow a single package

```sh
cd ~/.dotfiles
stow ghostty
```

### To remove a package's symlinks

```sh
cd ~/.dotfiles
stow -D ghostty
```

### To add a new tool

1. Create a package directory mirroring the `$HOME` structure:
   ```sh
   mkdir -p ~/.dotfiles/mytool/.config/mytool
   mv ~/.config/mytool/config ~/.dotfiles/mytool/.config/mytool/config
   ```
2. Run stow:
   ```sh
   cd ~/.dotfiles && stow mytool
   ```
3. Commit and push.

---

## Packages

### `zsh`

Main shell config. Loaded for every new terminal session.

- **Starship** – cross-shell prompt
- **Zinit** – plugin manager; auto-installs on first run
  - `zsh-autosuggestions` – ghost-text suggestions from history
  - `zsh-syntax-highlighting` – real-time command colouring
  - `zsh-completions` – extended completion definitions
  - `fzf-tab` – replaces tab-completion menu with fzf
- **fzf** – fuzzy finder (`Ctrl+R`, `Ctrl+T`, `Alt+C`)
- **zoxide** – smarter `cd` with frecency tracking (`z <dir>`)
- **atuin** – SQLite-backed shell history with fuzzy search
- **Aliases** – `ls`/`ll`/`lt` → `eza`, `cat` → `bat`, `lg` → `lazygit`, `vi`/`vim` → `nvim`

### `bash`

Contains the SDKMAN initialisation block (auto-appended by the SDKMAN installer).

### `tmux`

Config lives at `~/.config/tmux/tmux.conf` (XDG path). Plugins managed by [TPM](https://github.com/tmux-plugins/tpm).

| Feature | Detail |
|---|---|
| Prefix | `Ctrl+Space` |
| Mouse | enabled |
| Theme | Catppuccin Mocha (via `catppuccin/tmux`) |
| Splits | `"` vertical, `%` horizontal, inherit current path |
| Yank | `tmux-yank` — copy to system clipboard |
| Resurrect | `tmux-resurrect` + `tmux-continuum` — auto-save and restore sessions |

Plugins are installed automatically by `scripts/bootstrap.sh`. If needed, run `Prefix+I` inside tmux to manually install or update plugins.

### `nvim`

Neovim config at `~/.config/nvim/init.lua`. Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-installs on first run).

| Plugin | Purpose |
|---|---|
| `telescope.nvim` | Fuzzy finder — files, git, grep, buffers (`<leader>f/g/r/b`) |
| `nvim-tree` | File tree sidebar (`<leader>e/E`) |
| `lualine` | Status line with Catppuccin Mocha theme |
| `gitsigns` | Live git diff signs in the gutter |
| `vim-fugitive` | Full git workflow (`<leader>gs/gc/gp/gl/gd/gb`) |
| `nvim-surround` | Change/add/delete surrounding chars |
| `nvim-autopairs` | Auto-close brackets and quotes |
| `Comment.nvim` | Toggle comments (`gcc`, `gc` in visual) |
| `vim-visual-multi` | Multiple cursors (`Ctrl+N`) |
| `indent-blankline` | Vertical indent guides |
| `nvim-treesitter` | Parser management for syntax highlighting |
| `neoscroll` | Smooth scrolling |
| `alpha-nvim` | Start screen with recent files |
| `catppuccin/nvim` | Catppuccin Mocha colorscheme |

Leader key is `Space`. Split navigation uses `Ctrl+h/j/k/l`.

### `ghostty`

Ghostty terminal config.

| Setting | Value |
|---|---|
| Font | JetBrainsMono Nerd Font, 14pt |
| Theme | Catppuccin Mocha |
| Opacity | 95% |
| Shell integration | cursor, sudo, title |

### `atuin`

Replaces shell history with a SQLite-backed store. Syncs across machines if configured.

### `git-config`

XDG git config at `~/.config/git/`.

| File | Purpose |
|---|---|
| `config` | General git config — delta pager, includes `~/.gitconfig.local` for identity |
| `ignore` | Global gitignore |

### `starship`

Cross-shell prompt configuration.

| Module | What it shows |
|---|---|
| `username` + `hostname` | `user@host` prefix |
| `directory` | Current folder (1 level, bold cyan) |
| `git_branch` | Active branch |
| `git_status` | `+` staged, `~` modified, `-` deleted, `?` untracked |
| `cmd_duration` | Command duration when > 2s |
| `status` | Exit code when last command failed |
| `time` | Current time (right-aligned) |
| `kubernetes` | Active kubectl context/namespace (when set) |
| `aws` | Active AWS profile (when set) |

### `claude`

Claude Code settings and statusline script.

| File | Purpose |
|---|---|
| `settings.json` | Permissions, hooks, spinner, statusline config |
| `statusline.sh` | Custom statusline — shows user, folder, git branch/status, model, context bar, time |

**Hooks configured:**
| Hook | What it does |
|---|---|
| `SessionStart` | Prints session start time to prompt |
| `Stop` | macOS notification when Claude finishes |
| `Notification` | macOS notification for attention requests |
| `PreToolUse(Bash)` | Logs every bash command to `~/.claude/bash-history.log` |
| `PostToolUse(Write\|Edit)` | Logs every file edit to `~/.claude/edits.log` |
