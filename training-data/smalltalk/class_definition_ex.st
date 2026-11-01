Object subclass: Counter [
    | count |
    init [ count := 0 ]
    increment [ count := count + 1. ^count ]
    count [ ^count ]
]
Counter class extend [ new [ ^super new init ] ].

| c |
c := Counter new.
c increment; increment.
Transcript showCr: c count printString.
