:- initialization(main).

even(X) :- 0 is X mod 2.

main :-
    numlist(1, 10, L),
    include(even, L, Evens), writeln(Evens),
    exclude(even, L, Odds), writeln(Odds),
    partition(>(5), L, Small, Big), writeln(Small-Big),
    foldl([X, A0, A]>>(A is A0 + X), L, 0, Sum), writeln(Sum),
    maplist([X, Y]>>(Y is X * 2), [1, 2, 3], Doubled), writeln(Doubled).
