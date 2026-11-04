gcd_all(List, G) :- foldl([N, A, B]>>(B is gcd(A, N)), List, 0, G).

:- gcd_all([12, 18, 24], G), writeln(G).
:- gcd_all([7, 13], G), writeln(G).
