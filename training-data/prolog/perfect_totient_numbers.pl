% Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
phi(N, P) :- aggregate_all(count, (between(1, N, K), gcd(K, N) =:= 1), P).

chain_sum(M, 0) :- M =< 1, !.
chain_sum(M, S) :- phi(M, P), chain_sum(P, S0), S is P + S0.

main :-
    findall(N, (between(2, 199, N), chain_sum(N, N)), L),
    atomic_list_concat(L, ' ', A), writeln(A).

:- initialization((main, halt)).
