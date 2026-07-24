# dotfiles

Personal macOS configuration files for window management, terminal, and Chinese input.

## Layout

```
.
├── aerospace/
│   └── .aerospace.toml
├── wezterm/
│   └── wezterm.lua
└── rime/
    ├── default.custom.yaml
    ├── cangjie5.custom.yaml
    └── scj6.custom.yaml
```

## Aerospace

[AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) i3-like tiling window manager for macOS.

**Highlights**

- Starts at login; launches [JankyBorders](https://github.com/FelixKratz/JankyBorders) on startup
- Tiles layout with 10px gaps; QWERty key mapping
- Workspaces: `1`–`5`, `C` (code), `N` (normal), `M` (music), `S` (system)
- Dual-monitor assignments (`main` [number-ws] / `secondary` [alphabet-ws])
- Auto-routing for apps (WezTerm/Zed → `C`, Zen/Safari → `1`, Spotify → `M`, etc.)

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
| `alt-1`…`5`, `alt-c/n/m/s` | Switch workspace |
| `alt-shift-1`… | Move node to workspace |
| `alt-tab` | Workspace back-and-forth |
| `alt-shift-semicolon` | Service mode |

## WezTerm

[WezTerm](https://wezfurlong.org/wezterm/) GPU-accelerated terminal.

**Highlights**

- Minimal tab bar (hidden when only one tab)
- Transparent window (`0.8` opacity) with macOS blur
- Color scheme: Afterglow (Gogh)
- Font: JetBrainsMonoNL Nerd Font, size 20

**Install**

```bash
mkdir -p ~/.config/wezterm
ln -sf "$(pwd)/wezterm/wezterm.lua" ~/.config/wezterm/wezterm.lua
```

Config reloads automatically when the file changes.

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
| JetBrainsMonoNL Nerd Font | WezTerm font |
| [Squirrel](https://github.com/rime/squirrel) + Cangjie schemas | Rime on macOS |
