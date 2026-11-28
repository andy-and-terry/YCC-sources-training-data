-module(sierpinski_triangle).
-export([main/0]).

main() ->
    N = 8,
    [io:format("~s~s~n", [lists:duplicate(N - R - 1, $\s),
                          lists:append([case R band C of C -> "* "; _ -> "  " end || C <- lists:seq(0, R)])])
     || R <- lists:seq(0, N - 1)].
