% A magic square's rows, columns and both diagonals all sum to the same
% value; column and diagonal sums are read off by index rather than by
% transposing the matrix.
col_sum(Rows, ColIndex, Sum) :-
    findall(V, (member(Row, Rows), nth0(ColIndex, Row, V)), Vals),
    sum_list(Vals, Sum).

diag1_sum(Rows, Sum) :-
    length(Rows, N), N1 is N - 1,
    findall(V, (between(0, N1, I), nth0(I, Rows, Row), nth0(I, Row, V)), Vals),
    sum_list(Vals, Sum).

diag2_sum(Rows, Sum) :-
    length(Rows, N), N1 is N - 1,
    findall(V, (between(0, N1, I), nth0(I, Rows, Row), J is N1 - I, nth0(J, Row, V)), Vals),
    sum_list(Vals, Sum).

is_magic_square(Rows) :-
    maplist(sum_list, Rows, RowSums),
    length(Rows, N), N1 is N - 1,
    findall(S, (between(0, N1, I), col_sum(Rows, I, S)), ColSums),
    diag1_sum(Rows, D1),
    diag2_sum(Rows, D2),
    append(RowSums, ColSums, Sums0),
    Sums = [D1, D2|Sums0],
    Sums = [First|Rest],
    forall(member(S, Rest), S =:= First).

:- ( is_magic_square([[2, 7, 6], [9, 5, 1], [4, 3, 8]]) -> writeln(magic) ; writeln(not_magic) ).
:- ( is_magic_square([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) -> writeln(magic) ; writeln(not_magic) ).
