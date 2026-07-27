# Core settings
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"
$env.config.cursor_shape = {
    vi_insert: line     
    vi_normal: block
}

# Load modules
use modules/aliases.nu *
use modules/tools.nu *
