-module(matrix_operations).
-export([transpose/1, multiply/2]).

transpose([[] | _]) -> [];
transpose(Matrix) ->
    [lists:map(fun hd/1, Matrix) | transpose(lists:map(fun tl/1, Matrix))].

multiply(A, B) ->
    Bt = transpose(B),
    [[dot(Row, Col) || Col <- Bt] || Row <- A].

dot(Row, Col) ->
    lists:sum(lists:zipwith(fun(X, Y) -> X * Y end, Row, Col)).
