-module(powerful_numbers).
-export([main/0]).

factors(N) -> factors(N, 2, []).

factors(1, _P, Acc) -> Acc;
factors(N, P, Acc) when P * P > N -> [N | Acc];
factors(N, P, Acc) when N rem P =:= 0 -> factors(N div P, P, [P | Acc]);
factors(N, P, Acc) -> factors(N, P + 1, Acc).

is_powerful(N) ->
    Fs = factors(N),
    lists:all(fun(P) -> length([X || X <- Fs, X =:= P]) >= 2 end, lists:usort(Fs)).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 100), is_powerful(N)]]).
