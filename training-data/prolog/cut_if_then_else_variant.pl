sign(X, S) :- ( X > 0 -> S = pos ; X < 0 -> S = neg ; S = zero ).

:- forall(member(X, [5, -2, 0]), (sign(X, S), format("~w ~w~n", [X, S]))).
