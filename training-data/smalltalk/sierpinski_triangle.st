| n |
n := 8.
0 to: n - 1 do: [:r |
    | line |
    line := WriteStream on: String new.
    line nextPutAll: (String new: n - r - 1 withAll: $ ).
    0 to: r do: [:c |
        line nextPutAll: (((r bitAnd: c) = c) ifTrue: ['* '] ifFalse: ['  '])].
    Transcript showCr: line contents]
