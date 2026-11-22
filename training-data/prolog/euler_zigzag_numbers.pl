% Euler zigzag numbers via the Seidel-Entringer boustrophedon.
step(Row, Next) :-
    reverse(Row, Rev),
    foldl([X, [H | T], [S, H | T]]>>(S is H + X), Rev, [0], Acc),
    reverse(Acc, Next).

zigzag(0, _, []) :- !.
zigzag(K, Row, [Last | T]) :-
    last(Row, Last),
    step(Row, Next),
    K1 is K - 1,
    zigzag(K1, Next, T).

main :-
    zigzag(10, [1], L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
