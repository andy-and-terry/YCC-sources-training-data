% Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
repunits(0, _) :- !.
repunits(K, R0) :-
    R is R0 * 10 + 1,
    ( R mod 3 =:= 0 -> format("~d  (divisible by 3)~n", [R]) ; format("~d~n", [R]) ),
    K1 is K - 1, repunits(K1, R).

:- repunits(8, 0).
