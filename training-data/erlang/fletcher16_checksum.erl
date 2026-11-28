-module(fletcher16_checksum).
-export([main/0, fletcher16/1]).

fletcher16(Bin) ->
    {S1, S2} = lists:foldl(
        fun(B, {A, C}) ->
            A2 = (A + B) rem 255,
            {A2, (C + A2) rem 255}
        end,
        {0, 0},
        binary_to_list(Bin)),
    (S2 bsl 8) bor S1.

main() ->
    io:format("~.16b~n", [fletcher16(<<"abcde">>)]).
