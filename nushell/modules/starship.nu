# Enable Starship prompt (takes effect in new Nu window)
export def starship-on [] {
  let dir = ($nu.data-dir | path join "vendor/autoload")
  mkdir $dir
  starship init nu | save -f ($dir | path join "starship.nu")
  print "Starship ON — open a new Nu window to apply"
}

# Disable Starship prompt
export def starship-off [] {
  let p = ($nu.data-dir | path join "vendor/autoload/starship.nu")
  if ($p | path exists) { rm $p }
  print "Starship OFF — open a new Nu window to apply"
}

# Toggle Starship on/off
export def starship-toggle [] {
  let p = ($nu.data-dir | path join "vendor/autoload/starship.nu")
  if ($p | path exists) { starship-off } else { starship-on }
}
