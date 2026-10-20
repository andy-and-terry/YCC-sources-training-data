-module(list_comprehension_pythag).
-export([main/0]).

main() ->
    T = [{A, B, C} || C <- lists:seq(1, 20), B <- lists:seq(1, C), A <- lists:seq(1, B), A*A + B*B =:= C*C],
    io:format("~p~n", [T]).
