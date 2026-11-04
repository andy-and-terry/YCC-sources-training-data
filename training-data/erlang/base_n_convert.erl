-module(base_n_convert).
-export([main/0]).

main() ->
    lists:foreach(
      fun(B) -> io:format("255 in base ~p = ~s~n", [B, string:lowercase(integer_to_list(255, B))]) end,
      [2, 8, 16, 36]),
    io:format("~p~n", [list_to_integer("zz", 36)]),
    io:format("~p~n", [catch list_to_integer("9", 8)]).
