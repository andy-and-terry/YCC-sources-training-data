safe(_, [], _).
safe(Col, [Q|Qs], Dist) :-
    Col =\= Q,
    abs(Col - Q) =\= Dist,
    Dist1 is Dist + 1,
    safe(Col, Qs, Dist1).

queens(N, Queens) :-
    numlist(1, N, Nums),
    permutation(Nums, Queens),
    safe_all(Queens).

safe_all([]).
safe_all([Q|Qs]) :-
    safe(Q, Qs, 1),
    safe_all(Qs).

:- findall(Q, queens(6, Q), All), length(All, Count), writeln(Count).
