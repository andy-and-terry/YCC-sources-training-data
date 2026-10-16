:- select(b, [a, b, c, b], Rest), writeln(Rest).
:- findall(Rest, select(b, [a, b, c, b], Rest), All), writeln(All).
:- selectchk(b, [a, b, c, b], Rest), writeln(Rest).
:- select(b, [a, c], x, Out) -> writeln(Out) ; writeln('no b to replace').
:- select(b, [a, b, c], x, Out), writeln(Out).

% select/3 enumerates picks, which gives permutations in a few lines.
perm([], []).
perm(L, [H|T]) :- select(H, L, R), perm(R, T).
:- findall(P, perm([1, 2, 3], P), Ps), length(Ps, N), writeln(N).

:- subtract([a, b, c, d], [b, d], Left), writeln(Left).
:- exclude(==(b), [a, b, c, b], Without), writeln(Without).
