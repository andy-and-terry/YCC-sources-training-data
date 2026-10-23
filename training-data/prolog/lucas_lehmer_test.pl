% Lucas-Lehmer test: Mersenne prime exponents p <= 19.
is_prime(N) :-
    N >= 2,
    \+ ( between(2, N, D), D * D =< N, N mod D =:= 0 ).

lucas_lehmer(2) :- !.
lucas_lehmer(P) :-
    Mp is 2 ^ P - 1,
    Steps is P - 2,
    iterate(Steps, Mp, 4, S),
    S =:= 0.

iterate(0, _, S, S) :- !.
iterate(K, M, S0, S) :-
    S1 is (S0 * S0 - 2) mod M,
    K1 is K - 1,
    iterate(K1, M, S1, S).

:- findall(P, (between(2, 19, P), is_prime(P), lucas_lehmer(P)), Ps),
   atomic_list_concat(Ps, ' ', Line),
   writeln(Line).
