-module(self_describing_numbers).
-export([main/0]).

is_self_describing(N) ->
    S = integer_to_list(N),
    lists:all(fun({I, C}) ->
                  length([X || X <- S, X =:= $0 + I]) =:= C - $0
              end, lists:zip(lists:seq(0, length(S) - 1), S)).

main() ->
    [io:format("~p ~p~n", [N, is_self_describing(N)]) || N <- [1210, 2020, 21200, 1211]],
    ok.
