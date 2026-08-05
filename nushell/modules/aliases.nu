# Listing
export alias l   = ls
export alias ll  = ls -l
export alias la  = ls -a
export alias lla = ls -la

# Terminal
export alias c = clear

# Tree
export alias t  = tree -C --dirsfirst -I "node_modules|.git|dist|target|.next"
export alias t1 = tree -C --dirsfirst -L 1 -I "node_modules|.git|dist|target|.next"
export alias t2 = tree -C --dirsfirst -L 2 -I "node_modules|.git|dist|target|.next"
export alias t3 = tree -C --dirsfirst -L 3 -I "node_modules|.git|dist|target|.next"
export alias td = tree -C -d --dirsfirst -I "node_modules|.git|dist|target|.next"
export alias ta = tree -C -a --dirsfirst -I "node_modules|.git|dist|target"

# Content Display
export alias o = open
export alias or = open -r

# Editor
export alias n = nvim
