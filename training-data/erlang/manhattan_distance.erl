-module(manhattan_distance).
-export([main/0]).
%% Manhattan distance.
manhattan(A, B) -> lists:sum([abs(X - Y) || {X, Y} <- lists:zip(A, B)]).
main() -> io:format("~p~n", [manhattan([1, 2], [4, 6])]).
