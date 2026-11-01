"Leyland numbers: x^y + y^x for x >= y >= 2."
2 to: 4 do: [ :x |
    2 to: x do: [ :y |
        Transcript show: ((x raisedTo: y) + (y raisedTo: x)) printString; show: ' ' ] ].
Transcript cr.
