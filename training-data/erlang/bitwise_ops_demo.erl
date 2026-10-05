-module(bitwise_ops_demo).
-export([run/0, pop_count/1]).

pop_count(0) -> 0;
pop_count(N) -> (N band 1) + pop_count(N bsr 1).

run() ->
    V = 2#10110100,
    io:format("~s~n", [integer_to_list(V, 2)]),
    io:format("and: ~s~n", [integer_to_list(V band 2#1111, 2)]),
    io:format("or: ~s~n", [integer_to_list(V bor 1, 2)]),
    io:format("xor: ~s~n", [integer_to_list(V bxor 16#FF, 2)]),
    io:format("not: ~p~n", [bnot V]),
    io:format("shift left: ~p~n", [V bsl 2]),
    io:format("shift right: ~p~n", [V bsr 4]),
    io:format("pop count: ~p~n", [pop_count(V)]),
    io:format("bit 2 set: ~p~n", [(V band (1 bsl 2)) =/= 0]).
