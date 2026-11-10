-module(emirps).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

rev(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

collect(_, 0, Acc) -> lists:reverse(Acc);
collect(N, Left, Acc) ->
    R = rev(N),
    case R =/= N andalso is_prime(N) andalso is_prime(R) of
        true -> collect(N + 1, Left - 1, [N | Acc]);
        false -> collect(N + 1, Left, Acc)
    end.

main() -> io:format("~p~n", [collect(2, 10, [])]). % [13,17,31,37,71,73,79,97,107,113]
