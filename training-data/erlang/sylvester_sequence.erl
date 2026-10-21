-module(sylvester_sequence).
-export([main/0]).

%% Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
sylvester(0, _) -> [];
sylvester(N, S) -> [S | sylvester(N - 1, S * S - S + 1)].

main() ->
    lists:foreach(
      fun({I, S}) -> io:format("s(~p) = ~p~n", [I, S]) end,
      lists:zip(lists:seq(0, 7), sylvester(8, 2))).
