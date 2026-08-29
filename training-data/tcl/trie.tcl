array set trie {}

proc trie_insert {word} {
    global trie
    set path ""
    foreach c [split $word ""] {
        append path $c
        set trie($path,exists) 1
    }
    set trie($path,end) 1
}

proc trie_contains {word} {
    global trie
    set path ""
    foreach c [split $word ""] {
        append path $c
        if {![info exists trie($path,exists)]} {
            return 0
        }
    }
    return [info exists trie($path,end)]
}

trie_insert "cat"
trie_insert "car"
puts [trie_contains "cat"]
puts [trie_contains "ca"]
