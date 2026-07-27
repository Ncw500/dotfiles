const GENERATED_DIR = ($nu.data-dir | path join "vendor/autoload")

# Tools list — add new tools here only
const TOOLS = {
  starship: ["starship" "init" "nu"]
  zoxide:   ["zoxide" "init" "nushell"]
}

# Completer: tool names
def nu-complete-tools [] {
  $TOOLS | columns
}

# Completer: list filters
def nu-complete-tool-list-filters [] {
  ["enabled" "disabled" "all"]
}

# Completer: currently enabled tools (for off / toggle)
def nu-complete-enabled-tools [] {
  if not ($GENERATED_DIR | path exists) { return [] }
  ls $GENERATED_DIR
  | where name =~ '\.nu$'
  | get name
  | each { |f| $f | path basename | str replace ".nu" "" }
}

# Enable a tool
export def "tool on" [
  name: string@nu-complete-tools
] {
  if not ($name in $TOOLS) {
    error make {msg: $"Unknown tool: ($name). Available: ($TOOLS | columns | str join ', ')"}
  }

  mkdir $GENERATED_DIR
  let managed = ($GENERATED_DIR | path join $"($name).nu")
  let cmd = ($TOOLS | get $name)

  run-external $cmd.0 ...($cmd | skip 1) | save -f $managed
  print $"($name) ON — open a new Nu window to apply"
}

# Disable a tool
export def "tool off" [
  name: string@nu-complete-enabled-tools
] {
  let managed = ($GENERATED_DIR | path join $"($name).nu")
  if ($managed | path exists) {
    rm $managed
    print $"($name) OFF — open a new Nu window to apply"
  } else {
    print $"($name) is not enabled"
  }
}

# Toggle a tool on/off
export def "tool toggle" [
  name: string@nu-complete-tools
] {
  let managed = ($GENERATED_DIR | path join $"($name).nu")
  if ($managed | path exists) {
    tool off $name
  } else {
    tool on $name
  }
}

# List tools
export def "tool list" [
  filter?: string@nu-complete-tool-list-filters = "enabled"
] {
  let known = ($TOOLS | columns)
  let enabled = if ($GENERATED_DIR | path exists) {
    ls $GENERATED_DIR
    | where name =~ '\.nu$'
    | get name
    | each { |f| $f | path basename | str replace ".nu" "" }
  } else {
    []
  }

  match $filter {
    "enabled" => {
      if ($enabled | is-empty) { print "No tools enabled" } else { $enabled }
    }
    "disabled" => {
      let disabled = ($known | where {|t| not ($t in $enabled)})
      if ($disabled | is-empty) { print "No tools disabled" } else { $disabled }
    }
    "all" => {
      $known | each { |t|
        {
          name: $t
          status: (if $t in $enabled { "enabled" } else { "disabled" })
        }
      }
    }
    _ => {
      error make {msg: $"Invalid filter: ($filter). Use: enabled, disabled, all"}
    }
  }
}

# Remove all generated tool configs
export def "tool clean" [] {
  if not ($GENERATED_DIR | path exists) {
    print "Nothing to clean"
    return
  }

  let files = (ls $GENERATED_DIR | where name =~ '\.nu$' | get name)
  if ($files | is-empty) {
    print "Nothing to clean"
    return
  }

  $files | each { |f| rm $f }
  print "All generated tool configs removed"
}
