-module(repunit_numbers).
-export([main/0]).

%% Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
repunits(0, _) -> [];
repunits(K, R) -> [R | repunits(K - 1, R * 10 + 1)].

main() ->
    io:format("~s~n", [string:join([integer_to_list(X) || X <- repunits(8, 1)], " ")]).
