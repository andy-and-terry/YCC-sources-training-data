Object subclass: FibMemo [
    | cache calls |
    init [
        cache := Dictionary new.
        calls := 0
    ]
    FibMemo class >> new [ ^super new init ]
    calls [ ^calls ]
    fib: n [
        n < 2 ifTrue: [ ^n ].
        ^cache at: n ifAbsent: [
            | value |
            calls := calls + 1.
            value := (self fib: n - 1) + (self fib: n - 2).
            cache at: n put: value.
            value ]
    ]
]

Object subclass: NaiveFib [
    | calls |
    NaiveFib class >> new [ ^super new setCalls ]
    setCalls [ calls := 0 ]
    calls [ ^calls ]
    fib: n [
        calls := calls + 1.
        n < 2 ifTrue: [ ^n ].
        ^(self fib: n - 1) + (self fib: n - 2)
    ]
]

| memo naive |
memo := FibMemo new.
naive := NaiveFib new.
Transcript showCr: (memo fib: 25) printString.
Transcript showCr: 'memoized computations: ', memo calls printString.
Transcript showCr: (naive fib: 20) printString.
Transcript showCr: 'naive calls: ', naive calls printString.
Transcript showCr: (memo fib: 90) printString.
