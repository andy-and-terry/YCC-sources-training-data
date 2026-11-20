"Remove consecutive duplicate characters."
| s out |
s := 'aabbbcdd'.
out := WriteStream on: String new.
s doWithIndex: [:c :i | (i = 1 or: [c ~= (s at: i - 1)]) ifTrue: [out nextPut: c]].
Transcript showCr: out contents.
