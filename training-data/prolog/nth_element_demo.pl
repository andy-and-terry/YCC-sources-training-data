:- nth0(0, [a, b, c], X), writeln(X).
:- nth1(1, [a, b, c], X), writeln(X).
:- findall(I-E, nth0(I, [x, y, z], E), L), writeln(L).
:- nth0(1, L, new, [a, b, c]), writeln(L).
:- last([1, 2, 3], X), writeln(X).
:- sumlist([1, 2, 3], S), sum_list([4, 5], T), writeln(S-T).
:- max_list([3, 9, 2], Mx), min_list([3, 9, 2], Mn), writeln(Mx/Mn).
:- numlist(1, 5, L), sumlist(L, S), writeln(L-S).
:- length(L, 3), writeln(L).
:- exclude([X]>>(X mod 2 =:= 0), [1, 2, 3, 4], O), writeln(O).
:- partition([X]>>(X < 3), [1, 2, 3, 4, 5], In, Out), writeln(In/Out).
:- delete([a, b, a, c], a, R), writeln(R).
:- subtract([1, 2, 3, 4], [2, 4], R), writeln(R).
:- list_to_set([a, b, a, c, b], S), writeln(S).
