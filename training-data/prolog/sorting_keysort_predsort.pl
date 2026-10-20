by_len(Order, A, B) :- atom_length(A, LA), atom_length(B, LB), compare(Order0, LA, LB), ( Order0 = (=) -> compare(Order, A, B) ; Order = Order0 ).

main :-
    sort([c, a, b, a], S1), format("~w~n", [S1]),
    sort(0, @>=, [1, 3, 2, 3], S2), format("~w~n", [S2]),
    msort([b, a, c, a], S3), format("~w~n", [S3]),
    predsort(by_len, [pear, fig, apple, kiwi], S4), format("~w~n", [S4]),
    keysort([b-2, a-1, c-3, a-0], S5), format("~w~n", [S5]),
    pairs_keys_values(Ps, [x, y], [1, 2]), pairs_values(Ps, Vs), format("~w ~w~n", [Ps, Vs]),
    sort(2, @>=, [f(a, 1), f(b, 3), f(c, 2)], S6), format("~w~n", [S6]),
    compare(O, 1, 2), compare(O2, b, a), format("~w ~w~n", [O, O2]),
    ( 1 @< a -> writeln(number_before_atom) ; true ),
    ( f(a) @> a -> writeln(compound_after_atom) ; true ),
    length(L, 2), format("~w~n", [L]),
    max_member(M, [3, 1, 4]), min_member(Mi, [3, 1, 4]), format("~w ~w~n", [M, Mi]),
    last([1, 2, 3], La), sumlist([1, 2, 3], Su), format("~w ~w~n", [La, Su]),
    permutation([1, 2, 3], P), P = [3|_], format("~w~n", [P]).
:- initialization(main).
