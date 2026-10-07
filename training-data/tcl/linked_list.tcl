proc ll_new {} {
    return {}
}

proc ll_push_front {list value} {
    return [linsert $list 0 $value]
}

proc ll_push_back {list value} {
    lappend list $value
    return $list
}

proc ll_remove {list value} {
    set idx [lsearch $list $value]
    if {$idx == -1} {
        return $list
    }
    return [lreplace $list $idx $idx]
}

proc ll_print {list} {
    puts [join $list " -> "]
}

set nodes [ll_new]
set nodes [ll_push_back $nodes 1]
set nodes [ll_push_back $nodes 2]
set nodes [ll_push_front $nodes 0]
ll_print $nodes

set nodes [ll_remove $nodes 1]
ll_print $nodes
