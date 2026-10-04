-module(math_functions_demo).
-export([main/0]).

main() ->
    io:format("sqrt 2: ~.5f~n", [math:sqrt(2)]),
    io:format("pow 2^10: ~p~n", [math:pow(2, 10)]),
    io:format("pi: ~.6f~n", [math:pi()]),
    io:format("sin(pi/2): ~.3f~n", [math:sin(math:pi() / 2)]),
    io:format("log10 1000: ~p~n", [math:log10(1000)]),
    io:format("exp 1: ~.5f~n", [math:exp(1)]),
    io:format("round/trunc: ~p ~p~n", [round(2.5), trunc(-2.7)]),
    io:format("floor/ceil: ~p ~p~n", [floor(2.7), ceil(2.1)]),
    io:format("div/rem: ~p ~p ~p~n", [17 div 5, 17 rem 5, -17 rem 5]),
    io:format("abs: ~p ~p~n", [abs(-7), abs(-2.5)]),
    io:format("max/min: ~p ~p~n", [max(3, 9), min(3, 9)]),
    io:format("bigint: ~p~n", [lists:foldl(fun(X, A) -> X * A end, 1, lists:seq(1, 25))]),
    io:format("bit ops: ~p ~p ~p~n", [5 band 3, 5 bor 3, 5 bxor 3]),
    io:format("shifts: ~p ~p~n", [1 bsl 10, 1024 bsr 3]).
