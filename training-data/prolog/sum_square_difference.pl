% Square of the sum minus sum of squares for 1..10 (expect 2640)
main :-
    numlist(1, 10, Xs),
    sum_list(Xs, Sum),
    findall(Q, (member(X, Xs), Q is X * X), Qs),
    sum_list(Qs, Squares),
    D is Sum * Sum - Squares,
    writeln(D).

:- initialization(main).
