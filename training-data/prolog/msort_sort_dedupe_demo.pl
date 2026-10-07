:- initialization(main).

main :-
    L = [c, a, b, a, c],
    sort(L, Dedup), writeln(Dedup),
    msort(L, Stable), writeln(Stable),
    sort(0, @>=, [3, 1, 2, 3], Desc), writeln(Desc),
    list_to_set(L, Set), writeln(Set),
    pairs_keys_values(Pairs, [b, a], [2, 1]), keysort(Pairs, Sorted), writeln(Sorted).
