set text "Hello <b>World</b> & friends"
puts [string map {< &lt; > &gt; & &amp;} $text]
puts [string map -nocase {hello HI world EARTH} $text]

proc slugify {s} {
    set s [string tolower [string trim $s]]
    set s [regsub -all {[^a-z0-9]+} $s -]
    return [string trim $s -]
}
puts [slugify "  Hello, Tcl World! 2024  "]

puts [string totitle "mixed CASE words"]
puts [string repeat "ab" 3]
puts [string reverse "stressed"]
puts [string first "lo" "hello world"]
puts [string last "o" "hello world"]
puts [string range "abcdef" 1 3]
