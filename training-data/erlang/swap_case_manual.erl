-module(swap_case_manual).
-export([main/0, swap_case/1]).

swap_case(S) ->
    [swap(C) || C <- S].

swap(C) when C >= $a, C =< $z -> C - 32;
swap(C) when C >= $A, C =< $Z -> C + 32;
swap(C) -> C.

main() ->
    io:format("~s~n", [swap_case("Hello World 42")]).
