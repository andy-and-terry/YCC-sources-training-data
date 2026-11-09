Object subclass: Counter [
    | count |
    init [ count := 0 ]
    increment [ count := count + 1. ^count ]
    count [ ^count ]
]

| c |
c := Counter new.
c init.
c increment; increment.
c count printNl.
