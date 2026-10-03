array set document {}
set document(text) ""
set history {}

proc executeInsert {text} {
    global document history
    set document(text) "$document(text)$text"
    lappend history [list undoInsert [string length $text]]
}

proc undoInsert {length} {
    global document
    set current $document(text)
    set document(text) [string range $current 0 [expr {[string length $current] - $length - 1}]]
}

proc undoLast {} {
    global history
    if {[llength $history] == 0} { return }
    set command [lindex $history end]
    set history [lrange $history 0 end-1]
    set action [lindex $command 0]
    set arg [lindex $command 1]
    $action $arg
}

executeInsert "Hello, "
executeInsert "world!"
puts $document(text)
undoLast
puts $document(text)
