-module(interleave_strings).
-export([main/0, interleave/1]).

interleave(Strings) ->
    case [S || S <- Strings, S =/= []] of
        [] -> [];
        Live -> [hd(S) || S <- Live] ++ interleave([tl(S) || S <- Live])
    end.

main() ->
    io:format("~s~n", [interleave(["abc", "12345"])]),
    io:format("~s~n", [interleave(["ab", "cd", "efg"])]).
