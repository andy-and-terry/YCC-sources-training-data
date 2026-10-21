% Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan(0, 1).
padovan(1, 1).
padovan(2, 1).
padovan(N, P) :-
    N > 2,
    A is N - 2, B is N - 3,
    padovan(A, PA), padovan(B, PB),
    P is PA + PB.

:- findall(P, (between(0, 14, N), padovan(N, P)), Ps),
   atomic_list_concat(Ps, ' ', Out),
   writeln(Out).
