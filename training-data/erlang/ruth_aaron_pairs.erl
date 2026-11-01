-module(ruth_aaron_pairs).
-export([main/0]).

%% Sum of prime factors counted with multiplicity.
sopfr(N) -> sopfr(N, 2, 0).

sopfr(1, _, Acc) -> Acc;
sopfr(N, P, Acc) when P * P > N -> Acc + N;
sopfr(N, P, Acc) when N rem P =:= 0 -> sopfr(N div P, P, Acc + P);
sopfr(N, P, Acc) -> sopfr(N, P + 1, Acc).

main() ->
    Out = [N || N <- lists:seq(2, 109), sopfr(N) =:= sopfr(N + 1)],
    io:format("~s~n", [string:join([integer_to_list(N) || N <- Out], " ")]).
