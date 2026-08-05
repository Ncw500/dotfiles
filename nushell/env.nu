use std/util "path add"

let extra_paths = [
  # --- User tools ---
  $"($nu.home-dir)/.x-cmd.root/local/data/pkg/sphere/X/l/j/h/bin"
  $"($nu.home-dir)/.x-cmd.root/bin"
  $"($nu.home-dir)/.nvm/versions/node/v23.10.0/bin"
  $"($nu.home-dir)/.grok/bin"
  $"($nu.home-dir)/.opencode/bin"
  $"($nu.home-dir)/Library/pnpm"
  $"($nu.home-dir)/Library/Android/sdk/platform-tools"
  $"($nu.home-dir)/Library/Android/sdk/emulator"
  $"($nu.home-dir)/Library/Android/sdk/tools"
  $"($nu.home-dir)/Library/Android/sdk/tools/bin"
  $"($nu.home-dir)/.cargo/bin"
  $"($nu.home-dir)/.local/bin"
  $"($nu.home-dir)/flutter/bin"
  $"($nu.home-dir)/Library/Application Support/JetBrains/Toolbox/scripts"
  $"($nu.home-dir)/.x-cmd.root/local/data/triarii/bin"
  "/Applications/Ghostty.app/Contents/MacOS"

  # --- Homebrew ---
  "/opt/homebrew/opt/postgresql@17/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"

  # --- System paths ---
  "/usr/local/bin"
  "/System/Cryptexes/App/usr/bin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
  "/opt/pmk/env/global/bin"
  "/opt/local/bin"
  "/opt/local/sbin"
  "/Library/Apple/usr/bin"
  "/Library/TeX/texbin"
]

$env.PATH = ($extra_paths | append $env.PATH | uniq)
