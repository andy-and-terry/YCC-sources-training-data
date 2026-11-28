set s abcabc
set k 3
for {set i 0} {$i <= [string length $s] - $k} {incr i} {
    set h 0
    foreach c [split [string range $s $i [expr {$i + $k - 1}]] ""] {
        scan $c %c code
        set h [expr {($h * 31 + $code) % 1000003}]
    }
    puts "$i $h"
}
