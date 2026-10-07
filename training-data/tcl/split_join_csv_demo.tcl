set csv "name,age,city
alice,30,paris
bob,25,berlin
carol,41,rome"

set lines [split $csv "\n"]
set header [split [lindex $lines 0] ,]
set rows {}

foreach line [lrange $lines 1 end] {
    set fields [split $line ,]
    set row {}
    foreach h $header v $fields {
        lappend row $h $v
    }
    lappend rows $row
}

foreach row $rows {
    puts "[dict get $row name] is [dict get $row age] from [dict get $row city]"
}

puts [join {a b c} " | "]
puts [split "a1b22c" "0123456789"]
puts [split "abc" ""]
