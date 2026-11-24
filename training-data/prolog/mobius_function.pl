% Moebius function: 0 if n has a squared prime factor, else (-1)^k.
mobius(N, M) :- mobius_(N, 2, 1, M).

mobius_(Rest, P, Acc, M) :- P * P > Rest, !, ( Rest > 1 -> M is -Acc ; M = Acc ).
mobius_(Rest, P, Acc, M) :-
    Rest mod P =:= 0, !,
    R2 is Rest // P,
    (   R2 mod P =:= 0
    ->  M = 0
    ;   P1 is P + 1, Acc1 is -Acc, mobius_(R2, P1, Acc1, M)
    ).
mobius_(Rest, P, Acc, M) :- P1 is P + 1, mobius_(Rest, P1, Acc, M).

:- findall(M, (between(1, 30, N), mobius(N, M)), Ms), atomic_list_concat(Ms, ' ', A), writeln(A).
