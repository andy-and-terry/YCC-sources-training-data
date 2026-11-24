% Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum(N, S) :-
    H is N // 2,
    findall(D, (between(1, H, D), N mod D =:= 0), Ds),
    sum_list(Ds, S).

aliquot(N, Count, [N]) :- ( N =< 1 ; Count >= 19 ), !.
aliquot(N, Count, [N | Rest]) :-
    aliquot_sum(N, Next), C1 is Count + 1, aliquot(Next, C1, Rest).

:- aliquot(12, 0, Seq), atomic_list_concat(Seq, ' ', A), writeln(A).
