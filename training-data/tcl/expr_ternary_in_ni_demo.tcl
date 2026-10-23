set colors {red green blue}

foreach c {green yellow} {
    if {$c in $colors} {
        puts "$c is in the list"
    } else {
        puts "$c is not in the list"
    }
}

puts [expr {"cyan" ni $colors}]

foreach n {-5 0 7} {
    set sign [expr {$n < 0 ? "negative" : $n == 0 ? "zero" : "positive"}]
    puts "$n is $sign"
}

puts [expr {"abc" eq "abc"}]
puts [expr {"abc" ne "abd"}]
puts [expr {1 <= 2 && 3 > 2 || 0}]
