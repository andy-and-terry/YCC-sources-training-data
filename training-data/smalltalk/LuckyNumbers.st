"Lucky numbers: start with the odd numbers, then delete every k-th survivor,
 where k is the next surviving number"
Object subclass: LuckyNumbers [
    LuckyNumbers class >> below: limit [
        | nums idx k kept |
        nums := OrderedCollection new.
        1 to: limit - 1 by: 2 do: [ :n | nums add: n ].
        idx := 2.
        [ idx <= nums size and: [ (nums at: idx) <= nums size ] ] whileTrue: [
            k := nums at: idx.
            kept := OrderedCollection new.
            1 to: nums size do: [ :p |
                (p \\ k) = 0 ifFalse: [ kept add: (nums at: p) ].
            ].
            nums := kept.
            idx := idx + 1.
        ].
        ^nums
    ]
]

(LuckyNumbers below: 100) printNl.
