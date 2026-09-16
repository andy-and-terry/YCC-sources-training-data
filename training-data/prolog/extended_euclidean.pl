ext_gcd(A, 0, A, 1, 0) :- !.
ext_gcd(A, B, G, X, Y) :-
    B > 0,
    R is A mod B,
    Q is A // B,
    ext_gcd(B, R, G, X1, Y1),
    X is Y1,
    Y is X1 - Q * Y1.

:- ext_gcd(240, 46, G, X, Y),
   format("gcd=~w x=~w y=~w~n", [G, X, Y]),
   Check is 240 * X + 46 * Y,
   writeln(Check).
:- ext_gcd(35, 15, G2, X2, Y2),
   format("gcd=~w x=~w y=~w~n", [G2, X2, Y2]).
