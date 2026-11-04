suffix(N, th) :- R is N mod 100, between(11, 13, R), !.
suffix(N, st) :- N mod 10 =:= 1, !.
suffix(N, nd) :- N mod 10 =:= 2, !.
suffix(N, rd) :- N mod 10 =:= 3, !.
suffix(_, th).

ordinal(N, Text) :- suffix(N, S), format(atom(Text), "~d~w", [N, S]).

:- forall(member(N, [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]),
          ( ordinal(N, T), format("~w ", [T]) )), nl.
