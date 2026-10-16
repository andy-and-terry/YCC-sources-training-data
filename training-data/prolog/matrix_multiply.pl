dot(Xs, Ys, D) :-
    foldl([X, Y, A0, A]>>(A is A0 + X * Y), Xs, Ys, 0, D).

transpose_rows([[]|_], []) :- !.
transpose_rows(M, [Col|Cols]) :-
    maplist([[H|T], H, T]>>true, M, Col, Rest),
    transpose_rows(Rest, Cols).

mat_mul(A, B, C) :-
    transpose_rows(B, Bt),
    maplist({Bt}/[Row, CRow]>>maplist(dot(Row), Bt, CRow), A, C).

:- mat_mul([[1,2],[3,4]], [[5,6],[7,8]], C), writeln(C).
:- mat_mul([[1,0,2]], [[1],[2],[3]], C), writeln(C).
