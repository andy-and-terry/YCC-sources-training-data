Object subclass: Shoelace [
    Shoelace class >> area: pts [
        | s n |
        s := 0. n := pts size.
        1 to: n do: [:i | | p q |
            p := pts at: i.
            q := pts at: i \\ n + 1.
            s := s + ((p x * q y) - (q x * p y))].
        ^s abs / 2
    ]
]

(Shoelace area: {0@0. 4@0. 4@3. 0@3}) printNl.
