my_gcd(A, 0, A) :- !.
my_gcd(A, B, G) :-
    B > 0,
    R is A mod B,
    my_gcd(B, R, G).

my_lcm(A, B, L) :-
    my_gcd(A, B, G),
    L is abs(A * B) // G.

:- my_gcd(48, 18, G), writeln(G).
:- my_lcm(4, 6, L), writeln(L).
