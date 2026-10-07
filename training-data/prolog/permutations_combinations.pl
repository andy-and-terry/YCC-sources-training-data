combination(0, _, []) :- !.
combination(N, List, [H|Rest]) :-
    N > 0,
    append(_, [H|Tail], List),
    N1 is N - 1,
    combination(N1, Tail, Rest).

:- findall(P, permutation([a, b, c], P), Perms),
   length(Perms, Count),
   writeln(Perms),
   format("total permutations: ~w~n", [Count]).

:- findall(C, combination(2, [a, b, c, d], C), Combos),
   writeln(Combos).
