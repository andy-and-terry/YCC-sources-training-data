Object subclass: Counter [
    | count |
    init [ count := 0 ]
    Counter class >> new [ ^super new init ]
    increment [ count := count + 1. ^count ]
    count [ ^count ]
]

| c |
c := Counter new.
c increment; increment; increment.
c count printNl.
