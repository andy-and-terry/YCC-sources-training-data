oo::class create Subject {
    variable observers state

    constructor {} {
        set observers {}
        set state 0
    }

    method attach {observer} {
        lappend observers $observer
    }

    method setState {newState} {
        set state $newState
        foreach observer $observers {
            $observer notify $state
        }
    }
}

oo::class create Observer {
    variable name

    constructor {observerName} {
        set name $observerName
    }

    method notify {newState} {
        puts "$name received update: $newState"
    }
}

set subject [Subject new]
set observerA [Observer new "A"]
set observerB [Observer new "B"]

$subject attach $observerA
$subject attach $observerB
$subject setState 42
