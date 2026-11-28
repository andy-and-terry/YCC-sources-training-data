| intervals lo hi out placed |
intervals := #(#(1 3) #(6 9)).
lo := 2. hi := 5.
out := OrderedCollection new.
placed := false.
intervals do: [:iv |
    (iv last < lo)
        ifTrue: [out add: iv]
        ifFalse: [(iv first > hi)
            ifTrue: [
                placed ifFalse: [out add: (Array with: lo with: hi). placed := true].
                out add: iv]
            ifFalse: [lo := lo min: iv first. hi := hi max: iv last]]].
placed ifFalse: [out add: (Array with: lo with: hi)].
Transcript showCr: out printString. "OrderedCollection((1 5) (6 9))"
