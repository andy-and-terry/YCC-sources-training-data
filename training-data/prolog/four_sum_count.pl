four_sum_count(A, B, C, D, Count) :-
    findall(S, (member(X, A), member(Y, B), S is X + Y), AB),
    findall(S, (member(X, C), member(Y, D), S is -(X + Y)), CD),
    aggregate_all(count, (member(S, CD), member(S, AB)), Count).

:- four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2], N), format("~w~n", [N]).  % 2
