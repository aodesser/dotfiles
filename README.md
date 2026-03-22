# dotfiles

Personal shell and editor configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Installation

```sh
git clone git@github.com:aodesser/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow .
```

`stow .` symlinks every tracked file from this directory into `$HOME`.

---

## Files

### `.zprofile`
Runs once at login for zsh. Initialises **Homebrew** (`/opt/homebrew`) so that all brew-installed binaries are available in `$PATH` before any interactive shell starts.

### `.zshrc`
Main interactive-shell config. Loaded for every new terminal tab/window.

- **SDKMAN** – Java/Kotlin SDK version manager, sourced first so the shim is available.
- **Starship** – cross-shell prompt (`starship init zsh`).
- **Zinit** – lightweight zsh plugin manager; auto-installs itself on first run.
  - `zsh-autosuggestions` – ghost-text suggestions from history.
  - `zsh-syntax-highlighting` – real-time command colouring.
  - `fzf-tab` – replaces the default tab-completion menu with fzf.
- **fzf** – fuzzy finder keybindings and completion (`Ctrl+R`, `Ctrl+T`, `Alt+C`).
- **zoxide** – smarter `cd` with frecency tracking (`z <dir>`).
- **atuin** – replaces shell history with a SQLite-backed, searchable store.
- **Aliases** – `ls`/`ll`/`lt` → `eza`, `cat` → `bat`, `lg` → `lazygit`.
- **git-delta** – configures `delta` as the global git pager for rich diffs.

### `.bash_profile`
Loaded by bash at login. Contains the **SDKMAN** initialisation block that the SDKMAN installer appends automatically. Kept here so the installer's requirement ("must be at end of file") is satisfied without touching `.zprofile`.

### `.tmux.conf`
Full tmux configuration with a **Catppuccin Mocha**-inspired colour scheme.

Key choices:
| Feature | Detail |
|---|---|
| Prefix | `Ctrl+A` (muscle-memory from screen) |
| Vi copy mode | `v` to select, `y` to yank → `pbcopy` |
| Splits | `\|` horizontal, `-` vertical, both inherit current path |
| Pane nav | `h/j/k/l` (mirrors Vim splits) |
| Status bar | Top-mounted; shifts purple when a pane is zoomed |
| Scratchpad popup | `Prefix+Space` – floating terminal with a live clock |
| Sessionizer | `Prefix+f` – fzf picker over existing sessions |
| Project mode | `Prefix+P` – `fd` search into `~/Code`, `~/Projects`, etc. |

### `.vimrc`
Vim configuration using **vim-plug** as the plugin manager and **Catppuccin Mocha** as the colourscheme.

Plugins:
| Plugin | Purpose |
|---|---|
| fzf / fzf.vim | Fuzzy file/buffer/ripgrep search (`<leader>f/g/r`) |
| NERDTree | File-tree sidebar (`<leader>e`) |
| lightline | Minimal status line showing git branch |
| vim-fugitive | Full Git workflow inside Vim (`<leader>gs/gc/gp/gl`) |
| vim-gitgutter | Live diff signs in the sign column |
| vim-surround | Change/add/delete surrounding chars (`cs"'`) |
| auto-pairs | Auto-close brackets and quotes |
| vim-commentary | Toggle comments (`gcc`, `gc` in visual) |
| vim-visual-multi | Multiple cursors (`Ctrl+N`) |
| indentLine | Thin vertical indent guides |
| vim-polyglot | Syntax highlighting for 100+ languages |
| vim-smoothie | Smooth `Ctrl+D/U` scrolling |
| vim-startify | Start screen with recent files and sessions |

Leader key is `Space`. Split navigation uses `Ctrl+h/j/k/l` to match tmux pane nav.

### `.stow-local-ignore`
Tells GNU Stow **not** to symlink `.DS_Store` files into `$HOME`. Without this, Stow would create a `~/.DS_Store` symlink on macOS.
