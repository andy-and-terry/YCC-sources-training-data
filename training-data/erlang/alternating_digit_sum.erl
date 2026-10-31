-module(alternating_digit_sum).
-export([main/0]).

alternating_digit_sum(N) -> alternating_digit_sum(N, 1, 0).

alternating_digit_sum(0, _Sign, Acc) -> Acc;
alternating_digit_sum(N, Sign, Acc) ->
    alternating_digit_sum(N div 10, -Sign, Acc + Sign * (N rem 10)).

main() ->
    [io:format("~p ~p~n", [N, alternating_digit_sum(N)]) || N <- [1234, 99999, 1000]],
    ok.
