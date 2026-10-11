proc pigLatin {word} {
    if {[regexp {^[aeiou]} $word]} {
        return ${word}way
    }
    if {[regexp {^([^aeiou]+)(.*)$} $word -> head rest]} {
        return ${rest}${head}ay
    }
    return $word
}

foreach w {apple string tcl rhythm eat} {
    puts "$w -> [pigLatin $w]"
}
