-module(binary_pattern_parse_ex).
-export([main/0]).

main() ->
    <<Ver:4, Len:12, Rest/binary>> = <<16#1005:16, "hello">>,
    io:format("~p ~p ~p~n", [Ver, Len, Rest]),
    Bin = <<1, 2, 3, 4>>,
    io:format("~p~n", [[X * 2 || <<X>> <= Bin]]).
