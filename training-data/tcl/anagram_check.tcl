proc normalize_str {s} {
    set chars [split [string map {" " ""} [string tolower $s]] ""]
    return [lsort $chars]
}

proc is_anagram {a b} {
    return [expr {[normalize_str $a] eq [normalize_str $b]}]
}

puts [is_anagram "listen" "silent"]
puts [is_anagram "hello" "world"]
