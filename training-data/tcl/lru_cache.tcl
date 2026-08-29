array set cacheMap {}
set cacheOrder {}
set cacheCapacity 2

proc lru_get {key} {
    global cacheMap cacheOrder
    if {[info exists cacheMap($key)]} {
        set idx [lsearch $cacheOrder $key]
        set cacheOrder [lreplace $cacheOrder $idx $idx]
        lappend cacheOrder $key
        return $cacheMap($key)
    }
    return -1
}

proc lru_put {key value} {
    global cacheMap cacheOrder cacheCapacity
    if {[info exists cacheMap($key)]} {
        set idx [lsearch $cacheOrder $key]
        set cacheOrder [lreplace $cacheOrder $idx $idx]
    }
    set cacheMap($key) $value
    lappend cacheOrder $key
    if {[llength $cacheOrder] > $cacheCapacity} {
        set evict [lindex $cacheOrder 0]
        set cacheOrder [lreplace $cacheOrder 0 0]
        unset cacheMap($evict)
    }
}

lru_put 1 1
lru_put 2 2
puts [lru_get 1]
lru_put 3 3
puts [lru_get 2]
