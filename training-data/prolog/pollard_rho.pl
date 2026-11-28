rho(N, 2) :- 0 is N mod 2, !.
rho(N, D) :- rho(2, 2, N, D).

rho(X, Y, N, D) :-
    X1 is (X * X + 1) mod N,
    Y0 is (Y * Y + 1) mod N,
    Y1 is (Y0 * Y0 + 1) mod N,
    G is gcd(abs(X1 - Y1), N),
    ( G =:= 1 -> rho(X1, Y1, N, D) ; D = G ).

:- N = 8051, rho(N, P), Q is N // P, format("~w = ~w * ~w~n", [N, P, Q]).
