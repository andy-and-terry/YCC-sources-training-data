-module(triangular_check).
-export([main/0]).

%% N is triangular iff 8N + 1 is a perfect square.
is_triangular(N) ->
    S = 8 * N + 1,
    R = round(math:sqrt(S)),
    R * R =:= S.

main() ->
    Out = [N || N <- lists:seq(0, 20), is_triangular(N)],
    io:format("~s~n", [string:join([integer_to_list(N) || N <- Out], " ")]).
