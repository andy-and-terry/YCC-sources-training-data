set scores [dict create alice 82 bob 95 carol 78 dave 95]

set pairs {}
dict for {k v} $scores {
    lappend pairs [list $k $v]
}

set ranked [lsort -decreasing -integer -index 1 $pairs]
foreach pair $ranked {
    lassign $pair name score
    puts [format "%-6s %3d" $name $score]
}
