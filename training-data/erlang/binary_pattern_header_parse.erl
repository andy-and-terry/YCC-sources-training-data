-module(bin_header).
-export([main/0]).
main() ->
    <<Ver:4, Len:4, Rest/binary>> = <<16#34, 1, 2, 3, 4>>,
    io:format("~p ~p ~p~n", [Ver, Len, Rest]).
