:- use_module(library(apply)).
:- use_module(library(lists)).

% Floyd-Warshall all-pairs shortest paths: for every waypoint K, relax
% every (I, J) pair through it. The matrix is a plain list of row lists,
% with a large sentinel standing in for "no edge yet".

at(Matrix, I, J, Val) :- nth0(I, Matrix, Row), nth0(J, Row, Val).

set_at(Matrix, I, J, Val, MatrixOut) :-
    nth0(I, Matrix, Row, RowsRest),
    nth0(J, Row, _, RowRest),
    nth0(J, RowOut, Val, RowRest),
    nth0(I, MatrixOut, RowOut, RowsRest).

relax_pair(K, I-J, MatrixIn, MatrixOut) :-
    at(MatrixIn, I, K, Dik),
    at(MatrixIn, K, J, Dkj),
    at(MatrixIn, I, J, Dij),
    Via is Dik + Dkj,
    (   Via < Dij
    ->  set_at(MatrixIn, I, J, Via, MatrixOut)
    ;   MatrixOut = MatrixIn
    ).

relax_for_k(N, K, MatrixIn, MatrixOut) :-
    Nm1 is N - 1,
    numlist(0, Nm1, Is),
    numlist(0, Nm1, Js),
    findall(I-J, (member(I, Is), member(J, Js)), Pairs),
    foldl(relax_pair(K), Pairs, MatrixIn, MatrixOut).

floyd_warshall(N, MatrixIn, MatrixOut) :-
    Nm1 is N - 1,
    numlist(0, Nm1, Ks),
    foldl(relax_for_k(N), Ks, MatrixIn, MatrixOut).

initial_matrix([
    [0, 3, 999999, 999999],
    [999999, 0, 1, 999999],
    [999999, 999999, 0, 7],
    [2, 999999, 999999, 0]
]).

:- initial_matrix(M),
   floyd_warshall(4, M, Result),
   forall(member(Row, Result), writeln(Row)).
