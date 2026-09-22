array set scores {Ada 88 Bob 72 Cleo 95}

foreach name [lsort [array names scores]] {
    puts "$name: $scores($name)"
}

set scores(Dan) 60
puts [array size scores]
puts [array get scores Ada]
