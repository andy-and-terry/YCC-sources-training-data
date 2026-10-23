-module(smith_numbers).
-export([main/0]).

digit_sum(N) -> lists:sum([C - $0 || C <- integer_to_list(N)]).

factors(1, _, Acc) -> Acc;
factors(N, P, Acc) when P * P > N -> [N | Acc];
factors(N, P, Acc) when N rem P =:= 0 -> factors(N div P, P, [P | Acc]);
factors(N, P, Acc) -> factors(N, P + 1, Acc).

is_smith(N) ->
    Fs = factors(N, 2, []),
    length(Fs) > 1 andalso digit_sum(N) =:= lists:sum([digit_sum(F) || F <- Fs]).

main() ->
    Smiths = [integer_to_list(N) || N <- lists:seq(2, 99), is_smith(N)],
    io:format("~s~n", [lists:flatten(lists:join(" ", Smiths))]).
