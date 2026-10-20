:- dynamic counter/1, fact/2.
counter(0).

incr :- retract(counter(N)), N1 is N + 1, assertz(counter(N1)).

main :-
    incr, incr, incr, counter(V), format("counter ~w~n", [V]),
    assertz(fact(a, 1)), assertz(fact(b, 2)), asserta(fact(z, 0)),
    findall(K-X, fact(K, X), L), format("~w~n", [L]),
    retract(fact(a, _)),
    ( fact(a, _) -> writeln(still) ; writeln(removed) ),
    retractall(fact(_, _)),
    aggregate_all(count, fact(_, _), Cnt), format("remaining ~w~n", [Cnt]),
    forall(between(1, 3, I), assertz(fact(I, I))),
    aggregate_all(sum(Y), fact(_, Y), Sum), aggregate_all(max(Y2), fact(_, Y2), Max),
    format("~w ~w~n", [Sum, Max]),
    ( predicate_property(fact(_, _), dynamic) -> writeln(dynamic) ; true ).
:- initialization(main).
