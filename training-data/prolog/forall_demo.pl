% forall(Cond, Action) succeeds if Action holds for every solution of Cond.
:- forall(member(X, [2, 4, 6]), 0 is X mod 2), writeln(all_even).
:- ( forall(member(X, [2, 3, 6]), 0 is X mod 2) -> writeln(all_even) ; writeln(not_all_even) ).
:- forall(between(1, 3, I), (J is I * I, format("~w squared is ~w~n", [I, J]))).

subset_of(A, B) :- forall(member(X, A), memberchk(X, B)).
:- ( subset_of([a, c], [a, b, c]) -> writeln(subset) ; writeln(not_subset) ).
:- ( subset_of([a, z], [a, b, c]) -> writeln(subset) ; writeln(not_subset) ).
