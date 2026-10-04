:- use_module(library(ordsets)).
:- initialization(main).

main :-
    list_to_ord_set([d, b, a, c, b], A),
    list_to_ord_set([c, d, e, f], B),
    format("A = ~w, B = ~w~n", [A, B]),
    ord_union(A, B, U), format("union: ~w~n", [U]),
    ord_intersection(A, B, I), format("intersection: ~w~n", [I]),
    ord_subtract(A, B, D), format("difference: ~w~n", [D]),
    ord_symdiff(A, B, S), format("symmetric difference: ~w~n", [S]),
    ord_add_element(A, z, A2), ord_del_element(A2, a, A3),
    format("add z, delete a: ~w~n", [A3]),
    ( ord_memberchk(c, A) -> writeln("c is a member of A") ; true ),
    ( ord_subset([a, b], A) -> writeln("[a,b] is a subset of A") ; true ),
    ( ord_disjoint([a], [b]) -> writeln("[a] and [b] are disjoint") ; true ),
    ord_union([[a, b], [b, c], [x]], All), format("union of many: ~w~n", [All]),
    length(A, Len), format("size of A: ~w~n", [Len]),
    ord_insert_demo.

ord_insert_demo :-
    foldl([X, S0, S]>>ord_add_element(S0, X), [5, 3, 9, 3, 1], [], Set),
    format("built by folding: ~w~n", [Set]).
