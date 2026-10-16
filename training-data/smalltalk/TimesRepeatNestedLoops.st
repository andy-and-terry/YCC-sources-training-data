| row |
1 to: 4 do: [ :i |
    row := WriteStream on: String new.
    1 to: i do: [ :j | row nextPutAll: '* ' ].
    Transcript showCr: row contents ].

1 to: 3 do: [ :i |
    1 to: 3 do: [ :j |
        Transcript show: (i * j) printString; tab ].
    Transcript cr ].

3 timesRepeat: [ Transcript show: 'hi ' ].
Transcript cr.

(1 to: 3) do: [ :i | Transcript show: i printString ] separatedBy: [ Transcript show: '-' ].
Transcript cr.
