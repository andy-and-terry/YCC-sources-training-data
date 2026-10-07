:- initialization(main).

main :-
    pairs_keys_values(P, [a, b, c], [1, 2, 3]), writeln(P),
    transpose_pairs(P, T), writeln(T),
    sumlist([1, 2, 3], S), writeln(S),
    length(L, 3), length(L, Len), writeln(Len),
    exclude([X]>>(X == b), [a, b, c], R), writeln(R),
    sumlist([], Z), writeln(Z).
