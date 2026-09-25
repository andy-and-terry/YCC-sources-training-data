Object subclass: ShellSort [
    ShellSort class >> sort: anArray [
        | array gap temp j |
        array := anArray copy.
        gap := array size // 2.
        [ gap > 0 ] whileTrue: [
            (gap + 1) to: array size do: [ :k |
                temp := array at: k.
                j := k.
                [ j > gap and: [ (array at: j - gap) > temp ] ] whileTrue: [
                    array at: j put: (array at: j - gap).
                    j := j - gap.
                ].
                array at: j put: temp.
            ].
            gap := gap // 2.
        ].
        ^array
    ]
]

Transcript showCr: (ShellSort sort: #(9 5 1 4 3 8 2)) printString.
