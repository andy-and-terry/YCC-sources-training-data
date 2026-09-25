proc sorted_key {word} {
    return [lsort [split $word ""]]
}

proc group_anagrams {words} {
    set groups [dict create]
    foreach w $words {
        dict lappend groups [sorted_key $w] $w
    }
    return $groups
}

set words {eat tea tan ate nat bat}
set groups [group_anagrams $words]
dict for {key value} $groups {
    puts $value
}
