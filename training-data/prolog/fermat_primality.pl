% Fermat primality test; Carmichael number 561 fools it.
powmod(_, 0, M, R) :- !, R is 1 mod M.
powmod(B, E, M, R) :-
    E mod 2 =:= 0, !,
    H is E // 2,
    powmod(B, H, M, X),
    R is X * X mod M.
powmod(B, E, M, R) :-
    E1 is E - 1,
    powmod(B, E1, M, X),
    R is B * X mod M.

probably_prime(N) :- N > 2, N1 is N - 1, powmod(2, N1, N, 1).

report(N) :-
    ( probably_prime(N) -> T = true ; T = false ),
    format("~w ~w~n", [N, T]).

:- forall(member(N, [97, 91, 561]), report(N)).
