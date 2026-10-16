-module(macro_demo).
-export([run/0]).

-define(PI, 3.14159).
-define(SQUARE(X), ((X) * (X))).
-define(DEBUG(Msg), io:format("[~s:~p] ~s~n", [?MODULE, ?LINE, Msg])).

-ifdef(NOT_DEFINED).
-define(MODE, special).
-else.
-define(MODE, normal).
-endif.

run() ->
    io:format("area=~.3f~n", [?PI * ?SQUARE(2)]),
    ?DEBUG("macro with line number"),
    io:format("mode=~p~n", [?MODE]),
    io:format("~p~n", [?MODULE_STRING]).
