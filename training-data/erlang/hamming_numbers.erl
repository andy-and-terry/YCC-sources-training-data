-module(hamming_numbers).
-export([main/0]).

%% Hamming numbers (5-smooth): only prime factors 2, 3 and 5
strip(N, P) when N rem P =:= 0 -> strip(N div P, P);
strip(N, _) -> N.

is_hamming(N) -> strip(strip(strip(N, 2), 3), 5) =:= 1.

take(0, _) -> [];
take(Count, N) ->
    case is_hamming(N) of
        true -> [N | take(Count - 1, N + 1)];
        false -> take(Count, N + 1)
    end.

main() ->
    io:format("~s~n", [string:join([integer_to_list(H) || H <- take(20, 1)], " ")]).
