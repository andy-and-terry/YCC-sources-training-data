transpose_matrix([], []).
transpose_matrix([[]|_], []) :- !.
transpose_matrix(Matrix, [Row|Rest]) :-
    maplist([L,H]>>(L = [H|_]), Matrix, Row),
    maplist([L,T]>>(L = [_|T]), Matrix, Tails),
    transpose_matrix(Tails, Rest).

:- transpose_matrix([[1,2],[3,4]], T), writeln(T).
