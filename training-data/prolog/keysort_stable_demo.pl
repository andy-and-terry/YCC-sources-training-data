% keysort/2 sorts Key-Value pairs by key only and is stable (keeps duplicates).
:- keysort([b-1, a-2, c-3, a-1, b-0], S), writeln(S).

% Sorting by value: swap, keysort, swap back.
by_value(Pairs, Sorted) :-
    findall(V-K, member(K-V, Pairs), Flipped),
    keysort(Flipped, SortedFlipped),
    findall(K-V, member(V-K, SortedFlipped), Sorted).
:- by_value([x-3, y-1, z-2, w-1], S), writeln(S).

:- pairs_keys_values(Pairs, [a, b, c], [1, 2, 3]), writeln(Pairs).
:- sort(1, @>=, [f(1, a), f(3, b), f(2, c), f(3, d)], S), writeln(S).
:- sort(0, @=<, [3, 1, 2, 1], S), writeln(S).

% group_pairs_by_key/2 needs a keysorted list.
:- keysort([k2-b, k1-a, k2-c], S), group_pairs_by_key(S, G), writeln(G).
