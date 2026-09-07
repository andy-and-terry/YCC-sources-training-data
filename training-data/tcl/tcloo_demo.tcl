oo::class create Counter {
    variable count

    constructor {start} {
        set count $start
    }

    method increment {} {
        incr count
    }

    method value {} {
        return $count
    }
}

set c [Counter new 10]
$c increment
$c increment
puts [$c value]
