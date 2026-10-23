# Portable path manipulation with the file command
set path [file join /home user projects demo report.final.txt]
puts "path:      $path"
puts "dirname:   [file dirname $path]"
puts "tail:      [file tail $path]"
puts "extension: [file extension $path]"
puts "rootname:  [file rootname [file tail $path]]"
puts "parts:     [file split $path]"

# Normalize and compare
set messy [file join /a b .. c . d]
puts "normalized: [file normalize $messy]"
puts "type:       [file pathtype $path]"
puts "relative:   [file pathtype docs/readme.md]"

# Build a new name by swapping the extension
set base [file rootname [file tail $path]]
puts "new name:  [file join [file dirname $path] $base.bak]"

# Query the file system for something that always exists
puts "tmp is dir: [file isdirectory /tmp]"
puts "missing:    [file exists /no/such/file]"
