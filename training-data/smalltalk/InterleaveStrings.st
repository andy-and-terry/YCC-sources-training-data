| interleave |
interleave := [:parts | | longest out |
    longest := (parts collect: [:p | p size]) inject: 0 into: [:a :b | a max: b].
    out := WriteStream on: String new.
    1 to: longest do: [:i |
        parts do: [:p | i <= p size ifTrue: [out nextPut: (p at: i)]]].
    out contents].
(interleave value: #('abc' '12345')) displayNl.
(interleave value: #('ab' 'cd' 'efg')) displayNl.
