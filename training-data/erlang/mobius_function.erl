-module(mobius_function).
-export([main/0]).

%% Moebius function: 0 if n has a squared prime factor, else (-1)^k.
mobius(N) -> go(N, 2, 1).

go(M, P, Acc) when P * P > M -> if M > 1 -> -Acc; true -> Acc end;
go(M, P, Acc) when M rem P =:= 0 ->
    M2 = M div P,
    case M2 rem P of
        0 -> 0;
        _ -> go(M2, P + 1, -Acc)
    end;
go(M, P, Acc) -> go(M, P + 1, Acc).

main() ->
    io:format("~s~n", [string:join([integer_to_list(mobius(N)) || N <- lists:seq(1, 30)], " ")]).
