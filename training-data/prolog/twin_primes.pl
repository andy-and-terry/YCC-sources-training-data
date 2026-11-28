prime(2).
prime(N) :- N > 2, N mod 2 =\= 0, \+ has_factor(N, 3).

has_factor(N, F) :- F * F =< N, ( N mod F =:= 0 ; F2 is F + 2, has_factor(N, F2) ).

twin(P, Q) :- between(3, 48, P), Q is P + 2, prime(P), prime(Q).

:- forall(twin(P, Q), (write((P, Q)), nl)).
