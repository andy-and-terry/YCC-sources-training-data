proc word_frequency {text} {
    array set freq {}
    foreach word [split [string tolower $text] " "] {
        if {[info exists freq($word)]} {
            incr freq($word)
        } else {
            set freq($word) 1
        }
    }
    return [array get freq]
}

puts [word_frequency "the quick brown fox the lazy fox"]
