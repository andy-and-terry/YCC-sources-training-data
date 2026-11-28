-module(binary_parse_packet).
-export([main/0]).

main() ->
    <<Ver:8, Len:16, Payload:Len/binary, _/binary>> = <<1, 0, 3, "abcXYZ">>,
    io:format("~p ~p ~s~n", [Ver, Len, Payload]).
