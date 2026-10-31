-module(multiplicative_persistence).
-export([main/0]).

digit_product(0) -> 1;
digit_product(N) -> (N rem 10) * digit_product(N div 10).

persistence(N) when N < 10 -> 0;
persistence(N) -> 1 + persistence(digit_product(N)).

main() ->
    [io:format("~p ~p~n", [N, persistence(N)]) || N <- [39, 77, 999, 10]],
    ok.
