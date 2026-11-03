set text [string tolower "Education is beautiful"]
foreach v {a e i o u} {
    set n [regexp -all $v $text]
    puts -nonewline "$v=$n "
}
puts ""
