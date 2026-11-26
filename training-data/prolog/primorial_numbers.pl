% Primorials up to 1e6, including 1; expect 8 values.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

% primorials(+P, +Acc, -List): list of products of the primes >= P times Acc, within the limit.
primorials(P, Acc, Out) :-
    (   prime(P)
    ->  Next is Acc * P,
        (   Next =< 1000000
        ->  Out = [Next|T], P1 is P + 1, primorials(P1, Next, T)
        ;   Out = []
        )
    ;   P1 is P + 1, primorials(P1, Acc, Out)
    ).

:- primorials(2, 1, Ps), Vs = [1|Ps], length(Vs, L), writeln(L), writeln(Vs).
