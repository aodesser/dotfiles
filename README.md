# dotfiles

Personal shell, editor, and terminal configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

---

## Fresh Install

```sh
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install stow and clone dotfiles
brew install stow
git clone git@github.com:aodesser/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 3. Stow all packages
stow zsh bash tmux vim ghostty atuin git-home git-config starship brewfile

# 4. Install everything from Brewfile
brew bundle --global

# 5. Apply macOS defaults
bash ~/.dotfiles/scripts/macos.sh
```

Then create your local Git identity file (not stored in the repo):

```sh
cat > ~/.gitconfig.local << 'EOF'
[user]
	name = Your Name
	email = you@example.com
EOF
```

Then apply macOS system defaults:

```sh
bash ~/.dotfiles/scripts/macos.sh
```

Each argument to `stow` is a package — it creates symlinks from that package's contents into `$HOME`.

### What gets symlinked

| Package | Symlink(s) created |
|---|---|
| `zsh` | `~/.zshrc`, `~/.zprofile` |
| `bash` | `~/.bash_profile` |
| `tmux` | `~/.tmux.conf` |
| `vim` | `~/.vimrc` |
| `ghostty` | `~/.config/ghostty/config` |
| `atuin` | `~/.config/atuin/config.toml` |
| `git-home` | `~/.gitconfig` |
| `git-config` | `~/.config/git/ignore` |
| `starship` | `~/.config/starship.toml` |
| `brewfile` | `~/.Brewfile` |

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
- **Aliases** – `ls`/`ll`/`lt` → `eza`, `cat` → `bat`, `lg` → `lazygit`

### `bash`

Contains the SDKMAN initialisation block (auto-appended by the SDKMAN installer).

### `tmux`

Full tmux configuration with a Catppuccin Mocha colour scheme.

| Feature | Detail |
|---|---|
| Prefix | `Ctrl+A` |
| Vi copy mode | `v` to select, `y` to yank → `pbcopy` |
| Splits | `\|` horizontal, `-` vertical, inherit current path |
| Pane nav | `h/j/k/l` (mirrors Vim) |
| Status bar | Top-mounted; turns purple when a pane is zoomed |
| Scratchpad | `Prefix+Space` – floating terminal |
| Sessionizer | `Prefix+f` – fzf picker over sessions |
| Project mode | `Prefix+P` – `fd` search into `~/Code`, `~/Projects` |

### `vim`

Vim config using **vim-plug** and **Catppuccin Mocha**. Leader key is `Space`.

| Plugin | Purpose |
|---|---|
| fzf / fzf.vim | Fuzzy file/buffer/grep search (`<leader>f/g/r`) |
| NERDTree | File-tree sidebar (`<leader>e`) |
| lightline | Minimal status line |
| vim-fugitive | Git workflow inside Vim |
| vim-gitgutter | Live diff signs |
| vim-surround | Change surrounding chars |
| auto-pairs | Auto-close brackets/quotes |
| vim-commentary | Toggle comments (`gcc`) |
| vim-visual-multi | Multiple cursors (`Ctrl+N`) |
| vim-polyglot | Syntax highlighting for 100+ languages |

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

### `git-home`

`~/.gitconfig` — user identity and git-delta as the pager for rich diffs.

### `git-config`

`~/.config/git/ignore` — global gitignore.

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
