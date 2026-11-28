perm([], []).
perm(L, [H|T]) :- select(H, L, R), perm(R, T).

:- findall(P, perm([1,2,3], P), Ps), length(Ps, N), format("~w ~w~n", [N, Ps]).
