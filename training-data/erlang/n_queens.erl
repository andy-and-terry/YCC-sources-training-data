-module(n_queens).
-export([solve/1]).

solve(N) -> place([], N).

place(Queens, N) when length(Queens) =:= N -> [lists:reverse(Queens)];
place(Queens, N) ->
    lists:flatmap(
        fun(Col) ->
            case safe(Queens, Col) of
                true -> place([Col | Queens], N);
                false -> []
            end
        end,
        lists:seq(0, N - 1)
    ).

safe(Queens, Col) ->
    Indexed = lists:zip(Queens, lists:seq(1, length(Queens))),
    lists:all(
        fun({Q, Dist}) -> Q =/= Col andalso abs(Q - Col) =/= Dist end,
        Indexed
    ).
