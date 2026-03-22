# macOS Defaults

Documents every setting applied by `scripts/macos.sh`.

Run once after a fresh install:

```sh
bash ~/.dotfiles/scripts/macos.sh
```

> Some changes require a logout to fully take effect. Finder and Dock are restarted automatically at the end.

---

## Finder

| Setting | Value | Why |
|---|---|---|
| Show all file extensions | enabled | Prevents confusion about file types |
| Show hidden files | enabled | Essential for dotfiles and dev work |
| Show path bar | enabled | Shows full directory path at the bottom of every window |
| Show status bar | enabled | Shows item count and available disk space |
| Keep folders on top | enabled | Folders always sort above files |
| Default view | List view | More information density than icon or column view |
| `.DS_Store` on network volumes | disabled | Prevents cluttering network shares and USB drives |
| `.DS_Store` on USB volumes | disabled | Same as above for external drives |
| Warn when changing file extension | disabled | Removes the annoying confirmation dialog |

---

## Keyboard

| Setting | Value | Why |
|---|---|---|
| Key repeat rate | `2` (fast) | Faster cursor movement when holding a key |
| Initial key repeat delay | `15` (short) | Less waiting before repeat kicks in |
| Autocorrect | disabled | Stops macOS from rewriting what you type |
| Auto-capitalization | disabled | No unexpected capital letters mid-sentence |
| Smart dashes | disabled | Prevents `--` from becoming `—` |
| Smart quotes | disabled | Prevents `"` from becoming `"` (breaks code) |

---

## Dock

| Setting | Value | Why |
|---|---|---|
| Auto-hide | enabled | More screen space when not in use |
| Auto-hide delay | `0` | Dock appears instantly on hover |
| Hide/show animation speed | `0.3s` | Snappier than the default |
| Show recent apps | disabled | Keeps the Dock clean and intentional |
| Icon size | `48px` | Balanced size — not too large, not too small |

---

## Screenshots

| Setting | Value | Why |
|---|---|---|
| Save location | `~/Desktop/Screenshots` | Keeps Desktop tidy in a dedicated folder |
| Remove shadow | enabled | Cleaner screenshots without the macOS window drop shadow |
| Format | PNG | Lossless quality |

---

## Trackpad

| Setting | Value | Why |
|---|---|---|
| Tap to click | enabled | Click without pressing down physically |

---

## Dialogs & Printing

| Setting | Value | Why |
|---|---|---|
| Expand save dialog by default | enabled | Shows the full file path picker instead of the collapsed mini version |
| Expand print dialog by default | enabled | Shows all print options immediately |
| Quit printer app when done | enabled | Printer app doesn't linger in the Dock after printing |
