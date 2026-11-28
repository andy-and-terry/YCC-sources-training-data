:- table delannoy/3.
delannoy(0, _, 1) :- !.
delannoy(_, 0, 1) :- !.
delannoy(M, N, D) :-
    M1 is M - 1, N1 is N - 1,
    delannoy(M1, N, A), delannoy(M, N1, B), delannoy(M1, N1, C),
    D is A + B + C.

:- findall(D, (between(0, 7, I), delannoy(I, I, D)), Ds), writeln(Ds).
