triple(Limit, A, B, C) :-
    between(1, Limit, A),
    between(A, Limit, B),
    C2 is A * A + B * B,
    C is truncate(sqrt(C2)),
    C =< Limit,
    C * C =:= C2.

:- findall(A-B-C, triple(20, A, B, C), Ts), writeln(Ts).
:- aggregate_all(count, triple(100, _, _, _), N), format("~d triples up to 100~n", [N]).
