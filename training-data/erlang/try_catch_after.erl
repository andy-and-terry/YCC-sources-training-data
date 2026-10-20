-module(try_catch_after).
-export([main/0]).

main() ->
    R = try 1 div 0 catch error:badarith -> caught after io:format("cleanup~n") end,
    io:format("~p~n", [R]).
