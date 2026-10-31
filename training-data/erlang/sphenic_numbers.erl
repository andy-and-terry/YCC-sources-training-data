-module(sphenic_numbers).
-export([main/0]).

factors(N) -> factors(N, 2, []).

factors(1, _P, Acc) -> lists:reverse(Acc);
factors(N, P, Acc) when P * P > N -> lists:reverse([N | Acc]);
factors(N, P, Acc) when N rem P =:= 0 -> factors(N div P, P, [P | Acc]);
factors(N, P, Acc) -> factors(N, P + 1, Acc).

is_sphenic(N) ->
    Fs = factors(N),
    length(Fs) =:= 3 andalso length(lists:usort(Fs)) =:= 3.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(2, 79), is_sphenic(N)]]).
