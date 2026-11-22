-module(lazy_caterer_numbers).
-export([main/0]).

%% Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
main() ->
    L = [N * (N + 1) div 2 + 1 || N <- lists:seq(0, 9)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
