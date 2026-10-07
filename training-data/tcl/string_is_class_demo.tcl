foreach value {42 3.14 abc "" 0x1F " " true} {
    set flags {}
    foreach class {integer double alpha digit space boolean} {
        if {[string is $class -strict $value]} {
            lappend flags $class
        }
    }
    puts "'$value': [join $flags {, }]"
}
