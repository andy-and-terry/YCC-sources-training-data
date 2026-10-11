-module(trapezoid_integration).
-export([run/0, integrate/4]).

integrate(F, A, B, N) ->
    H = (B - A) / N,
    Inner = lists:sum([F(A + I * H) || I <- lists:seq(1, N - 1)]),
    H * ((F(A) + F(B)) / 2 + Inner).

run() ->
    Sq = fun(X) -> X * X end,
    io:format("~.4f~n", [integrate(Sq, 0, 3, 1000)]),
    io:format("~.4f~n", [integrate(fun math:sin/1, 0, math:pi(), 1000)]).
