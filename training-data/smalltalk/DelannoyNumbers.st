"Central Delannoy numbers: D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)"
Object subclass: DelannoyNumbers [
    DelannoyNumbers class >> central: last [
        | d |
        d := (1 to: last + 1) collect: [ :m | Array new: last + 1 withAll: 1 ].
        2 to: last + 1 do: [ :m |
            2 to: last + 1 do: [ :n |
                (d at: m) at: n put:
                    ((d at: m - 1) at: n) + ((d at: m) at: n - 1) + ((d at: m - 1) at: n - 1) ] ].
        ^(1 to: last + 1) collect: [ :k | (d at: k) at: k ]
    ]
]

((DelannoyNumbers central: 9) inject: '' into: [ :acc :each |
    acc isEmpty ifTrue: [ each printString ] ifFalse: [ acc, ' ', each printString ] ]) displayNl.
