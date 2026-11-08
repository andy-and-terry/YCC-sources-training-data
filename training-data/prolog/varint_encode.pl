varint(N, [N]) :- N < 128, !.
varint(N, [B|Rest]) :-
    B is (N /\ 127) \/ 128,
    N1 is N >> 7,
    varint(N1, Rest).

:- varint(300, Bs), writeln(Bs).
