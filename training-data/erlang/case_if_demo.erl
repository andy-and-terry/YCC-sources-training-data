-module(case_if_demo).
-export([sign/1, classify/1, run/0]).

sign(N) ->
    if
        N > 0 -> positive;
        N < 0 -> negative;
        true -> zero
    end.

classify(Value) ->
    case Value of
        {ok, N} when is_integer(N), N > 100 -> big_ok;
        {ok, _} -> ok;
        {error, Reason} when is_atom(Reason) -> {failed, Reason};
        [] -> empty;
        [_ | _] -> non_empty;
        _ -> unknown
    end.

run() ->
    [io:format("~p -> ~p~n", [N, sign(N)]) || N <- [5, -3, 0]],
    [io:format("~p -> ~p~n", [V, classify(V)])
     || V <- [{ok, 500}, {ok, 5}, {error, timeout}, [], [1], "x", 42]].
