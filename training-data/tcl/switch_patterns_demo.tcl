proc classify {s} {
    switch -glob -- $s {
        "*.tcl"  { return "tcl script" }
        "*.txt"  { return "text file" }
        "a?c"    { return "a-any-c" }
        default  { return "unknown" }
    }
}
puts [classify script.tcl]
puts [classify notes.txt]
puts [classify abc]
puts [classify other]

proc kind {s} {
    switch -regexp -- $s {
        {^\d+$}        { return integer }
        {^\d+\.\d+$}   { return float }
        {^[A-Za-z]+$}  { return word }
        default        { return mixed }
    }
}
foreach v {42 3.14 hello a1b2} { puts "$v -> [kind $v]" }

switch 2 {
    1 -
    2 -
    3 { puts "one to three" }
    default { puts "other" }
}
