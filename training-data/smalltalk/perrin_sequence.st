"Perrin sequence P(n)=P(n-2)+P(n-3)"
| v |
v := OrderedCollection new.
v add: 3; add: 0; add: 2.
3 to: 9 do: [:i | v add: (v at: i + 1 - 2) + (v at: i + 1 - 3)].
Transcript showCr: v asArray printString.
