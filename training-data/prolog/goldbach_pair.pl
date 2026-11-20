% Goldbach pair.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).
goldbach(N, P, Q) :- Half is N // 2, between(2, Half, P), Q is N - P, prime(P), prime(Q), !.
:- goldbach(28, P, Q), format("~w + ~w~n", [P, Q]).
