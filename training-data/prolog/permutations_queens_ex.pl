queens(N, Qs) :-
    numlist(1, N, Ns),
    permutation(Ns, Qs),
    safe(Qs).

safe([]).
safe([Q|Qs]) :- no_attack(Q, Qs, 1), safe(Qs).

no_attack(_, [], _).
no_attack(Q, [Q1|Qs], D) :-
    Q =\= Q1 + D, Q =\= Q1 - D,
    D1 is D + 1,
    no_attack(Q, Qs, D1).

:- queens(6, Qs), writeln(Qs).
