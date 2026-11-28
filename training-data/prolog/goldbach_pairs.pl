prime(2).
prime(N) :- N > 2, N mod 2 =\= 0, \+ has_factor(N, 3).

has_factor(N, F) :- F * F =< N, ( N mod F =:= 0 ; F2 is F + 2, has_factor(N, F2) ).

goldbach(N, P, Q) :- Half is N // 2, between(2, Half, P), Q is N - P, prime(P), prime(Q).

:- forall(goldbach(28, P, Q), (write(P + Q), nl)).
