"Moser-de Bruijn sequence: binary digits of n read in base 4."
| moser |
moser := [ :n | | m result place |
    m := n. result := 0. place := 1.
    [ m > 0 ] whileTrue: [
        (m bitAnd: 1) = 1 ifTrue: [ result := result + place ].
        m := m bitShift: -1.
        place := place * 4 ].
    result ].

0 to: 11 do: [ :n | Transcript show: (moser value: n) printString; show: ' ' ].
Transcript cr.
