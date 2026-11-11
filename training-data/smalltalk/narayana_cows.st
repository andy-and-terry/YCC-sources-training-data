"Narayana's cows N(n)=N(n-1)+N(n-3)"
| v |
v := OrderedCollection new.
v add: 1; add: 1; add: 1.
3 to: 9 do: [:i | v add: (v at: i + 1 - 1) + (v at: i + 1 - 3)].
Transcript showCr: v asArray printString.
