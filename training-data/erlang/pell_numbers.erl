-module(pell_numbers).
-export([main/0]).

%% P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
pell(0, _, _) -> [];
pell(N, A, B) -> [A | pell(N - 1, B, 2 * B + A)].

main() ->
    lists:foreach(
      fun({I, P}) -> io:format("P(~p) = ~p~n", [I, P]) end,
      lists:zip(lists:seq(0, 14), pell(15, 0, 1))).
