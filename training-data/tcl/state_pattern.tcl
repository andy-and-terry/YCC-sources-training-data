oo::class create TrafficLight {
    variable state

    constructor {} {
        set state "red"
    }

    method next {} {
        switch -- $state {
            red     { set state "green" }
            green   { set state "yellow" }
            yellow  { set state "red" }
        }
        return $state
    }

    method current {} {
        return $state
    }
}

set light [TrafficLight new]
puts [$light current]
for {set i 0} {$i < 4} {incr i} {
    puts [$light next]
}
