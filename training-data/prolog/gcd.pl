my_gcd(A, 0, A) :- !.
my_gcd(A, B, G) :- B > 0, R is A mod B, my_gcd(B, R, G).

:- my_gcd(48, 18, G1), writeln(G1).
:- my_gcd(100, 75, G2), writeln(G2).
