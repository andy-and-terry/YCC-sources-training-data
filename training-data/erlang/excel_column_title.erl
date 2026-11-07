-module(excel_column_title).
-export([run/0, title/1]).

title(0) -> [];
title(N) -> title((N - 1) div 26) ++ [$A + (N - 1) rem 26].

run() ->
    io:format("~s ~s~n", [title(28), title(701)]).
