| isPerfectSquare |
isPerfectSquare := [:n | n >= 0 and: [| r | r := n sqrt rounded. r * r = n]].

((0 to: 29) select: [:n | isPerfectSquare value: n]) printNl.
