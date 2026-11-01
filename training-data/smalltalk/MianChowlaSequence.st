"Greedy sequence whose pairwise sums are all distinct."
| seq sums cand fresh ok |
seq := OrderedCollection new.
sums := Set new.
cand := 1.
[ seq size < 8 ] whileTrue: [
    fresh := Set new.
    ok := true.
    (seq copyWith: cand) do: [ :x |
        | s |
        s := x + cand.
        ((sums includes: s) or: [ fresh includes: s ]) ifTrue: [ ok := false ].
        fresh add: s ].
    ok ifTrue: [ seq add: cand. sums addAll: fresh ].
    cand := cand + 1 ].
seq do: [ :v | Transcript show: v printString; show: ' ' ].
Transcript cr.
