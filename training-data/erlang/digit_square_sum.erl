-module(digit_square_sum).
-export([main/0, compute/1]).

compute(N) when N < 0 -> compute(-N);
compute(0) -> 0;
compute(N) -> (N rem 10) * (N rem 10) + compute(N div 10).

main() ->
    io:format("~p ~p~n", [compute(123), compute(-99)]).
