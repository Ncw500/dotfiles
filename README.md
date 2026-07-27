# Dotfiles

Personal macOS configuration: tiling window manager, terminal, shell, prompt, and Chinese input.

## Layout

```
.
├── aerospace/
│   └── .aerospace.toml
├── wezterm/
│   └── wezterm.lua
├── nushell/
│   ├── config.nu
│   ├── env.nu
│   └── modules/
│       ├── aliases.nu
│       └── tools.nu
├── starship/
│   └── starship.toml
└── rime/
    ├── default.custom.yaml
    ├── cangjie5.custom.yaml
    └── scj6.custom.yaml
```

## Aerospace

[AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) i3-like tiling window manager for macOS.

**Highlights**

- Starts at login; launches [JankyBorders](https://github.com/FelixKratz/JankyBorders) on startup (white active border, width 5; blacklists iPhone Mirroring)
- Tiles layout with 10px gaps; QWERTY key mapping; accordion padding 50
- Mouse moves to monitor center on focused-monitor change
- Workspaces: `Main`, `2`–`5`, `Coding`, `Entertainment`, `Normal`, `Message`, `System`
- Dual-monitor: `Main` / `2`–`5` / `Coding` → `main`; `Entertainment` / `Normal` / `Message` / `System` → `secondary` (fallback `main`)
- Auto-routing for apps (see below)
- Workspace switches can open related apps (e.g. `alt-1` → Main + Zen, `alt-c` → Coding + WezTerm)

**Install**

```bash
ln -sf "$(pwd)/aerospace/.aerospace.toml" ~/.aerospace.toml
```

Reload config from AeroSpace service mode (`alt-shift-;` then `esc`), or restart the app.

### Useful bindings (main mode)

| Binding | Action |
|---------|--------|
| `alt-h/j/k/l` | Focus left/down/up/right |
| `alt-shift-h/j/k/l` | Move window |
| `alt-shift-minus` / `alt-shift-equal` | Resize smart −200 / +200 |
| `alt-slash` / `alt-comma` | Layout tiles / accordion |
| `alt-1`…`5` | Workspaces Main, 2–5 (`alt-1` also opens Zen) |
| `alt-c/e/n/m/s` | Coding / Entertainment / Normal / Message / System |
| `alt-shift-1`… / `alt-shift-c`… | Move node to workspace |
| `alt-shift-tab` | Workspace back-and-forth |
| `alt-cmd-tab` | Move node + focus to next monitor |
| `alt-shift-semicolon` | Service mode |

### App → workspace routing

| Workspace | Apps |
|-----------|------|
| Main | Zen Browser, Safari |
| Coding | WezTerm, Zed |
| Entertainment | Spotify |
| Message | WeChat, QQ, Discord, WhatsApp |
| System | Finder, QSpace Pro, Marta, System Settings (float), Surfshark (float) |
| *(float)* | CleanShot X, Raycast, CleanMyMac, IINA |

## WezTerm

[WezTerm](https://wezfurlong.org/wezterm/) GPU-accelerated terminal.

**Highlights**

- Minimal tab bar (hidden when only one tab); no fancy tab bar
- Transparent window (`0.8` opacity) with macOS blur (20); padding 20
- Window decorations: `RESIZE` only; close without confirmation
- Color scheme: Afterglow (Gogh)
- Font: JetBrainsMonoNL Nerd Font, size 20

**Install**

```bash
mkdir -p ~/.config/wezterm
ln -sf "$(pwd)/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
```

Config reloads automatically when the file changes.

## Nushell

[Nushell](https://www.nushell.sh/) as the interactive shell.

**Highlights**

- No startup banner; buffer editor `nvim`; vi edit mode (line cursor insert, block normal)
- `env.nu`: ordered `PATH` for Homebrew, Cargo, Flutter, Node (nvm), pnpm, Android SDK, Grok/OpenCode, JetBrains Toolbox, x-cmd, etc.
- Modules:
  - `aliases.nu` — `l`/`ll`/`la`/`lla`, `c` (clear), `t`/`t1`–`t3`/`td`/`ta` (tree with common ignores)
  - `tools.nu` — opt-in shell integrations via generated files under `$nu.data-dir/vendor/autoload`

**Managed tools** (`tool on` / `tool off` / `tool toggle` / `tool list` / `tool clean`)

| Tool | Init |
|------|------|
| [starship](https://starship.rs/) | `starship init nu` |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | `zoxide init nushell` |

After enabling a tool, open a new Nu window to apply.

**Install**

```bash
mkdir -p ~/.config/nushell
ln -sf "$(pwd)/nushell/config.nu" ~/.config/nushell/config.nu
ln -sf "$(pwd)/nushell/env.nu"    ~/.config/nushell/env.nu
ln -sfn "$(pwd)/nushell/modules"  ~/.config/nushell/modules
```

## Starship

[Starship](https://starship.rs/) cross-shell prompt (enabled via Nushell `tool on starship`).

**Highlights**

- Character: green `➜` on success, red on error
- Nerd Font symbols for languages, cloud tools, git, OS icons, etc.

**Install**

```bash
mkdir -p ~/.config
ln -sf "$(pwd)/starship/starship.toml" ~/.config/starship.toml
```

Then from Nushell: `tool on starship`.

## Rime

[Rime](https://rime.im/) Chinese input method custom patches (Squirrel on macOS).

**Schemas** (via `default.custom.yaml`)

- [Cangjie 5](https://github.com/rime/rime-cangjie) (`cangjie5`)
- [SCJ 6](https://github.com/rime/rime-scj) (`scj6`)

Both schemas default ASCII/English output on switch (`switches/@0/reset: 1`).

**Install**

```bash
# Squirrel user data directory
RIME_DIR="$HOME/Library/Rime"
mkdir -p "$RIME_DIR"
ln -sf "$(pwd)/rime/default.custom.yaml"  "$RIME_DIR/default.custom.yaml"
ln -sf "$(pwd)/rime/cangjie5.custom.yaml" "$RIME_DIR/cangjie5.custom.yaml"
ln -sf "$(pwd)/rime/scj6.custom.yaml"     "$RIME_DIR/scj6.custom.yaml"
```

Then redeploy Rime (menu bar → Deploy).

## Requirements

| Tool | Notes |
|------|--------|
| [AeroSpace](https://github.com/nikitabobko/AeroSpace) | Window manager |
| [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Window borders (optional, used in startup) |
| [WezTerm](https://wezfurlong.org/wezterm/) | Terminal |
| JetBrainsMonoNL Nerd Font | WezTerm font (and Starship icons) |
| [Nushell](https://www.nushell.sh/) | Shell |
| [Starship](https://starship.rs/) | Prompt (optional; via `tool on starship`) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` (optional; via `tool on zoxide`) |
| [Squirrel](https://github.com/rime/squirrel) + Cangjie schemas | Rime on macOS |
| tree | Used by Nushell tree aliases |
| nvim | Default buffer editor for Nushell |
