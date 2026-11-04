| ugly |
ugly := [:n | | seq i2 i3 i5 c2 c3 c5 next |
    seq := OrderedCollection with: 1.
    i2 := i3 := i5 := 1.
    [seq size < n] whileTrue: [
        c2 := (seq at: i2) * 2. c3 := (seq at: i3) * 3. c5 := (seq at: i5) * 5.
        next := (c2 min: c3) min: c5.
        seq add: next.
        next = c2 ifTrue: [i2 := i2 + 1].
        next = c3 ifTrue: [i3 := i3 + 1].
        next = c5 ifTrue: [i5 := i5 + 1]].
    seq at: n].
((1 to: 12) collect: [:i | ugly value: i]) printNl.
