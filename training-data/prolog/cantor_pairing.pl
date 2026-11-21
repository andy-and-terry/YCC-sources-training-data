% Cantor pairing function and its inverse.
pair(X, Y, Z) :- Z is (X + Y) * (X + Y + 1) // 2 + Y.

unpair(Z, X, Y) :-
    W is (truncate(sqrt(8 * Z + 1)) - 1) // 2,
    Y is Z - W * (W + 1) // 2,
    X is W - Y.

main :-
    pair(3, 4, Z), writeln(Z),
    unpair(32, X, Y), format("~w ~w~n", [X, Y]).

:- initialization((main, halt)).
