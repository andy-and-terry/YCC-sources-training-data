main :-
    L = [c, a, b, a],
    nth0(1, L, X0), nth1(1, L, X1),
    last(L, La),
    format("~w ~w ~w~n", [X0, X1, La]),
    msort(L, M), writeln(M),
    sort(L, S), writeln(S),
    sort(0, @>=, L, D), writeln(D),
    sumlist([1,2,3], Sum), writeln(Sum),
    max_member(Mx, L), writeln(Mx).

:- initialization(main).
