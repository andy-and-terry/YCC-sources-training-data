"Moebius function: 0 if n has a squared prime factor, else (-1)^k."
| mobius |
mobius := [ :n | | m p result done |
    m := n. p := 2. result := 1. done := false.
    [ done not and: [ p * p <= m ] ] whileTrue: [
        (m \\ p = 0) ifTrue: [
            m := m // p.
            (m \\ p = 0)
                ifTrue: [ result := 0. done := true ]
                ifFalse: [ result := result negated ] ].
        p := p + 1 ].
    done ifTrue: [ 0 ] ifFalse: [ m > 1 ifTrue: [ result negated ] ifFalse: [ result ] ] ].

(1 to: 30) do: [ :n | Transcript show: (mobius value: n) printString; show: ' ' ].
Transcript cr.
