| text rails rows r step |
text := 'WEAREDISCOVERED'.
rails := 3.
rows := (1 to: rails) collect: [:i | WriteStream on: String new].
r := 1. step := 1.
text do: [:ch |
    (rows at: r) nextPut: ch.
    r = 1 ifTrue: [step := 1].
    r = rails ifTrue: [step := -1].
    r := r + step].
Transcript showCr: (rows inject: '' into: [:acc :w | acc, w contents]).
