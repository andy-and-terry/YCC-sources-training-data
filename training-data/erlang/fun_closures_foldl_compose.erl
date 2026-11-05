-module(fun_closures_foldl_compose).
-export([run/0]).

compose(Fs) -> fun(X) -> lists:foldl(fun(F, Acc) -> F(Acc) end, X, Fs) end.

run() ->
    F = compose([fun(X) -> X + 1 end, fun(X) -> X * 10 end]),
    io:format("~p~n", [F(4)]).
