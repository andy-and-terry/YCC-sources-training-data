puts [string totitle "hello"]
puts [string totitle "hELLO wORLD"]

proc titleCase {s} {
    set out {}
    foreach w [split $s] {
        lappend out [string totitle $w]
    }
    return [join $out " "]
}
puts [titleCase "the quick brown fox"]
puts [string tolower "SHOUT"]
puts [string toupper "whisper"]
