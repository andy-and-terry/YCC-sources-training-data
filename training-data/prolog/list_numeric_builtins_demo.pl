:- numlist(1, 5, L), writeln(L).
:- numlist(1, 5, L), sum_list(L, S), max_list(L, Mx), min_list(L, Mn),
   format("sum=~w max=~w min=~w~n", [S, Mx, Mn]).
:- max_member(M, [apple, pear, fig]), writeln(M).
:- last([a, b, c], X), writeln(X).
:- nth0(1, [a, b, c], X), nth1(1, [a, b, c], Y), writeln(X/Y).
:- sumlist([1, 2, 3], S), writeln(S).
:- length(L, N), N >= 2, !, writeln(L-N).
:- delete([a, b, a, c], a, R), writeln(R).
:- subtract([1, 2, 3, 4], [2, 4], R), writeln(R).
:- exclude([X]>>(X < 3), [1, 2, 3, 4], R), writeln(R).
:- sumlist([], S), writeln(S).
