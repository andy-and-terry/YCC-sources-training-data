popcount(0, 0) :- !.
popcount(N, C) :- B is N /\ 1, M is N >> 1, popcount(M, C0), C is C0 + B.

gould(N, G) :- popcount(N, C), G is 1 << C.

:- numlist(0, 15, Ns), maplist(gould, Ns, Gs), writeln(Gs).
