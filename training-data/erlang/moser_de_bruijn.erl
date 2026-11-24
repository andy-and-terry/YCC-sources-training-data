-module(moser_de_bruijn).
-export([main/0]).

%% Moser-de Bruijn sequence: binary digits of n read in base 4.
moser(0) -> 0;
moser(N) -> (N band 1) + 4 * moser(N bsr 1).

main() ->
    L = [moser(N) || N <- lists:seq(0, 11)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
