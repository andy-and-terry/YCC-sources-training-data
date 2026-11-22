-module(practical_numbers).
-export([main/0]).

%% Practical numbers: every m in 1..n is a sum of distinct divisors of n.
is_practical(N) ->
    Reach = lists:foldl(
        fun(D, Acc) ->
            case N rem D of
                0 -> Acc bor (Acc bsl D);
                _ -> Acc
            end
        end, 1, lists:seq(1, N)),
    Mask = (1 bsl (N + 1)) - 1,
    (Reach band Mask) =:= Mask.

main() ->
    L = [N || N <- lists:seq(1, 40), is_practical(N)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
