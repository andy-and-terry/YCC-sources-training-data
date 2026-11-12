:- initialization(main).
main :- findall(X, between(1, 5, X), L), writeln(L),
        sum_list(L, S), max_list(L, M), writeln(S-M),
        numlist(1, 4, NL), foldl([X,A,B]>>(B is A*X), NL, 1, F), writeln(F).
