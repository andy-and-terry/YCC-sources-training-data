% Generate-and-test with between/3 over a bounded search space.
triple(Max, A, B, C) :-
    between(1, Max, A),
    between(A, Max, B),
    C2 is A * A + B * B,
    C is truncate(sqrt(C2)),
    C =< Max,
    C * C =:= C2.

:- findall(A-B-C, triple(20, A, B, C), Ts), forall(member(T, Ts), writeln(T)).
:- aggregate_all(count, triple(100, _, _, _), N), format("~w triples up to 100~n", [N]).
