oo::class create Configuration {
    variable settings

    constructor {} {
        set settings [dict create]
    }

    method set {key value} {
        dict set settings $key $value
    }

    method get {key} {
        return [dict get $settings $key]
    }
}

proc getConfiguration {} {
    global configurationInstance
    if {![info exists configurationInstance]} {
        set configurationInstance [Configuration new]
    }
    return $configurationInstance
}

set c1 [getConfiguration]
$c1 set "theme" "dark"

set c2 [getConfiguration]
puts [$c2 get "theme"]
puts [expr {$c1 eq $c2}]
