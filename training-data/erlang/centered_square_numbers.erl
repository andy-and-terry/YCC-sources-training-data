-module(centered_square_numbers).
-export([main/0]).

%% Centered square numbers: n^2 + (n+1)^2.
main() ->
    L = [N * N + (N + 1) * (N + 1) || N <- lists:seq(0, 9)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
