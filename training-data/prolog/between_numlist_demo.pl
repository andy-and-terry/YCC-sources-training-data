:- initialization(main).

main :-
    findall(X, between(1, 5, X), L1), writeln(L1),
    numlist(1, 5, L2), sum_list(L2, S), writeln(S),
    max_list(L2, Max), min_list(L2, Min), writeln(Max-Min),
    findall(Sq, (between(1, 5, N), Sq is N * N), Squares), writeln(Squares),
    ( between(1, inf, K), K * K > 50 -> writeln(K) ; true ).
