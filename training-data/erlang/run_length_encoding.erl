-module(run_length_encoding).
-export([encode/1, decode/1]).

encode([]) -> [];
encode([H | T]) -> encode(T, H, 1, []).

encode([], Curr, Count, Acc) ->
    lists:reverse([{Count, Curr} | Acc]);
encode([H | T], Curr, Count, Acc) when H =:= Curr ->
    encode(T, Curr, Count + 1, Acc);
encode([H | T], Curr, Count, Acc) ->
    encode(T, H, 1, [{Count, Curr} | Acc]).

decode(Pairs) ->
    lists:flatmap(fun({Count, Elem}) -> lists:duplicate(Count, Elem) end, Pairs).

run() ->
    Encoded = encode("aaabbbccd"),
    io:format("~p~n", [Encoded]),
    io:format("~p~n", [decode(Encoded)]).
