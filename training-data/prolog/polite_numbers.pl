% Ways to write N as a sum of two or more consecutive positive integers.
polite_ways(N, Ways) :-
    findall(K, (between(2, N, K), K*(K+1)//2 =< N, (N - K*(K-1)//2) mod K =:= 0), Ks),
    length(Ks, Ways).

main :-
    findall(W, (between(1, 16, N), polite_ways(N, W)), Ws),
    atomic_list_concat(Ws, ' ', Out),
    writeln(Out).

:- initialization(main).
