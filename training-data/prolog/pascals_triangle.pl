% Pascal's triangle: each row is built from the previous one by padding
% it with a 0 on each side and summing the two shifted copies pairwise.
pascal_row(0, [1]).
pascal_row(N, Row) :-
    N > 0,
    N1 is N - 1,
    pascal_row(N1, PrevRow),
    next_row(PrevRow, Row).

next_row(PrevRow, Row) :-
    append([0], PrevRow, Left),
    append(PrevRow, [0], Right),
    maplist([A, B, S]>>(S is A + B), Left, Right, Row).

pascal_triangle(N, Triangle) :-
    findall(Row, (between(0, N, I), pascal_row(I, Row)), Triangle).

:- pascal_triangle(5, Triangle), forall(member(Row, Triangle), writeln(Row)).
