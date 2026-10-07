Object subclass: Counter [
    Counter class [ | count | ]
    Counter class >> new [
        count := (count ifNil: [ 0 ]) + 1.
        ^super new
    ]
    Counter class >> count [ ^count ifNil: [ 0 ] ]
    Counter class >> reset [ count := 0 ]
]

Counter new.
Counter new.
Counter new.
Transcript showCr: 'instances created: ', Counter count printString.
Counter reset.
Transcript showCr: 'after reset: ', Counter count printString.
