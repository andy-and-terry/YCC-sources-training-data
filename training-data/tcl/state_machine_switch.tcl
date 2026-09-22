proc next_state {state event} {
    switch -- $state {
        idle {
            switch -- $event {
                start { return "running" }
                default { return $state }
            }
        }
        running {
            switch -- $event {
                pause { return "paused" }
                stop { return "idle" }
                default { return $state }
            }
        }
        paused {
            switch -- $event {
                resume { return "running" }
                stop { return "idle" }
                default { return $state }
            }
        }
        default {
            return "idle"
        }
    }
}

set state "idle"
foreach event {start pause resume stop} {
    set state [next_state $state $event]
    puts "$event -> $state"
}
